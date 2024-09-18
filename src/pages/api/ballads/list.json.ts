import type { APIRoute } from 'astro';

export const GET: APIRoute = async (context) => {
  const DB = context.locals.DB;
  const { ballads } = context.locals.SCHEMA;

  const results = await DB.select({ key: ballads.key, title: ballads.title })
    .from(ballads)
    .orderBy(ballads.order);

  return Response.json(results);
};
