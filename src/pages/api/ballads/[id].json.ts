import type { APIRoute } from 'astro';
import { z } from 'astro/zod';

import {
  AnnotationDBSchema,
  BalladDBSchema,
  ContentDBSchema,
  MottoDBSchema,
  NoteDBSchema,
} from '@database';
import { ids } from '@model';

export const GET: APIRoute = async ({ locals, params, redirect, rewrite, url }) => {
  const id = params.id;
  const DB = locals.DB;

  if (!id || !ids.includes(id)) {
    return redirect('/');
  }

  const balladDB = await DB.prepare(`SELECT * FROM Ballad WHERE id = ?`).bind(id).run();

  const ballad = BalladDBSchema.parse(balladDB.results[0]);

  const prevBalladStm = DB.prepare(`SELECT * FROM Ballad WHERE id = ?`).bind(ballad.prevId);
  const nextBalladStm = DB.prepare(`SELECT * FROM Ballad WHERE id = ?`).bind(ballad.nextId);

  const annotationsStm = DB.prepare(`SELECT * FROM Annotation WHERE balladId = ? ORDER BY id`).bind(
    ballad.id
  );
  const contentsStm = DB.prepare(`SELECT * FROM Content WHERE balladId = ? ORDER BY ordinal`).bind(
    ballad.id
  );
  const mottosStm = DB.prepare(`SELECT * FROM Motto WHERE balladId = ?`).bind(ballad.id);
  const notesStm = DB.prepare(`SELECT * FROM Note WHERE balladId = ? ORDER BY ordinal`).bind(
    ballad.id
  );

  const [prevBalladDB, nextBalladDB, annotationsDB, contentsDB, mottosDB, notesDB] = await DB.batch(
    [prevBalladStm, nextBalladStm, annotationsStm, contentsStm, mottosStm, notesStm]
  );

  const prevBallad = ballad.prevId ? BalladDBSchema.parse(prevBalladDB.results[0]) : null;
  const nextBallad = ballad.nextId ? BalladDBSchema.parse(nextBalladDB.results[0]) : null;

  const annotations = z.array(AnnotationDBSchema).parse(annotationsDB.results);
  const contents = z.array(ContentDBSchema).parse(contentsDB.results);
  const mottos = z.array(MottoDBSchema).parse(mottosDB.results);
  const notes = z.array(NoteDBSchema).parse(notesDB.results);

  return Response.json({
    id: ballad.id,
    title: ballad.title,
    link: ballad.link,
    ordinal: ballad.ordinal,
    prevBallad,
    nextBallad,
    annotations,
    contents,
    mottos,
    notes,
  });
};
