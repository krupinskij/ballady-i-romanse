import cloudflare from '@astrojs/cloudflare';
import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  output: 'server',
  site: 'https://balladyromanse.pl/',
  adapter: cloudflare({
    platformProxy: {
      enabled: true,
    },
  }),
  i18n: {
    defaultLocale: 'pl',
    locales: ['pl', 'ru'],
    routing: {
      prefixDefaultLocale: false,
    },
  },
});
