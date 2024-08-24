import type { Patient } from '@prisma/client';
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
	console.log("search name", name)

  try {
    const patients = await getDelegate('Patient').findMany({
      where: {
        OR: [
					{ givenName: { contains: name, mode: 'insensitive' } },
					{ familyName: { contains: name, mode: 'insensitive' } },
					{ phoneNumber: { contains: name, mode: 'insensitive' } }
				]
      },
			select: {
				givenName: true,
				familyName: true,
				phoneNumber: true
			}
    });
		console.log("patients", patients);
    return new Response(JSON.stringify(patients), {
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
