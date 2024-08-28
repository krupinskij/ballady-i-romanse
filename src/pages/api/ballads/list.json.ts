import type { APIRoute } from 'astro';

import { ballads, db } from '@db';

export const GET: APIRoute = async () => {
  const results = await db
    .select({ key: ballads.key, title: ballads.title })
    .from(ballads)
    .orderBy(ballads.order);

  return Response.json(results);
};
