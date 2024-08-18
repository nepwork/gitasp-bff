<script lang="ts">
  let search = '';
  let products = [];
  let timeout: Timer;
  let searching = false;

	export let entity: string;

  function handleSearch() {
    searching = true;
    if (timeout) clearTimeout(timeout);
    timeout = setTimeout(getProducts, 300);
  }

  async function getProducts() {
    if (!search) {
      reset();
      return;
    }

    const data = await fetch(`https://dummyjson.com/products/search?q=${search}`)
      .then((res) => {
        if (!res.ok) {
          handleError();
          return;
        }
        return res.json();
      })
      .catch((e) => handleError());

    products = data?.products || [];
    searching = false;
  }

  function handleError() {
    alert('Something went wrong.');
    reset();
  }

  function reset() {
    products = [];
    searching = false;
  }
</script>


<form action="#" method="GET" class="hidden lg:block lg:pl-3.5">
	<label for="topbar-search" class="sr-only">Search {entity}</label>
	<div class="relative mt-1 lg:w-96">
		<div
			class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none"
		>
			<svg
				class="w-5 h-5 text-gray-500 dark:text-gray-400"
				fill="currentColor"
				viewBox="0 0 20 20"
				xmlns="http://www.w3.org/2000/svg"
				><path
					fill-rule="evenodd"
					d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
					clip-rule="evenodd"></path></svg
			>
		</div>
		<input
			type="search"
			name="search"
			bind:value={search} on:input={handleSearch}
			class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full pl-10 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
			placeholder="Search"
		/>
	</div>
</form>

{#if searching}
  <p>Loading...</p>
{/if}
<!-- 
<ul>
  {#each fields as product}
    <li>{product.title} ({product.price}€)</li>
  {/each}
</ul> -->
