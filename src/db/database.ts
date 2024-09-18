import { createClient } from '@libsql/client';
import { drizzle } from 'drizzle-orm/libsql';

import type { SupportedLng } from '@i18n';

const vars = {
  pl: {
    url: 'PUBLIC_PL_DATABASE_URL',
    authToken: 'PUBLIC_PL_DATABASE_TOKEN',
  },
  ru: {
    url: 'PUBLIC_RU_DATABASE_URL',
    authToken: 'PUBLIC_RU_DATABASE_TOKEN',
  },
} as const;

type Client = ReturnType<typeof createClient>;
export type Database = ReturnType<typeof drizzle>;

const clientMap = new Map<SupportedLng, Client>();
const databaseMap = new Map<SupportedLng, Database>();

export const getClient = (lng: SupportedLng): Client => {
  const _client = clientMap.get(lng);

  if (!!_client) {
    return _client;
  }

  const client = createClient({
    url: process.env[vars[lng].url] || import.meta.env[vars[lng].url]!,
    authToken: process.env[vars[lng].authToken] || import.meta.env[vars[lng].authToken]!,
  });
  clientMap.set(lng, client);

  return client;
};

export const getDatabase = (lng: SupportedLng): Database => {
  const _database = databaseMap.get(lng);

  if (!!_database) {
    return _database;
  }

  const client = getClient(lng);
  const database = drizzle(client);
  databaseMap.set(lng, database);

  return database;
};
