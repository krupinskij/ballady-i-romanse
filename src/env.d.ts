/// <reference path="astro/client.d.ts" />

type Runtime = import('@astrojs/cloudflare').Runtime<Env>;

interface ImportMetaEnv {
  readonly PUBLIC_DATABASE_URL: string;
  readonly PUBLIC_DATABASE_TOKEN: string;
}

interface ImportMeta {
  readonly env: ImportMetaEnv;
}

declare namespace App {
  type Lang = import('@i18n').SupportedLng;
  type Schema = import('@db').Schema;
  type DB = any;

  interface Locals {
    LANG: Lang;
    DB: DB;
    SCHEMA: Schema;
  }
}
