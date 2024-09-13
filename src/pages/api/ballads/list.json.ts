import type { APIRoute } from 'astro';

import { ballads } from '@db';

export const GET: APIRoute = async (context) => {
  const DB = context.locals.DB;
  const results = await DB.select({ key: ballads.key, title: ballads.title })
    .from(ballads)
    .orderBy(ballads.order);

  return Response.json(results);
};
