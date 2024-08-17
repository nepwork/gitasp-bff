import type { APIRoute } from "astro";
import { getDMMF } from "../../../lib/desruc-sdk/utils";

export const prerender = false;

export const GET: APIRoute =  ({ params }) => {
  const {name} = params;
	const allEnums = getDMMF().datamodel.enums;
	const found = allEnums.find(e => e.name.toLowerCase() === name?.toLowerCase());
	console.log("found", found, allEnums, name)
	if (found) {
		return new Response(JSON.stringify(found.values.map(v => v.name)));
	}

  return new Response("null", { status: 400 });
}
