import type { Principal } from '@prisma/client';
import type { APIRoute } from 'astro';
import { getDelegate } from '../../../lib/desruc-sdk/ntt-service';

export const headers = {
	'Content-Type': 'application/json'
	}


interface ReqBody {
	name: string;
}

export const POST: APIRoute = async ({ request }) => {
  const body = await request.json() as ReqBody;
  const { name } = body;
 
  try {
    const users = await getDelegate('Principal').findMany({
      where: {
        OR: [
					{ firstName: { contains: name, mode: 'insensitive' } },
					{ lastName: { contains: name, mode: 'insensitive' } },
					{ phoneNumber: { contains: name, mode: 'insensitive' } },
					{ email: { contains: name, mode: 'insensitive' } }
				]
      },
			select: {
				firstName: true,
				lastName: true,
				phoneNumber: true,
				email: true
			}
    });

    return new Response(JSON.stringify(users), {
      status: 200,
      headers
    });
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : 'An unknown error occurred';
    return new Response(JSON.stringify({ error: errorMessage }), {
      status: 500,
      headers
    });
  }
};
