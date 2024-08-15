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

function getFirstMetaData(model: string) {
	const allModels = getDMMF().datamodel.models;
	const selectedModel = allModels.find(mod => mod.dbName === model);
	if (selectedModel) {
		return selectedModel.fields[0];
	}

	throw new Error("Model not found");
}
export type MetadataTypeItem = ReturnType<typeof getFirstMetaData>;

export function getMetaData(model: string) {
	const allModels = getDMMF().datamodel.models;
	const selectedModel = allModels.find(mod => mod.dbName === model);
	if (selectedModel) {
		return selectedModel.fields;
	}

	throw new Error("Model not found");
}

export type MetadataType = ReturnType<typeof getMetaData>;
export type FieldsShape = MetadataType;
export type FieldShape = MetadataTypeItem;

export function getEnumValues(model: string) {
	const allEnums = getDMMF().datamodel.enums;
	const found = allEnums.find(e => e.name.toLowerCase() === model.toLowerCase());

	if (found) {
		return found.values.map(v => v.name);
	}

	throw new Error("Enum not found")
}

