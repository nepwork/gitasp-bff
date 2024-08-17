import { Prisma, PrismaClient } from "@prisma/client";
import type { BaseDMMF } from "@prisma/client/runtime/library";

export const prisma = new PrismaClient({
	errorFormat: 'pretty'
});

function getDMMF(): BaseDMMF {
	return Prisma.dmmf;
}

export function getModelNames(): string[] {
	return getDMMF().datamodel.models
		.map(m => m.dbName ?? m.name);
}

export function  getModels() {
	return getDMMF().datamodel.models;
}

export type Models = ReturnType<typeof getModels>;

function  getModel() {
	return getDMMF().datamodel.models[0];
}
export type Model = ReturnType<typeof getModel>;

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

export function getEnumValues(model: string): Map<string, string[]> {
	const allEnums = getDMMF().datamodel.enums;
	const foundModel = getModels().find(m => m.dbName === model);
	const foundEnumKinded = foundModel?.fields.filter(f => f.kind === "enum").map(f =>  f.name.toLowerCase());

	const found: Enums = allEnums.filter(e => foundEnumKinded?.includes(e.name.toLowerCase()));

	if (found.length > 0) {
		return found.reduce((acc, f) => 
			acc.set( f.name.toLowerCase(), f.values.map(v => v.name))
		, new Map<string, string[]>())
	}

	return new Map<string, string[]>();
}

export function  getEnums() {
	return getDMMF().datamodel.enums;
}

export type Enums = ReturnType<typeof getEnums>;


function  getEnum() {
	return getDMMF().datamodel.enums[0];
}

export type Enum = ReturnType<typeof getEnum>;
