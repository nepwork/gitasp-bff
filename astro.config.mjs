import { defineConfig } from 'astro/config';
import node from "@astrojs/node";

import sitemap from '@astrojs/sitemap';
import tailwind from '@astrojs/tailwind';
import svelte from "@astrojs/svelte";

const DEV_PORT = 2121;

// https://astro.build/config
export default defineConfig({
  site: `http://localhost:${DEV_PORT}`,
  base: './',
  output: 'hybrid',
	adapter: node({
		mode: 'standalone'
	}),
  /* Like Vercel, Netlify,… Mimicking for dev. server */
  // trailingSlash: 'always',
  vite: {
		server: {
      proxy: {
        '/kalei': {
          target: 'http://localhost:3000',
          changeOrigin: true,
          secure: false,
        }
      }
    },
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
