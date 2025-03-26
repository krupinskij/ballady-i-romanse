import fs from 'fs';
import fsp from 'fs/promises';

import { isSupportedLng, type SupportedLng } from '@i18n';

import { readTomlFile } from './helpers';

const getDataDirPath = (lng: SupportedLng) => `database/${lng}/data`;
const getMigrationsDirPath = (lng: SupportedLng) => `database/${lng}/migrations`;

class WriteStream {
  private writeStream: fs.WriteStream;
  constructor(path: string) {
    this.writeStream = fs.createWriteStream(path);

    this.writeStream.on('close', () => {
      process.exit(0);
    });
  }

  async write(chunk: string) {
    return new Promise((res, rej) => this.writeStream.write(chunk, (e) => (!!e ? rej() : res(''))));
  }

  close() {
    this.writeStream.close();
  }
}

function sql(strings: TemplateStringsArray, ...values: Array<string | number | undefined>) {
  let str = '';

  for (let i = 0; i < values.length; i++) {
    const value = values[i];
    const valueStr = typeof value === 'string' ? `"${value}"` : (value?.toString() ?? `null`);
    str += strings[i] + valueStr;
  }
  str += strings[strings.length - 1];

  return str;
}

async function main() {
  const lng = process.argv[2] || undefined;
  const filename = process.argv[3] || undefined;

  if (!isSupportedLng(lng)) {
    throw new Error(`Language "${lng}" isn't supported.`);
  }

  if (!filename) {
    throw new Error(`No filename provided.`);
  }

  console.log(`Seed for language "${lng}"`);

  console.log('Running seeds');

  const migrationsDirPath = getMigrationsDirPath(lng);
  const migrationFilePaths = await fsp.readdir(migrationsDirPath);

  const num = String(migrationFilePaths.length + 1).padStart(4, '0');
  const writeStream = new WriteStream(`${migrationsDirPath}/${num}_${filename}.sql`);
  writeStream.write(`-- Migration number: ${num} 	 ${new Date().toISOString()}\n`);

  await seed(lng, writeStream);

  writeStream.close();

  console.log('Seeded successfully');
}

