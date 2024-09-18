/// <reference path="astro/client.d.ts" />

type Runtime = import('@astrojs/cloudflare').Runtime<Env>;

interface ImportMetaEnv {
  readonly PUBLIC_PL_DATABASE_URL: string;
  readonly PUBLIC_PL_DATABASE_TOKEN: string;
  readonly PUBLIC_RU_DATABASE_URL: string;
  readonly PUBLIC_RU_DATABASE_TOKEN: string;
}

interface ImportMeta {
  readonly env: ImportMetaEnv;
}

declare namespace App {
  type Database = import('@db').Database;
  type Schema = import('@db').Schema;
  type Lang = import('@i18n').SupportedLng;

  interface Locals {
    DB: Database;
    SCHEMA: Schema;
    LANG: Lang;
  }
}
