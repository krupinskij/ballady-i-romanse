import { ballads } from '@model';
import {
  balladDTOSchema,
  balladInfoMapper,
  balladMapper,
  contentMapper,
  mottoDTOSchema,
  mottoMapper,
  noteMapper,
} from '@schema';
import type { APIRoute } from 'astro';
import { z } from 'zod';

export const GET: APIRoute = async ({ locals, params }) => {
  const key = params.key;
  const db = locals.runtime.env.DB;

  const balladDTO = balladDTOSchema
    .nullable()
    .parse(await db.prepare('SELECT * FROM ballads WHERE key = ?').bind(key).first());

  if (!balladDTO) {
    return new Response(JSON.stringify({ title: 'dupa' }));
  }

  const ballad = balladMapper.parse(balladDTO);

  const prevBalladDTO = balladDTOSchema
    .nullable()
    .parse(await db.prepare('SELECT * FROM ballads WHERE id = ?').bind(balladDTO.prev_id).first());
  const nextBalladDTO = balladDTOSchema
    .nullable()
    .parse(await db.prepare('SELECT * FROM ballads WHERE id = ?').bind(balladDTO.next_id).first());

  ballad.prev = balladInfoMapper.nullable().parse(prevBalladDTO);
  ballad.next = balladInfoMapper.nullable().parse(nextBalladDTO);

  const { results: contents } = await db
    .prepare('SELECT *, c_text as text FROM contents WHERE ballad_id = ? ORDER BY c_order')
    .bind(balladDTO.id)
    .all();

  ballad.contents = z.array(contentMapper).parse(contents);

  const { results: notes } = await db
    .prepare('SELECT *, n_text as text FROM notes WHERE ballad_id = ? ORDER BY n_order')
    .bind(balladDTO.id)
    .all();

  ballad.notes = z.array(noteMapper).parse(notes);

  const motto = mottoDTOSchema
    .nullable()
    .parse(await db.prepare('SELECT * FROM mottos WHERE ballad_id = ?').bind(balladDTO.id).first());

  ballad.motto = mottoMapper.nullable().parse(motto);

  return new Response(JSON.stringify(ballad));
};

export async function getStaticPaths() {
  return ballads.map((ballad) => ({ params: { key: ballad } }));
}
