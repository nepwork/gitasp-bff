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

/**
 * Given the name of the model, it returns all the fields in that model with enum values in them.
 * The field name is the key in the returned map, whereas the enum values are the corresponding values of that enum.
*/
export function getEnumValues(model: string): Map<string, string[]> {
	const allEnums = getDMMF().datamodel.enums;
	const foundModel = getModels().find(m => m.dbName === model);
	const foundEnumKinded = foundModel?.fields.filter(f => f.kind === "enum").map(f =>  [f.name, f.type]);
	console.log("enumKinded", foundEnumKinded)
	
	if (!foundEnumKinded?.length) return new Map<string, string[]>();

	const found = (enumName: string) => allEnums.find(e => enumName === e.name)?.values.map(v => v.name);
	
	return foundEnumKinded.reduce((acc, f) => 
		 acc.set(f[0], found(f[1]) ?? [])
	, new Map<string, string[]>())	
}

export function  getEnums() {
	return getDMMF().datamodel.enums;
}

export type Enums = ReturnType<typeof getEnums>;


function  getEnum() {
	return getDMMF().datamodel.enums[0];
}

export type Enum = ReturnType<typeof getEnum>;
