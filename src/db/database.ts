import { createClient } from '@libsql/client';
import { drizzle } from 'drizzle-orm/libsql';

let _client: ReturnType<typeof createClient> | null = null;
export const getClient = () => {
  // if (!_client) {
  _client = createClient({
    url: process.env.DATABASE_URL || import.meta.env.DATABASE_URL!,
    authToken: process.env.DATABASE_TOKEN || import.meta.env.DATABASE_TOKEN!,
  });
  // }

  return _client;
};

let _database: ReturnType<typeof drizzle> | null = null;
export const getDatabase = () => {
  // if (!_database) {
  const client = getClient();
  _database = drizzle(client);
  // }

  return _database;
};
