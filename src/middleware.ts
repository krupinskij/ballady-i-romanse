import { defineMiddleware } from 'astro/middleware';

import i18next, { getSupportedLng, type SupportedLng } from './i18n';

const getDatabase = (lng: SupportedLng, env: Env): D1Database => {
  switch (lng) {
    case 'pl':
      return env.DB_PL;
    case 'ru':
      return env.DB_RU;
  }
};

export const onRequest = defineMiddleware((context, next) => {
  const supportedLng = getSupportedLng(new URL(context.request.url));
  const database = getDatabase(supportedLng, context.locals.runtime.env);

  context.locals.LANG = supportedLng;
  context.locals.DB = database;

  if (i18next.language !== supportedLng) {
    i18next.changeLanguage(supportedLng);
  }

  return next();
});
