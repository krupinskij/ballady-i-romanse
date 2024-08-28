import { createClient } from '@libsql/client';
import { drizzle } from 'drizzle-orm/libsql';

const client = createClient({
  url: process.env.DATABASE_URL || import.meta.env.DATABASE_URL!,
  authToken: process.env.DATABASE_TOKEN || import.meta.env.DATABASE_TOKEN!,
});

const database = drizzle(client);

export default database;
