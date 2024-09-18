import { migrate } from 'drizzle-orm/libsql/migrator';

import { getDatabase } from '@db';
import { isSupportedLng, supportedLngs } from '@i18n';

async function main() {
  const lng = process.argv[2] || undefined;

  if (lng !== undefined && !isSupportedLng(lng)) {
    throw new Error(`Language "${lng}" isn't supported.`);
  } else if (!lng) {
    console.log('Empty language. Migrate for all schemas.');
  } else {
    console.log(`Migrate for language "${lng}"`);
  }

  const lngs = !lng ? supportedLngs : [lng];

  console.log('Running migrations');

  for (let i = 0; i < lngs.length; i++) {
    const lng = lngs[i];
    const db = getDatabase(lng);
    await migrate(db, { migrationsFolder: './drizzle/migrations' });
  }

  console.log('Migrated successfully');

  process.exit(0);
}

main().catch((e) => {
  console.error('Migration failed');
  console.error(e);
  process.exit(1);
});
