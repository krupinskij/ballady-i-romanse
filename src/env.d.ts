/// <reference path="astro/client.d.ts" />

type Runtime = import('@astrojs/cloudflare').Runtime<Env>;

interface ImportMetaEnv {
  readonly DATABASE_URL: string;
  readonly DATABASE_TOKEN: string;
}

interface ImportMeta {
  readonly env: ImportMetaEnv;
}
