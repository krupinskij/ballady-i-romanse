import { eq } from 'drizzle-orm';

import { ballads, contents, db, mottos, notes } from '@db';
import { keys } from '@model';

import { readTomlFile } from './helpers';

const balladsOriginData = keys.map((key) => readTomlFile(`./db/data/${key}.toml`));

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

await db.insert(mottos).values(
  balladsOriginData
    .filter((ballad) => !!ballad.motto)
    .map((ballad) => ({
      balladId: balladsDbData[ballad.order].id,
      text: ballad.motto!.text,
      author: ballad.motto!.author,
      translation: ballad.motto!.translation,
    }))
);

console.log('Seed mottos complete!');

console.log('Seed complete!');
