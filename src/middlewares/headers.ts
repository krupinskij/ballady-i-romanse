import { defineMiddleware } from 'astro:middleware';

const MAX_AGE = 604800; // 60 * 60 * 24 * 7;

export default defineMiddleware(async (context, next) => {
  const url = new URL(context.url);

  const response = await next();
  const headers = response.headers;

  // /*
  headers.append('Referrer-Policy', 'no-referrer');
  headers.append('X-Frame-Options', 'DENY');
  headers.append('X-Content-Type-Options', 'nosniff');
  headers.append('Strict-Transport-Security', 'max-age=63072000; includeSubDomains; preload');

  // /api/*
  if (url.pathname.startsWith('/api/')) {
    return Response.json({ headers }, { status: 403 });
  }

  if (url.pathname === '/' || url.pathname.startsWith('/ballada/')) {
    headers.append('Cache-Control', `max-age=${MAX_AGE}, public`);
    headers.append('Vary', 'Cookie');
  }

  if (url.pathname.includes('pages.dev/')) {
    headers.append('X-Robots-Tag', 'noindex');
  }

  return response;
});
