/// <reference path="astro/client.d.ts" />

type Env = {
  DB_PL: D1Database;
};

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
  type Schema = import('@db').Schema;
  type Lang = import('@i18n').SupportedLng;

  interface Locals extends Runtime {
    DB: D1Database;
    SCHEMA: Schema;
    LANG: Lang;
  }
}
