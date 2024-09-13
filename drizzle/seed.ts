import { eq } from 'drizzle-orm';
import type { LibSQLDatabase } from 'drizzle-orm/libsql';

import { annotations, ballads, contents, databases, mottos, notes } from '@db';
import { isSupportedLang } from '@i18n';
import { keys } from '@model';

import { readTomlFile } from './helpers';

async function main() {
  const lang = process.argv[2] || undefined;

  if (lang !== undefined && !isSupportedLang(lang)) {
    throw new Error(`Language "${lang}" isn't supported.`);
  } else if (!lang) {
    console.log('Empty language. Seed for all databases.');
  } else {
    console.log(`Seed for language "${lang}"`);
  }

  const dbs = !lang ? Object.entries(databases) : [[lang, databases[lang]] as const];

  console.log('Running seeds');

  const result = await Promise.allSettled(dbs.map(([lang, db]) => seed(lang, db)));

  console.log('Seeded successfully', result);

  process.exit(0);
}

async function seed(lang: string, db: LibSQLDatabase<Record<string, never>>) {
  const balladsOriginData = keys.map((key) => readTomlFile(`./drizzle/data/${lang}/${key}.toml`));

  await db.delete(annotations);
  await db.delete(mottos);
  await db.delete(notes);
  await db.delete(contents);
  await db.delete(ballads);

  const balladsDbData = await db
    .insert(ballads)
    .values(
      balladsOriginData.map((ballad) => ({
        key: ballad.key,
        title: ballad.title,
        order: ballad.order,
        link: ballad.link,
      }))
    )
    .returning({ id: ballads.id, order: ballads.order });

  balladsDbData.sort((b1, b2) => b1.order - b2.order);

  for (let i = 0; i < balladsDbData.length; i++) {
    const ballad = balladsDbData[i];
    if (i > 0) {
      await db
        .update(ballads)
        .set({ prevId: balladsDbData[i - 1].id })
        .where(eq(ballads.id, ballad.id));
    }

    if (i < balladsDbData.length - 1) {
      await db
        .update(ballads)
        .set({ nextId: balladsDbData[i + 1].id })
        .where(eq(ballads.id, ballad.id));
    }
  }

  console.log('Seed ballads complete!');

  await db.insert(contents).values(
    balladsOriginData.flatMap((ballad) =>
      ballad.contents.map((content, order) => ({
        balladId: balladsDbData[ballad.order].id,
        order,
        character: content.character,
        text: content.text,
      }))
    )
  );

  console.log('Seed contents complete!');

  await db.insert(notes).values(
    balladsOriginData.flatMap(
      (ballad) =>
        ballad.notes?.map((note, order) => ({
          balladId: balladsDbData[ballad.order].id,
          order,
          text: note,
        })) || []
    )
  );

  console.log('Seed notes complete!');

  const mottoValues = balladsOriginData
    .filter((ballad) => !!ballad.motto)
    .map((ballad) => ({
      balladId: balladsDbData[ballad.order].id,
      text: ballad.motto!.text,
      author: ballad.motto!.author,
      translation: ballad.motto!.translation,
    }));
  if (mottoValues.length > 0) {
    await db.insert(mottos).values(mottoValues);
  }

  console.log('Seed mottos complete!');

  await db.insert(annotations).values(
    balladsOriginData.flatMap(
      (ballad) =>
        ballad.annotations?.map((annotation) => ({
          balladId: balladsDbData[ballad.order].id,
          key: annotation.key,
          text: annotation.text,
        })) || []
    )
  );

  console.log('Seed annotations complete!');
}

main().catch((e) => {
  console.error('Seed failed');
  console.error(e);
  process.exit(1);
});