async function seed(lng: SupportedLng, writeStream: WriteStream) {
  const dataDirPath = getDataDirPath(lng);
  const dataFilePaths = await fsp.readdir(dataDirPath);

  const ballads = dataFilePaths
    .map((filePath) => readTomlFile(`${dataDirPath}/${filePath}`))
    .sort((b1, b2) => b1.ordinal - b2.ordinal);

  await writeStream.write(`DELETE FROM Note;\n`);
  await writeStream.write(`DELETE FROM Annotation;\n`);
  await writeStream.write(`DELETE FROM Content;\n`);
  await writeStream.write(`DELETE FROM Motto;\n`);
  await writeStream.write(`DELETE FROM Ballad;\n`);
  await writeStream.write(`\n`);

  // await db.delete(annotations);
  // await db.delete(mottos);
  // await db.delete(notes);
  // await db.delete(contents);
  // await db.delete(ballads);

  await writeStream.write(`INSERT INTO Ballad (id, title, ordinal, link)\n`);
  await writeStream.write(`\tVALUES\n`);
  for (let i = 0; i < ballads.length; i++) {
    const ballad = ballads[i];
    await writeStream.write(
      sql`\t\t(${ballad.id}, ${ballad.title}, ${ballad.ordinal}, ${ballad.link})`
    );

    if (i === ballads.length - 1) {
      await writeStream.write(`;\n\n`);
    } else {
      await writeStream.write(`,\n`);
    }
  }

  // const balladsDbData = await db
  //   .insert(ballads)
  //   .values(
  //     balladsOriginData.map((ballad) => ({
  //       id: ballad.id,
  //       title: ballad.title,
  //       order: ballad.order,
  //       link: ballad.link,
  //     }))
  //   )
  //   .returning({ id: ballads.id, order: ballads.order });

  for (let i = 0; i < ballads.length; i++) {
    const ballad = ballads[i];
    const isPrev = i > 0;
    const isNext = i < ballads.length - 1;

    await writeStream.write(`UPDATE Ballad\n`);
    await writeStream.write(`SET\n`);

    if (isPrev) {
      await writeStream.write(sql`\tprevId = ${ballads[i - 1].id}`);
      if (isNext) {
        await writeStream.write(`,`);
      }
      await writeStream.write(`\n`);
    }

    if (isNext) {
      await writeStream.write(sql`\tnextId = ${ballads[i + 1].id}\n`);
    }

    await writeStream.write(sql`WHERE id = ${ballad.id};\n\n`);
  }

  // balladsDbData.sort((b1, b2) => b1.order - b2.order);

  // for (let i = 0; i < balladsDbData.length; i++) {
  //   const ballad = balladsDbData[i];
  //   if (i > 0) {
  //     await db
  //       .update(ballads)
  //       .set({ prevId: balladsDbData[i - 1].id })
  //       .where(eq(ballads.id, ballad.id));
  //   }

  //   if (i < balladsDbData.length - 1) {
  //     await db
  //       .update(ballads)
  //       .set({ nextId: balladsDbData[i + 1].id })
  //       .where(eq(ballads.id, ballad.id));
  //   }
  // }

  // console.log('Seed ballads complete!');

  await writeStream.write(`INSERT INTO Content (balladId, ordinal, speaker, body)\n`);
  await writeStream.write(`\tVALUES\n`);

  const contents = ballads.flatMap((ballad) => ballad.contents);
  for (let i = 0; i < contents.length; i++) {
    const content = contents[i];
    await writeStream.write(
      sql`\t\t(${content.balladId}, ${content.ordinal}, ${content.speaker}, ${content.body})`
    );

    if (i === contents.length - 1) {
      await writeStream.write(`;\n\n`);
    } else {
      await writeStream.write(`,\n`);
    }
  }

  // await db.insert(contents).values(
  //   balladsOriginData.flatMap((ballad) =>
  //     ballad.contents.map((content, order) => ({
  //       balladId: balladsDbData[ballad.order].id,
  //       order,
  //       character: content.character,
  //       text: content.text,
  //     }))
  //   )
  // );

  // console.log('Seed contents complete!');

  await writeStream.write(`INSERT INTO Note (balladId, ordinal, body)\n`);
  await writeStream.write(`\tVALUES\n`);

  const notes = ballads.flatMap((ballad) => ballad.notes);
  for (let i = 0; i < notes.length; i++) {
    const note = notes[i];
    await writeStream.write(sql`\t\t(${note.balladId}, ${note.ordinal}, ${note.body})`);

    if (i === notes.length - 1) {
      await writeStream.write(`;\n\n`);
    } else {
      await writeStream.write(`,\n`);
    }
  }

  // await db.insert(notes).values(
  //   balladsOriginData.flatMap(
  //     (ballad) =>
  //       ballad.notes?.map((note, order) => ({
  //         balladId: balladsDbData[ballad.order].id,
  //         order,
  //         text: note,
  //       })) || []
  //   )
  // );

  // console.log('Seed notes complete!');

  await writeStream.write(`INSERT INTO Motto (balladId, body, author, translation)\n`);
  await writeStream.write(`\tVALUES\n`);

  const mottos = ballads.flatMap((ballad) => ballad.mottos);
  for (let i = 0; i < mottos.length; i++) {
    const motto = mottos[i];
    await writeStream.write(
      sql`\t\t(${motto.balladId}, ${motto.body}, ${motto.author}, ${motto.translation})`
    );

    if (i === mottos.length - 1) {
      await writeStream.write(`;\n\n`);
    } else {
      await writeStream.write(`,\n`);
    }
  }

  // const mottoValues = balladsOriginData
  //   .filter((ballad) => !!ballad.motto)
  //   .map((ballad) => ({
  //     balladId: balladsDbData[ballad.order].id,
  //     text: ballad.motto!.text,
  //     author: ballad.motto!.author,
  //     translation: ballad.motto!.translation,
  //   }));
  // if (mottoValues.length > 0) {
  //   await db.insert(mottos).values(mottoValues);
  // }

  // console.log('Seed mottos complete!');

  await writeStream.write(`INSERT INTO Annotation (balladId, id, body)\n`);
  await writeStream.write(`\tVALUES\n`);

  const annotations = ballads.flatMap((ballad) => ballad.annotations);
  for (let i = 0; i < annotations.length; i++) {
    const annotation = annotations[i];
    await writeStream.write(
      sql`\t\t(${annotation.balladId}, ${annotation.id}, ${annotation.body})`
    );

    if (i === annotations.length - 1) {
      await writeStream.write(`;\n\n`);
    } else {
      await writeStream.write(`,\n`);
    }
  }

  // await db.insert(annotations).values(
  //   balladsOriginData.flatMap(
  //     (ballad) =>
  //       ballad.annotations?.map((annotation) => ({
  //         balladId: balladsDbData[ballad.order].id,
  //         id: annotation.id,
  //         text: annotation.text,
  //       })) || []
  //   )
  // );

  console.log('Seed annotations complete!');
}

main().catch((e) => {
  console.error('Seed failed');
  console.error(e);
  process.exit(1);
});
