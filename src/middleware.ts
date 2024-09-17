import { defineMiddleware } from 'astro/middleware';

import { database, schemaByLng } from '@db';

import i18next, { isSupportedLng, supportedLngs } from './i18n';

export const onRequest = defineMiddleware((context, next) => {
  const lng = context.preferredLocale;
  const supportedLng = isSupportedLng(lng) ? lng : supportedLngs[0];

  i18next.changeLanguage(supportedLng);

  context.locals.DB = database;
  context.locals.SCHEMA = schemaByLng[supportedLng];

  return next();
});
