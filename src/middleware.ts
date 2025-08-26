import { sequence } from 'astro:middleware';

import { auth, headers, locals, mobile, version } from './middlewares';

export const onRequest = sequence(version, headers, locals, auth, mobile);
