import { createClient } from '@libsql/client';
import { drizzle, LibSQLDatabase } from 'drizzle-orm/libsql';

import type { SupportedLng } from '@i18n';

const database_pl = drizzle(
  createClient({
    url: process.env.PL_DATABASE_URL || import.meta.env.PL_DATABASE_URL!,
    authToken: process.env.PL_DATABASE_TOKEN || import.meta.env.PL_DATABASE_TOKEN!,
  })
);

const database_ru = drizzle(
  createClient({
    url: process.env.RU_DATABASE_URL || import.meta.env.RU_DATABASE_URL!,
    authToken: process.env.RU_DATABASE_TOKEN || import.meta.env.RU_DATABASE_TOKEN!,
  })
);

const databases: Record<SupportedLng, LibSQLDatabase<Record<string, never>>> = {
  pl: database_pl,
  ru: database_ru,
};

export default databases;
