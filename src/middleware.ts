import { defineMiddleware } from 'astro/middleware';

import { databases } from '@db';

import { isSupportedLang, supportedLangs } from './i18n';

export const onRequest = defineMiddleware((context, next) => {
  const lang = context.preferredLocale;

  context.locals.DB = databases[isSupportedLang(lang) ? lang : supportedLangs[0]];

  return next();
});
