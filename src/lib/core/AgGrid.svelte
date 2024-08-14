<script lang="ts">
	import type { ColDef } from 'ag-grid-community';
	import 'ag-grid-community/styles/ag-grid.css'; // Core grid CSS, always needed
	import 'ag-grid-community/styles/ag-theme-quartz.css';
	import { createGrid } from 'ag-grid-community';
  // cannot reading map of undefined error 
  
	const gridOptions = {
		// Row Data: The data to be displayed.
		rowData: [
			{ make: "Tesla", model: "Model Y", price: 64950, electric: true },
			{ make: "Ford", model: "F-Series", price: 33850, electric: false },
			{ make: "Toyota", model: "Corolla", price: 29600, electric: false },
		],
		// Column Definitions: Defines the columns to be displayed.
		columnDefs: [
			{ field: "make" },
			{ field: "model" },
			{ field: "price" },
			{ field: "electric" }
		]
	};

	const myGridElement = document.querySelector('#myGrid')! as HTMLElement;
	createGrid(myGridElement, gridOptions as any);

</script>

<div class="ag-theme-quartz" style:width="500px" style:height="500px">
	<div id="myGrid"></div>
</div>
