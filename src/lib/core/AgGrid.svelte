<script lang="ts">
	import type { ColDef } from 'ag-grid-community';
	import 'ag-grid-community/styles/ag-grid.css'; // Core grid CSS, always needed
	import 'ag-grid-community/styles/ag-theme-quartz.css';
	import AGGridSvelte from 'ag-grid-svelte';

  let api: any, columnApi: any;

	const rowData = [
   { make: "Tesla", model: "Model Y", price: 64950, electric: true },
   { make: "Ford", model: "F-Series", price: 33850, electric: false },
   { make: "Toyota", model: "Corolla", price: 29600, electric: false },
 	];

	const columnDefs: ColDef[] = [
   { field: "make", },
   { field: "model" },
   { field: "price", headerName: 'Cost Price', type: 'number'},
   { field: "electric" }
 	];

	 const defaultColDef: ColDef = {
    width: 150,
    cellStyle: { fontWeight: 'bold' },
	};

	const onClick = () => {
    api.deselectAll();
  };

</script>

<div class="ag-theme-quartz" style:width="500px" style:height="500px">
  <AGGridSvelte bind:api={api} bind:columnApi={columnApi}  {rowData} {columnDefs} {defaultColDef}  />
</div>
