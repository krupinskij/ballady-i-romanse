import { defineMiddleware } from 'astro:middleware';

import i18next, { isSupportedLng, supportedLngs, type SupportedLng } from '@i18n';

const getDatabase = (lng: SupportedLng, env: Env): D1Database => {
  switch (lng) {
    case 'pl':
      return env.DB_PL;
    case 'ru':
      return env.DB_RU;
  }
};

export default defineMiddleware((context, next) => {
  const lang = context.currentLocale || context.preferredLocale || 'pl';
  const isLocalePath = supportedLngs.some((lng) => context.url.pathname.startsWith(`/${lng}/`));

  if (isLocalePath) {
    const supportedLng = isSupportedLng(context.currentLocale) ? context.currentLocale : 'pl';
    const database = getDatabase(supportedLng, context.locals.runtime.env);

    context.locals.DB = database;

    if (i18next.language !== supportedLng) {
      i18next.changeLanguage(supportedLng);
    }

    return next();
  }

  const isClientPath = context.url.pathname === '/' || context.url.pathname.startsWith('/ballada/');

  if (isClientPath) {
    const localeUrl = `/${lang}${context.url.pathname}`;
    return context.redirect(localeUrl, 302);
  }

  return next();
});
