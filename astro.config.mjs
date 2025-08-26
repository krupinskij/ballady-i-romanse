import cloudflare from '@astrojs/cloudflare';
import { defineConfig, envField } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  output: 'server',
  site: 'https://balladyromanse.pl/',
  adapter: cloudflare({
    platformProxy: {
      enabled: true,
    },
    imageService: 'passthrough',
  }),
  env: {
    schema: {
      AUTH_PASS: envField.string({ context: 'server', access: 'secret' }),
    },
  },
  i18n: {
    defaultLocale: 'pl',
    locales: ['pl', 'ru'],
    routing: 'manual',
  },
  security: {
    checkOrigin: false,
  },
});
