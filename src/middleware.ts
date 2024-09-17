import { defineMiddleware } from 'astro/middleware';

import { database } from '@db';

import i18next, { isSupportedLng, supportedLngs } from './i18n';

export const onRequest = defineMiddleware((context, next) => {
  const lng = context.preferredLocale;
  const supportedLng = isSupportedLng(lng) ? lng : supportedLngs[0];

  context.locals.LANG = supportedLng;
  context.locals.DB = database;

  i18next.changeLanguage(supportedLng);

  return next();
});
