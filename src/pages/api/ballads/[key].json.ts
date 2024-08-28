import type { APIRoute } from 'astro';
import { aliasedTable, eq } from 'drizzle-orm';

import { ballads, contents, db, keys, mottos, notes } from '@db';
import type { Ballad, DB } from '@model';

type QueryResult = {
  ballads: DB.Ballad;
  prevBallad: DB.Ballad | null;
  nextBallad: DB.Ballad | null;
  mottos: DB.Motto | null;
  notes: DB.Note | null;
  contents: DB.Content;
};

const mapQueryResult = (queryResult: QueryResult[]): Ballad => {
  const firstResult = queryResult[0];
  const { ballads, prevBallad, nextBallad, mottos } = firstResult;
  const notesMap =
    firstResult.notes && new Map(queryResult.map((result) => [result.notes!.order, result.notes!]));
  const contentsMap = new Map(
    queryResult.map((result) => [result.contents.order, result.contents])
  );

  const ballad = {
    ...ballads,
    prevBallad,
    nextBallad,
    motto: mottos,
    notes: notesMap ? Array.from(notesMap.values()).sort((n1, n2) => n1.order - n2.order) : [],
    contents: Array.from(contentsMap.values()).sort((c1, c2) => c1.order - c2.order),
  };

  return ballad;
};

export const GET: APIRoute = async ({ params }) => {
  const key = params.key;

  const prevBallad = aliasedTable(ballads, 'prevBallad');
  const nextBallad = aliasedTable(ballads, 'nextBallad');
  const queryResult = await db
    .select()
    .from(ballads)
    .where(eq(ballads.key, key!))
    .leftJoin(prevBallad, eq(ballads.prevId, prevBallad.id))
    .leftJoin(nextBallad, eq(ballads.nextId, nextBallad.id))
    .leftJoin(mottos, eq(ballads.id, mottos.balladId))
    .leftJoin(notes, eq(ballads.id, notes.balladId))
    .innerJoin(contents, eq(ballads.id, contents.balladId));

  const ballad = mapQueryResult(queryResult as any as QueryResult[]);

  return new Response(JSON.stringify(ballad));
};

export async function getStaticPaths() {
  return keys.map((key) => ({ params: { key } }));
}
