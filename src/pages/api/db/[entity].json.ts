import { PrismaClient } from '@prisma/client';
import type { APIRoute } from 'astro';

export const prerender = false;

const prisma = new PrismaClient({
  errorFormat: 'pretty'
});

export const GET: APIRoute = ({ params }) => {
  const ntt = params.entity;
  const prismModel = (prisma as any)[ntt];
  if (prismModel) {
    return new Response((prismModel as any)['fields'], {
			status: 200,
			headers: {
				"Content-Type": "application/json"
			}
		});
  }

  return new Response(
    JSON.stringify(null), {
      status: 404,
      statusText: 'Not Found',
    }
  );
}

