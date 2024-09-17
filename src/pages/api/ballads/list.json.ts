import { createClient } from '@libsql/client';
import type { APIRoute } from 'astro';
import { drizzle } from 'drizzle-orm/libsql';

import { getSchema } from '@db';

export const GET: APIRoute = async (context) => {
  const DB = drizzle(
    createClient({
      url: process.env.DATABASE_URL || import.meta.env.DATABASE_URL!,
      authToken: process.env.DATABASE_TOKEN || import.meta.env.DATABASE_TOKEN!,
    })
  );
  const { ballads } = getSchema('pl');

  const results = await DB.select({ key: ballads.key, title: ballads.title })
    .from(ballads)
    .orderBy(ballads.order);

  return Response.json(results);
};
