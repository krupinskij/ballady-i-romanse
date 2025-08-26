import { sequence } from 'astro:middleware';

import { auth, headers, locals, mobile } from './middlewares';

export const onRequest = sequence(headers, locals, auth, mobile);
