import type { FieldShape, FieldsShape } from "../../prisma/db-utils";

const auditFields = ["createdAt", "createdBy", "updatedAt", "updatedBy", "creator", "updater"];

export function isRemovable(f: string): boolean {
	return auditFields.includes(f)
}

export function isHid(f: FieldShape): boolean {
	return f.isId 
}

export function isAbsent(f: FieldShape): boolean {
	return f.isReadOnly || auditFields.includes(f.name) || f.kind === "object"
}


export function isRequired(f: FieldShape): boolean {
	return f.isRequired && !f.hasDefaultValue
}


export const mapAgGridType = (mData: FieldsShape) => (fieldName: string) => 
	mData.find(m => m.name === fieldName)?.type ?? "String";


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
