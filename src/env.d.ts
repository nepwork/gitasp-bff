/// <reference path="../.astro/types.d.ts" />
/// <reference types="astro/client" />

import "../.astro/types"

// https://docs.astro.build/en/guides/environment-variables/#intellisense-for-typescript
interface ImportMetaEnv {
	readonly SITE: string;
}

interface ImportMeta {
	readonly env: ImportMetaEnv;
}

declare module '@fortawesome/free-solid-svg-icons/index.es' {
  export * from '@fortawesome/free-solid-svg-icons';
}
