import type { APIRoute } from 'astro';

import { getDatabase, getSchema } from '@db';

export const GET: APIRoute = async (context) => {
  const DB = getDatabase();
  const { ballads } = getSchema(context.locals.LANG);

  const results = await DB.select({ key: ballads.key, title: ballads.title })
    .from(ballads)
    .orderBy(ballads.order);

  return Response.json(results);
};
