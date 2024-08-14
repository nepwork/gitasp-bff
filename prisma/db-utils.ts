import { Prisma, PrismaClient } from "@prisma/client";
import type { BaseDMMF } from "@prisma/client/runtime/library";

export const prisma = new PrismaClient({
	errorFormat: 'pretty'
});

function getDMMF(): BaseDMMF {
	return Prisma.dmmf;
}


export function  getModels() {
	return getDMMF().datamodel.models;
}


export function getModelNames(): string[] {
	return getDMMF().datamodel.models
		.map(m => m.dbName ?? m.name);
}


export function getMetaData(model: string) {
	const allModels = getDMMF().datamodel.models;
	const selectedModel = allModels.find(mod => mod.dbName === model);
	if (selectedModel) {
		return selectedModel.fields;
	} 

	throw new Error("Model not found");
}

export function getEnumValues(model: string) {
	const allEnums = getDMMF().datamodel.enums;
	const found = allEnums.find(e => e.name.toLowerCase() === model.toLowerCase());

	if (found) {
		return found.values.map(v => v.name);
	}

	throw new Error("Enum not found")
}

export type FieldsShape = ReturnType<typeof getMetaData>;


export function fromCamel(input: string): string {
	// Split the camelCased string into words
	const words = input.split(/(?=[A-Z])/).map((word) => word.toLowerCase());

	// Capitalize the first letter of each word
	const titleCased = words.map(
		(word) => word.charAt(0).toUpperCase() + word.slice(1),
	);

	// Join the words with spaces
	return titleCased.join(' ');
}
