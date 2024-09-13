import { migrate } from 'drizzle-orm/libsql/migrator';

import { databases } from '@db';
import { isSupportedLang } from '@i18n';

async function main() {
  const lang = process.argv[2] || undefined;

  if (lang !== undefined && !isSupportedLang(lang)) {
    throw new Error(`Language "${lang}" isn't supported.`);
  } else if (!lang) {
    console.log('Empty language. Migrate for all databases.');
  } else {
    console.log(`Migrate for language "${lang}"`);
  }

  const dbs = !lang ? Object.values(databases) : [databases[lang]];

  console.log('Running migrations');

  const result = await Promise.allSettled(
    dbs.map((db) => migrate(db, { migrationsFolder: './drizzle/migrations' }))
  );

  console.log('Migrated successfully', result);

  process.exit(0);
}

main().catch((e) => {
  console.error('Migration failed');
  console.error(e);
  process.exit(1);
});
