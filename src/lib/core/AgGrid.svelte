<script lang="ts">
  import { ClientSideRowModelModule } from '@ag-grid-community/client-side-row-model';
  import { ModuleRegistry } from '@ag-grid-community/core';
  import * as agGrid from 'ag-grid-community';
  import 'ag-grid-community/styles/ag-grid.css';
  import 'ag-grid-community/styles/ag-theme-quartz.css';
  import { onMount } from 'svelte';

	export let columnDefs: agGrid.ColDef[];
  export let rowData: any[];

	export let width = "80vw";
	export let height = "80vh";

  ModuleRegistry.registerModules([ClientSideRowModelModule]);

  let gridContainer: any;
  let gridApi: any;

  const gridOptions: agGrid.GridOptions<any> = {
    columnDefs,
    rowData,
		autoSizeStrategy: {
    	type: "fitCellContents",
  	},
		pagination: true,
		paginationPageSize: 20,
    paginationPageSizeSelector: [10, 20, 50, 100],
    defaultColDef: {
      flex: 1,
			minWidth: 250,
			maxWidth: 450,
      sortable: true,
      resizable: true,
      floatingFilter: true,
      editable: true,
    },
    onRowEditingStarted: (event: agGrid.RowEditingStartedEvent) => {
      console.log('now doing row editing');
    },
    onRowEditingStopped: (event: agGrid.RowEditingStoppedEvent) => {
      console.log('stopped doing row editing');
    },
    onCellEditingStarted: (event: agGrid.CellEditingStartedEvent) => {
      console.log('cellEditingStarted');
    },
    onCellEditingStopped: (event: agGrid.CellEditingStoppedEvent) => {
      console.log('cellEditingStopped');
    },
  };

	function autoSizeAll(skipHeader: boolean) {
		const allColumnIds: string[] = [];

		gridApi!.getColumns()!.forEach((column: any) => {
			allColumnIds.push(column.getId());
		});

  	gridApi!.autoSizeColumns(allColumnIds, skipHeader);
	}

  onMount(() => {
    gridApi = agGrid.createGrid(gridContainer, gridOptions);
		autoSizeAll(false)
  });
</script>
<div class="griddy-wrapper">
	<div class="ag-theme-quartz" style:width={width} style:height={height} bind:this={gridContainer}>
	</div>
</div>
<style global>
  :global(.ag-header-cell) {
    background: #9fdad4;
    font-size: 16px;
  }
</style>

<!-- #82d1c9; -->
