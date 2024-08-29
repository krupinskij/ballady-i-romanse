/** @type {import("prettier").Config} */
export default {
  printWidth: 100,
  semi: true,
  singleQuote: true,
  tabWidth: 2,
  trailingComma: 'es5',
  importOrder: [
    '<THIRD_PARTY_MODULES>',
    '^(@assets|@components|@db|@layouts|@model|@styles|@utils)',
    '^[./]',
  ],
  importOrderSeparation: true,
  plugins: [
    'prettier-plugin-astro',
    '@trivago/prettier-plugin-sort-imports',
    'prettier-plugin-toml',
  ],
  overrides: [
    {
      files: '*.astro',
      options: {
        parser: 'astro',
      },
    },
  ],
};
