import { createClient } from '@libsql/client';
import { drizzle } from 'drizzle-orm/libsql';

const client = createClient({
  url: process.env.DATABASE_URL || import.meta.env.DATABASE_URL!,
  authToken: process.env.DATABASE_TOKEN || import.meta.env.DATABASE_TOKEN!,
});

export const database = drizzle(client);

export type Database = typeof database;
