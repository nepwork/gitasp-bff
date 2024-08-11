import { ISO3950Notation } from './iso-3950-notation.constants';
import { conditionToColor, EMPTY_TEETH_HISTORY, type ToothHistory } from './teeth-annotation.constants';


export class TeethLibService {

  teethHistory: ToothHistory[] = EMPTY_TEETH_HISTORY;

  currentPermanentTooth = 0;

  currentDeciduousTooth = 0;

	teethDescription = "";

  shouldBeStroked(index: number) {
    if (index > this.teethHistory.length) return false;
    return (this.teethHistory[index])?.notes?.length;
  }

  conditionToColor(toothHistory?: ToothHistory): string {
    if (!toothHistory) return '';
    if ([this.currentPermanentTooth, this.currentDeciduousTooth]
      .includes(toothHistory.iso)) {
      return "#71bbd4";
    }
    return conditionToColor(toothHistory.condition);
  }

  getByIso(index: number) {
    return this.teethHistory.find(t => t.iso === index)
  }

  selectedToothIso(index: number) {
    if (index <= 48) {
      this.currentPermanentTooth = this.currentPermanentTooth !== index ? index : 0;
    } else {
      this.currentDeciduousTooth = this.currentDeciduousTooth !== index ? index : 0;
    }
		this.teethDescription = new ISO3950Notation(index).describe();	
		console.log("teeth clicked", index, this.teethDescription);
  }
}
