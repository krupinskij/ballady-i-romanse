import type { APIRoute } from 'astro';

import { database, schemaByLng } from '@db';

export const GET: APIRoute = async (context) => {
  const DB = database;
  const { ballads } = schemaByLng[context.locals.LANG];

  const results = await DB.select({ key: ballads.key, title: ballads.title })
    .from(ballads)
    .orderBy(ballads.order);

  return Response.json(results);
};
