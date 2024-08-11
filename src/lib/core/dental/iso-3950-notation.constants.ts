import { quadrantCodes, toothCodes } from "./teeth-annotation.constants";

export class ISO3950Notation {

	readonly quadrantCode: number;
	
	readonly toothCode: number;

	constructor(iso: number) {
			this.quadrantCode = Math.floor(iso / 10);
			this.toothCode = iso % 10;
	}

	isPermanent() {
			return this.quadrantCode <= 4;
	}

	isDeciduous() {
			return !this.isPermanent();
	}


	isMaxillary() {
			return [1, 2, 5, 6].includes(this.quadrantCode);
	}

	isMandibular() {
			return !this.isMaxillary();
	}

	describe() {
			const zeroOrOne = this.isPermanent() ? 0 : 1;
			const name = [4, 5].includes(this.toothCode) ?
					toothCodes.get(this.toothCode)?.split('/')[zeroOrOne] :
					toothCodes.get(this.toothCode);
			const descriptor = quadrantCodes.get(this.quadrantCode);

			return descriptor && name ? `${descriptor  } ${  name}` : '';
	}
}
