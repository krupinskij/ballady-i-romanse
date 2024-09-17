import { migrate } from 'drizzle-orm/libsql/migrator';

import { getDatabase } from '@db';

async function main() {
  console.log('Running migrations');

  const database = getDatabase();
  await migrate(database, { migrationsFolder: './drizzle/migrations' });

  console.log('Migrated successfully');

  process.exit(0);
}

main().catch((e) => {
  console.error('Migration failed');
  console.error(e);
  process.exit(1);
});
