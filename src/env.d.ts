/// <reference path="astro/client.d.ts" />

type Runtime = import('@astrojs/cloudflare').Runtime<Env>;

interface ImportMetaEnv {
  readonly PL_DATABASE_URL: string;
  readonly PL_DATABASE_TOKEN: string;
  readonly RU_DATABASE_URL: string;
  readonly RU_DATABASE_TOKEN: string;
}

interface ImportMeta {
  readonly env: ImportMetaEnv;
}

declare namespace App {
  interface Locals {
    DB: LibSQLDatabase<Record<string, never>>;
  }
}
