/// <reference path="astro/client.d.ts" />

type Runtime = import('@astrojs/cloudflare').Runtime<Env>;

interface ImportMetaEnv {
  readonly DATABASE_URL: string;
  readonly DATABASE_TOKEN: string;
}

interface ImportMeta {
  readonly env: ImportMetaEnv;
}

declare namespace App {
  type Schema = any;
  type DB = any;

  interface Locals {
    // DB: DB;
    // SCHEMA: Schema;
    LANG: 'pl' | 'ru';
  }
}
