import { createClient } from '@libsql/client';
import { drizzle } from 'drizzle-orm/libsql';

const client = createClient({
  url: process.env.PUBLIC_DATABASE_URL || import.meta.env.PUBLIC_DATABASE_URL!,
  authToken: process.env.PUBLIC_DATABASE_TOKEN || import.meta.env.PUBLIC_DATABASE_TOKEN!,
});

export const database = drizzle(client);
