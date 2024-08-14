<script lang="ts">
  import { ClientSideRowModelModule } from '@ag-grid-community/client-side-row-model';
  import { ModuleRegistry } from '@ag-grid-community/core';
  import * as agGrid from 'ag-grid-community';
  import 'ag-grid-community/styles/ag-grid.css';
  import 'ag-grid-community/styles/ag-theme-alpine.css';
  import { onMount } from 'svelte';

	export let columnDefs: agGrid.ColDef[];
  export let rowData: any[];

  ModuleRegistry.registerModules([ClientSideRowModelModule]);

  console.log("columnDefs in grid", columnDefs)
  console.log("rowData in grid", rowData)

  let gridContainer: any;
  let gridApi: any;

  const gridOptions: agGrid.GridOptions<any> = {
    columnDefs,
    rowData,
		pagination: true,
    paginationPageSize: 10,
    paginationPageSizeSelector: [10, 20, 50, 100],
    defaultColDef: {
      flex: 1,
      minWidth: 200,
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

  onMount(() => {
    gridApi = agGrid.createGrid(gridContainer, gridOptions);
  });
</script>
<div class="griddy-wrapper">
	<div class="ag-theme-alpine" style:width="75vw" style:height="50vh" bind:this={gridContainer}>
	</div>
</div>
<style global>
  @import 'ag-grid-community/styles/ag-grid.css';
  @import 'ag-grid-community/styles/ag-theme-alpine.css';

  .data-grid {
    --ag-header-foreground-color: blue;
  }

  .bool-filter {
    width: 200px;
  }

  .bool-filter > * {
    margin: 8px;
		
  }

  .bool-filter > div:first-child {
    font-weight: bold;
  }

  .bool-filter > label {
    display: inline-block;
  }

  :global(.ag-header-cell) {
    background: #9fdad4;
    font-size: 16px;
  }
</style>

<!-- #82d1c9; -->
