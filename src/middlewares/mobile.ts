import { defineMiddleware } from 'astro:middleware';

export default defineMiddleware(async (context, next) => {
  const headers = context.request.headers;
  const userAgent = headers.get('User-Agent');

  const isMobile = userAgent?.includes('mobi') || userAgent?.includes('Mobi') || false;

  context.locals.DEVICE = isMobile ? 'mobile' : 'desktop';

  return next();
});
