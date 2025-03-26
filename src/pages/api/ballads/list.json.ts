import type { APIRoute } from 'astro';
import { z } from 'astro/zod';

import { ListSchema } from '@model';

export const GET: APIRoute = async (context) => {
  const DB = context.locals.DB;

  const listDB = await DB.prepare(
    `
    SELECT id, title
    FROM Ballad
    ORDER BY ordinal  
  `
  ).run();

  const list = z.array(ListSchema).parse(listDB.results);

  console.log(list);

  return Response.json(list);
};
