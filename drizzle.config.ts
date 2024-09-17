import { defineConfig } from 'drizzle-kit';

export default defineConfig({
  dialect: 'sqlite',
  schema: './src/db/schema.ts',
  out: './drizzle/migrations',
  driver: 'turso',
  dbCredentials: {
    url: process.env.DATABASE_URL || import.meta.env.DATABASE_URL!,
    authToken: process.env.DATABASE_TOKEN || import.meta.env.DATABASE_TOKEN!,
  },
});
