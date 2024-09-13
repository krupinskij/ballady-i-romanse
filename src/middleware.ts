import { defineMiddleware } from 'astro/middleware';

import { databases } from '@db';

import i18next, { isSupportedLng, supportedLngs } from './i18n';

export const onRequest = defineMiddleware((context, next) => {
  const lng = context.preferredLocale;
  const supportedLng = isSupportedLng(lng) ? lng : supportedLngs[0];

  i18next.changeLanguage(supportedLng);
  context.locals.DB = databases[supportedLng];

  return next();
});
