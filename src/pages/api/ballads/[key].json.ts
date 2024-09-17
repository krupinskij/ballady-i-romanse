import type { APIRoute } from 'astro';
import { aliasedTable, eq } from 'drizzle-orm';

import { getDatabase, getSchema } from '@db';
import type { Ballad, DB } from '@model';

type QueryResult = {
  ballads: DB.Ballad;
  prevBallad: DB.Ballad | null;
  nextBallad: DB.Ballad | null;
  annotations: DB.Annotation | null;
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
  const annotationsMap =
    firstResult.annotations &&
    new Map(queryResult.map((result) => [result.annotations!.key, result.annotations!]));

  const ballad = {
    ...ballads,
    prevBallad,
    nextBallad,
    motto: mottos,
    notes: notesMap ? Array.from(notesMap.values()).sort((n1, n2) => n1.order - n2.order) : [],
    contents: Array.from(contentsMap.values()).sort((c1, c2) => c1.order - c2.order),
    annotations: annotationsMap
      ? Array.from(annotationsMap?.values()).sort((a1, a2) => a1.key - a2.key)
      : [],
  };

  return ballad;
};

export const GET: APIRoute = async ({ locals, params, redirect }) => {
  const key = params.key;
  const DB = getDatabase();
  const { annotations, ballads, contents, mottos, notes } = getSchema('pl');

  if (!key) {
    return redirect('/');
  }

  const _ballads = aliasedTable(ballads, 'ballads');
  const _prevBallad = aliasedTable(ballads, 'prevBallad');
  const _nextBallad = aliasedTable(ballads, 'nextBallad');
  const _mottos = aliasedTable(mottos, 'mottos');
  const _notes = aliasedTable(notes, 'notes');
  const _annotations = aliasedTable(annotations, 'annotations');
  const _contents = aliasedTable(contents, 'contents');

  const queryResult = await DB.select()
    .from(_ballads)
    .where(eq(_ballads.key, key))
    .leftJoin(_prevBallad, eq(_ballads.prevId, _prevBallad.id))
    .leftJoin(_nextBallad, eq(_ballads.nextId, _nextBallad.id))
    .leftJoin(_mottos, eq(_ballads.id, _mottos.balladId))
    .leftJoin(_notes, eq(_ballads.id, _notes.balladId))
    .leftJoin(_annotations, eq(_ballads.id, _annotations.balladId))
    .innerJoin(_contents, eq(_ballads.id, _contents.balladId));

  const ballad = mapQueryResult(queryResult as any as QueryResult[]);

  return new Response(JSON.stringify(ballad));
};
