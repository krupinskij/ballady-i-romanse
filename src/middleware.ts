import { defineMiddleware, sequence } from 'astro/middleware';

import i18next, { getSupportedLng, type SupportedLng } from './i18n';

const headers = defineMiddleware(async (context, next) => {
  const url = new URL(context.url);

  const response = await next();
  const headers = response.headers;

  // /*
  headers.append(
    'Content-Security-Policy',
    `default-src 'self'; style-src 'unsafe-inline'  ${url.origin}; script-src 'unsafe-inline' ${url.origin}; frame-ancestors 'none'; form-action 'self'`
  );
  headers.append('Referrer-Policy', 'no-referrer');
  headers.append('X-Frame-Options', 'DENY');
  headers.append('X-Content-Type-Options', 'nosniff');
  headers.append('Strict-Transport-Security', 'max-age=60; includeSubDomains; preload');

  // /api/*
  if (url.pathname.startsWith('/api/')) {
    return Response.json({ headers }, { status: 403 });
  }

  if (url.pathname.startsWith('/ballada/')) {
    headers.append('Cache-Control', 'max-age=36000, public');
    headers.append('Vary', 'Accept-Language');
  }

  if (url.pathname.endsWith('.ttf')) {
    headers.append('Cache-Control', 'max-age=36000, public');
  }

  if (url.pathname.includes('pages.dev/')) {
    headers.append('X-Robots-Tag', 'noindex');
  }

  return response;
});

const getDatabase = (lng: SupportedLng, env: Env): D1Database => {
  switch (lng) {
    case 'pl':
      return env.DB_PL;
    case 'ru':
      return env.DB_RU;
  }
};

const locals = defineMiddleware((context, next) => {
  const supportedLng = getSupportedLng(new URL(context.request.url));
  const database = getDatabase(supportedLng, context.locals.runtime.env);

  context.locals.LANG = supportedLng;
  context.locals.DB = database;

  if (i18next.language !== supportedLng) {
    i18next.changeLanguage(supportedLng);
  }

  return next();
});

export const onRequest = sequence(headers, locals);
