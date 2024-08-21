import type { APIRoute } from 'astro';

export const prerender = false;
export const GET: APIRoute = async ({ locals }) => {
  const db = locals.runtime.env.DB;

  const { results } = await db.prepare('SELECT key, title FROM ballads ORDER BY b_order ASC').all();

  return Response.json(results);
};
