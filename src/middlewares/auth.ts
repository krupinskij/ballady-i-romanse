import { getSecret } from 'astro:env/server';
import { defineMiddleware } from 'astro:middleware';
import { compare } from 'bcrypt-ts';

export default defineMiddleware(async (context, next) => {
  const isPagesDev = context.url.hostname.includes('.pages.dev');
  const isAuth = context.url.pathname.startsWith('/auth');

  if (!isPagesDev) {
    if (isAuth) {
      return context.redirect('/');
    }

    return next();
  }

  const token = context.cookies.get('access-token');
  const isMatch = !!token && (await compare(getSecret('AUTH_PASS')!, token.value));

  if (isAuth && isMatch) {
    return context.redirect('/');
  }

  if (!isAuth && !isMatch) {
    return context.redirect('/auth');
  }

  return next();
});
