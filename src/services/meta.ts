import { Prisma } from "@prisma/client";
import type { BaseDMMF } from "@prisma/client/runtime/library";

function getDMMF(): BaseDMMF {
	return Prisma.dmmf;
}


export function  getModels() {
	return getDMMF().datamodel.models;
}
export type Models = ReturnType<typeof getModels>;


function  getModel() {
	return getDMMF().datamodel.models;
}
export type Model = ReturnType<typeof getModel>;

export function  getEnums() {
	return getDMMF().datamodel.enums;
}

export type Enums = ReturnType<typeof getEnums>;


function  getEnum() {
	return getDMMF().datamodel.enums[0];
}

export type Enum = ReturnType<typeof getEnum>;
