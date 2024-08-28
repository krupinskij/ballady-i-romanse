import { eq } from 'drizzle-orm';
import { drizzle } from 'drizzle-orm/libsql';

import db from './database';
import { readTomlFile } from './helpers';
import { ballads, contents, mottos, notes } from './schema';

export const keys = [
  'pierwiosnek',
  'romantycznosc',
  'switez',
  'switezianka',
  'rybka',
  'powrot-taty',
  'kurhanek-maryli',
  'do-przyjaciol',
  'to-lubie',
  'rekawiczka',
  'pani-twardowska',
  'tukaj-albo-proby-przyjazni',
  'lilije',
  'dudarz',
];

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

// balladsDbData.map(async (ballad, i, all) => {
//   if (i > 0) {
//     await db
//       .update(ballads)
//       .set({ prevId: all[i - 1].id })
//       .where(eq(ballads.id, ballad.id));
//   }

//   if (i < all.length - 1) {
//     await db
//       .update(ballads)
//       .set({ nextId: all[i + 1].id })
//       .where(eq(ballads.id, ballad.id));
//   }
// });

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
  balladsOriginData.flatMap((ballad, bOrder) =>
    ballad.contents.map((content, order) => ({
      balladId: balladsDbData[bOrder].id,
      order,
      character: content.character,
      text: content.text,
    }))
  )
);

console.log('Seed contents complete!');

await db.insert(notes).values(
  balladsOriginData.flatMap(
    (ballad, bOrder) =>
      ballad.notes?.map((note, order) => ({
        balladId: balladsDbData[bOrder].id,
        order,
        text: note,
      })) || []
  )
);

console.log('Seed notes complete!');

await db.insert(mottos).values(
  balladsOriginData
    .filter((ballad) => !!ballad.motto)
    .map((ballad, bOrder) => ({
      balladId: balladsDbData[bOrder].id,
      text: ballad.motto!.text,
      author: ballad.motto!.author,
      translation: ballad.motto!.translation,
    }))
);

console.log('Seed mottos complete!');

console.log('Seed complete!');
