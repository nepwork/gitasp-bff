import { ImmutableMap } from "../immutable-map";

export const ToothCondition = {
	sound: "sound",
	filled: "filled",
	compromised: "compromised",
	endo: "endo",
	missing: "missing",
	rotated: "rotated",
	displaced: "displaced",
	"gum-recessed": "gum-recessed"
} as const;

export interface ToothHistory {
	iso: number;
	condition: keyof typeof ToothCondition;
	notes: string[];
	diagnosedOn?: Date;
	resolvedOn?: Date;
}


const get1toN = (n: number) => Array(n).fill(0).map((_, i) => i + 1);
const get10to40Step10: () => number[] = () => get1toN(4).map(v => v * 10); // [10, 20, 30, 40]
const get50to80Step10: () => number[] = () => get10to40Step10().map(v => v + 40); // [50, 60, 70, 80]

// [11, 12, 13, 14, 15, 16, 17, 18, 21, 22, 23, 24, 25, 26, 27, 28, 
//  31, 32, 33, 34, 35, 36, 37, 38, 41, 42, 43, 44, 45, 46, 47, 48]
export const permanentTeethKeys = get10to40Step10()
    .flatMap(t => get1toN(8).map(v => v + t));

// [51, 52, 53, 54, 55, 61, 62, 63, 64, 65, 
//  71, 72, 73, 74, 75, 81, 82, 83, 84, 85]
export const deciduousTeethKeys = get50to80Step10()
    .flatMap(t => get1toN(5).map(v => v + t));

// FDI two-digit notation map Syntax: <quadrant code><tooth code>
// Quadrant Codes
// set by going clockwise from the dentist's view.
export const quadrantCodes = new ImmutableMap([
    [1, "upper right permanent"],
    [2, "upper left permanent"],
    [3, "lower left permanent"],
    [4, "lower right permanent"],
    [5, "upper right deciduous"],
    [6, "upper left deciduous"],
    [7, "lower left deciduous"],
    [8, "lower right deciduous"],
]);


// Tooth Codes
// set by counting
export const toothCodes = new ImmutableMap([
	[1, "central incisor"],
	[2, "lateral incisor"],
	[3, "canines"],
	[4, "1st premolar/1st molar"], // permanent / deciduous 
	[5, "2nd premolar/2nd molar"], // permanent / deciduous 
	[6, "1st molar"],
	[7, "2nd molar"],
	[8, "3rd molar"],
]);


export const defaultToothConditions = [
	'sound',
	'filled',
	'compromised',
	'endo',
	'missing',
	'rotated',
	'displaced',
	'gum-recessed'
];


export function conditionToColor(c: keyof typeof ToothCondition): string {
	if (c === "compromised") {
			return "#FFCDD2";
	}
	
	if (c === "endo") {
			return "#D1C4E9";
	}
	
	if (c === "filled") {
			return "#FFE082";
	}
	
	if (c === "missing") {
			return "#BDBDBD";
	}
	
	if (c === "rotated") {
			return "#B2EBF2";
	}
	
	if (c === "gum-recessed") {
			return "#F48FB1";
	}
	
	if (c === "displaced") {
			return "#b2dfdb";
	}
	
	return "transparent";

}



export const EMPTY_TEETH_HISTORY_DECIDUOUS: ToothHistory[] = deciduousTeethKeys.map(iso => ({
	iso,
	condition: ToothCondition.sound,
	notes: []
}));

export const EMPTY_TEETH_HISTORY_PERMANENT: ToothHistory[] = permanentTeethKeys.map(iso => ({
	iso,
	condition: ToothCondition.sound,
	notes: []
}));

export const EMPTY_TEETH_HISTORY: ToothHistory[] = [...EMPTY_TEETH_HISTORY_PERMANENT, ...EMPTY_TEETH_HISTORY_DECIDUOUS];


export type TeethHistory = Record<number, ToothHistory>;
