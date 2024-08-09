
export const API_URL = `${import.meta.env.SITE}${import.meta.env.BASE_URL}api/`;

export const REMOTE_ASSETS_BASE_URL = `https://risav.dev`; // so as to fail early and find out which assets are from flowbite

export const SITE_TITLE = 'Gita SP Admin';

/* Useful flag for sourcing from `./data` entirely, disabling randomize layer */
export const RANDOMIZE = Boolean(import.meta.env.RANDOMIZE) || true;


export interface NavItem {
	title: string;
	href?: string;
	disabled?: boolean;
	external?: boolean;
	icon: any; // IconDefinition instead of any?
	label?: string;
};

export type SidebarNavItem = NavItem & {
	items?: SidebarNavItem[];
};

export type NavItemWithChildren = NavItem & {
	items: NavItemWithChildren[];
};
