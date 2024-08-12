<script lang="ts">

  import Grid from 'gridjs-svelte';
  import { writable } from 'svelte/store';
  import "gridjs/dist/theme/mermaid.css";


  interface Data {
    id: number;
    name: string;
    email: string;
    age: number;
  }

  const data: Data[] = [
    { id: 1, name: 'John Doe', email: 'john@example.com', age: 30 },
    { id: 2, name: 'Jane Smith', email: 'jane@example.com', age: 25 },
    { id: 3, name: 'Bob Johnson', email: 'bob@example.com', age: 35 },
    { id: 4, name: 'Alice Williams', email: 'alice@example.com', age: 28 },
    { id: 5, name: 'Tom Davis', email: 'tom@example.com', age: 32 },
  ];

  const idFilter = writable('');
  const nameFilter = writable('');
  const emailFilter = writable('');
  const ageFilter = writable('');

  $: filteredData = data.filter((row) =>
    row.id.toString().includes($idFilter) &&
    row.name.toLowerCase().includes($nameFilter.toLowerCase()) &&
    row.email.toLowerCase().includes($emailFilter.toLowerCase()) &&
    row.age.toString().includes($ageFilter)
  );

  const columns: any[] = [
    {
      name: 'ID',
      data: (row: Data) => row.id,
      filter: {
        type: 'text',
        placeholder: 'Filter by ID',
        debounce: 300,
        trigger: 'input',
        value: $idFilter,
        // onFilter: (value: string, row: Data) =>
        //   row.id.toString().includes(value),
      },
      sort: true,
      width: '10%',
    },
    {
      name: 'Name',
      data: (row: Data) => row.name,
      filter: {
        type: 'text',
        placeholder: 'Filter by name',
        debounce: 300,
        trigger: 'input',
        value: $nameFilter,
        // onFilter: (value: string, row: Data) =>
        //   row.name.toLowerCase().includes(value.toLowerCase()),
      },
      sort: true,
      width: '25%',
    },
    {
      name: 'Email',
      data: (row: Data) => row.email,
      filter: {
        type: 'text',
        placeholder: 'Filter by email',
        debounce: 300,
        trigger: 'input',
        value: $emailFilter,
        // onFilter: (value: string, row: Data) =>
        //   row.email.toLowerCase().includes(value.toLowerCase()),
      },
      sort: true,
      width: '30%',
    },
    {
      name: 'Age',
      data: (row: Data) => row.age,
      filter: {
        type: 'text',
        placeholder: 'Filter by age',
        debounce: 300,
        trigger: 'input',
        value: $ageFilter,
        // onFilter: (value: string, row: Data) =>
        //   row.age.toString().includes(value),
      },
      sort: true,
      width: '15%',
    },
  ];
</script>
<div class="max-w-full px-4 py-10 sm:px-6 lg:px-8 mx-auto"><!-- Card -->
  <div class="bg-white rounded-xl p-4 sm:p-7 dark:bg-neutral-800">
<div class="grid-filters">
  <input type="text" placeholder="Filter by ID" bind:value={$idFilter} />
  <input type="text" placeholder="Filter by name" bind:value={$nameFilter} />
  <input type="text" placeholder="Filter by email" bind:value={$emailFilter} />
  <input type="text" placeholder="Filter by age" bind:value={$ageFilter} />
</div>

<Grid
  data={filteredData}
  {columns}
  pagination={{
    enabled: true,
    limit: 10,
  }}
  search={true}
  sort={true}
  resizable={true}
/>

	</div>  
</div>

<style global>
	
  .grid-filters {
    display: flex;
    justify-content: space-between;
    margin-bottom: 1rem;
  }

  .grid-filters input {
    flex: 1;
    margin-right: 1rem;
    padding: 0.5rem;
    border: 1px solid #ccc;
    border-radius: 4px;
  }

  /* :first-of-type */
  .gridjs-search input[type="search"] {
    width: 100%;
  }

  input[type=search] {
    background: #000;
  }

</style>
