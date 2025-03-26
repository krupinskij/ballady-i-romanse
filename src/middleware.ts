import { defineMiddleware } from 'astro/middleware';

import i18next, { getSupportedLng } from './i18n';

export const onRequest = defineMiddleware((context, next) => {
  const supportedLng = getSupportedLng(new URL(context.request.url));

  context.locals.LANG = supportedLng;
  context.locals.DB = context.locals.runtime.env.DB_PL;

  if (i18next.language !== supportedLng) {
    i18next.changeLanguage(supportedLng);
  }

  return next();
});
