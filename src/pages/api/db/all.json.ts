import { Prisma } from '@prisma/client';
import type { APIRoute } from 'astro';

export const prerender = false;

export const GET: APIRoute = () => 
	new Response(Prisma.dmmf.datamodel.models, {
		status: 200,
		headers: {
			"Content-Type": "application/json"
		}
	});
  

