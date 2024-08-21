import type { Ballad } from '@model';
import type { APIRoute } from 'astro';

export const GET: APIRoute = async ({ locals, params }) => {
  const key = params.key;
  const db = locals.runtime.env.DB;

  const ballad = await db.prepare('SELECT * FROM ballads WHERE key = ?').bind(key).first();

  if (!ballad) {
    return new Response(JSON.stringify({ title: 'dupa' }));
  }

  const prevBallad = await db
    .prepare('SELECT * FROM ballads WHERE id = ?')
    .bind(ballad.prev_id)
    .first();
  const nextBallad = await db
    .prepare('SELECT * FROM ballads WHERE id = ?')
    .bind(ballad.next_id)
    .first();

  ballad.prev = prevBallad;
  ballad.next = nextBallad;

  const { results: contents } = await db
    .prepare('SELECT *, c_text as text FROM contents WHERE ballad_id = ? ORDER BY c_order')
    .bind(ballad.id)
    .all();

  ballad.contents = contents;

  const { results: notes } = await db
    .prepare('SELECT *, n_text as text FROM notes WHERE ballad_id = ? ORDER BY n_order')
    .bind(ballad.id)
    .all();

  ballad.notes = notes;

  const motto = await db
    .prepare('SELECT * FROM mottos WHERE ballad_id = ?')
    .bind(ballad.id)
    .first();

  ballad.motto = motto;

  return new Response(JSON.stringify(ballad));
};

export async function getStaticPaths() {
  const ballads: Ballad[] = await (
    await fetch('http://localhost:4321/api/ballads/list.json')
  ).json();

  return ballads.map((ballad) => ({ params: { key: ballad.key } }));
}
