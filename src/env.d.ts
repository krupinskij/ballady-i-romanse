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
  type Schema = import('@db').Schema;
  type DB = import('@db').Database;

  interface Locals {
    DB: DB;
    SCHEMA: Schema;
  }
}
