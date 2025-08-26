import { defineMiddleware } from 'astro:middleware';

const VERSION = '2.0.1';

export default defineMiddleware(async (context, next) => {
  context.cookies.set('version', VERSION, { httpOnly: true, secure: true, path: '/' });

  return next();
});
