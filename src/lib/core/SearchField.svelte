<script lang="ts">
	import { onMount } from "svelte";
	import type { FieldShape } from "../../../prisma/db-utils";
	import { fC } from "../../modules/form.resolvers";
	import { SearchOutline } from 'flowbite-svelte-icons';

	export let field: FieldShape;

	onMount(async () => {
		const apiHello = await fetch("/api/hello");
		console.log("apiHello", apiHello);		
	})

</script>

<div class="search flex flex-row-reverse">
	<input
		name={`q_${fC(field.name)}`}
		type="search"
		list="ice-cream-flavors"
		placeholder={fC(field.name)}
		spellcheck="true"
		class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
	/>
	<SearchOutline class="z-10 absolute mt-2 mr-2 text-gray-500"/>
</div>
<datalist id="ice-cream-flavors">
  <option value="Chocolate Chocolate"></option>
  <option value="Coconut Chocolate"></option>
  <option value="Mint Chocolate"></option>
  <option value="Strawberry Chocolate"></option>
  <option value="Vanilla Chocolate"></option>
</datalist>
