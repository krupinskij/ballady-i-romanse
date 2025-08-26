import { defineMiddleware } from 'astro:middleware';

const VERSION = '2.0.0';

export default defineMiddleware(async (context, next) => {
  context.cookies.set('version', VERSION, { httpOnly: true, secure: true, path: '/' });

  return next();
});
