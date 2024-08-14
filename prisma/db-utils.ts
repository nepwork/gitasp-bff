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
	const allModels = getDMMF().datamodel.models
	const selectedModel = allModels.find(mod => mod.dbName === model)
	if (selectedModel) {
		return selectedModel.fields;
	} 

	throw new Error("Model not found")
}
