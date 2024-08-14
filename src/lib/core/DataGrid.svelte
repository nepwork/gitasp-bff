<script lang="ts">

  import { html } from 'gridjs';
  import Grid from 'gridjs-svelte';
  import "gridjs/dist/theme/mermaid.css";
  import { writable } from 'svelte/store';
  import { deleteButton, style, updateButton } from "./grid-style";
  import { Drawer, Button, CloseButton } from 'flowbite-svelte';
	import { sineIn } from 'svelte/easing';
  import { InfoCircleSolid, ArrowRightOutline } from 'flowbite-svelte-icons';

	let hidden1 = true;
  let transitionParams = {
    x: -320,
    duration: 200,
    easing: sineIn
  };

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
		{
      name: 'Action',
      data: (row: Data) => row.id,
      formatter: (_: any, row: { id: string; }) => html(
				`
				<div class="flex gap-2">
					${updateButton}
					${deleteButton}
				</div>
				`
			),
      sort: true,
      width: '15%',
    }
  ];
</script>
<div class="max-w-full px-4 sm:px-6 lg:px-8 mx-auto"><!-- Card -->
  <div class="bg-white text-teal-400 rounded-xl p-4 sm:p-7 dark:bg-neutral-800">
		
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
	language={{
		search: {
			placeholder: '🔍 Search...'
		}
	}}
  search={true}
  sort={true}
  resizable={true}000
	{style}
/>

	</div>  
</div>

<Drawer transitionType="fly" {transitionParams} bind:hidden={hidden1} id="sidebar1">
  <div class="flex items-center">
    <h5 id="drawer-label" class="inline-flex items-center mb-4 text-base font-semibold text-gray-500 dark:text-gray-400">
      <InfoCircleSolid class="w-5 h-5 me-2.5" />Info
    </h5>
    <CloseButton on:click={() => (hidden1 = true)} class="mb-4 dark:text-white" />
  </div>
  <p class="mb-6 text-sm text-gray-500 dark:text-gray-400">
    Supercharge your hiring by taking advantage of our <a href="/" class="text-primary-600 underline dark:text-primary-500 hover:no-underline"> limited-time sale </a>
    for Flowbite Docs + Job Board. Unlimited access to over 190K top-ranked candidates and the #1 design job board.
  </p>
  <div class="grid grid-cols-2 gap-4">
    <Button color="light" href="/">Learn more</Button>
    <Button href="/" class="px-4">Get access <ArrowRightOutline class="w-5 h-5 ms-2" /></Button>
  </div>
</Drawer>

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
  .gridjs-search {
    width: 100px;
  }

</style>
