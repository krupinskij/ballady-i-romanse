import defaultTheme from 'tailwindcss/defaultTheme';

/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  theme: {
    fontFamily: {
      cursive: ['Italianno', ...defaultTheme.fontFamily.sans],
      default: ['Montserrat Variable', ...defaultTheme.fontFamily.sans],
    },
    extend: {},
  },
  plugins: [],
};
