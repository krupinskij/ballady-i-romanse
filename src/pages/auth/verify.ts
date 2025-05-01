import type { APIRoute } from 'astro';
import { hashSync } from 'bcrypt-ts';

export const POST: APIRoute = async (context) => {
  const data = await context.request.formData();
  const password = data.get('password');
  if (!password) {
    return context.redirect('/auth');
  }

  const hash = hashSync(password.toString());
  context.cookies.set('access-token', hash, { httpOnly: true, secure: true, path: '/' });

  return context.redirect('/');
};
