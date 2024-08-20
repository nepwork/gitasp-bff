import type { FieldShape, FieldsShape } from "../../prisma/db-utils";

const auditFields = ["createdAt", "createdBy", "updatedAt", "updatedBy", "creator", "updater"];

export function isRemovable(f: string): boolean {
	return auditFields.includes(f)
}

export function isHid(f: FieldShape): boolean {
	return f.isId 
}

export function isAbsent(f: FieldShape): boolean {
	return f.isReadOnly || auditFields.includes(f.name) || Boolean(f.default?.name) || f.isList
}

export function inputTypeGuess(f: FieldShape): string {
	if (["Decimal", "Int", "BigInt"].includes(f.type)) {
		return "number";
	} 
	
	if (f.type === "DateTime") {
		return "date";
	}

	if (f.type === 'Boolean') {
		return "checkbox"
	}

	return "text";
}

export function isRequired(f: FieldShape): boolean {
	return f.isRequired && !f.hasDefaultValue
}

export function isRelation(f: FieldShape): boolean {
 return  f.kind === "object" && Boolean(f.relationFromFields?.length)  && Boolean(f.relationToFields?.length)
}

export function is1to1Relation(f: FieldShape): boolean {
	return !f.isList &&  isRelation(f)
}


export function isRequired1to1Relation(f: FieldShape): boolean {
	return is1to1Relation(f) && f.isRequired
}


export const mapAgGridType = (mData: FieldsShape) => (fieldName: string) => 
	mData.find(m => m.name === fieldName)?.type ?? "String";

export const mapFieldNameToField = (mData: FieldsShape) => (fieldName: string) => 
	mData.find(m => m.name === fieldName)


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

/**
 * Abbreviation of fromCamel to Title Case Words
*/
export const fC = fromCamel;


