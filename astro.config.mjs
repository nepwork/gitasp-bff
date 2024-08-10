import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import tailwind from '@astrojs/tailwind';
import svelte from "@astrojs/svelte";
const DEV_PORT = 2121;


// https://astro.build/config
export default defineConfig({
  site: process.env.CI ? 'https://themesberg.github.io' : `http://localhost:${DEV_PORT}`,
  base: process.env.CI ? '/flowbite-astro-admin-dashboard' : undefined,
  output: 'hybrid',
  experimental: {
    assets: true
  },
  /* Like Vercel, Netlify,… Mimicking for dev. server */
  // trailingSlash: 'always',
  vite: {
    jsx: 'preserve',
    ssr: {
      noExternal: ["svelte-fa"]
    }
  },
  server: {
    /* Dev. server only */
    port: DEV_PORT
  },
  integrations: [
  //
  sitemap(), tailwind(), svelte()]
});