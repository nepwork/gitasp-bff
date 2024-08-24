<script lang="ts">
	import { SearchOutline } from 'flowbite-svelte-icons';
	import { onMount } from "svelte";
	import type { FieldShape } from "../../../prisma/db-utils";
	import { fC } from "../../modules/form.resolvers";

	export const headers = {
	'Content-Type': 'application/json'
	}


	export let field: FieldShape;

	let searchString: string;
	let findings: any[] = [];

	let searchTimeout: ReturnType<typeof setTimeout> | null = null;

	console.log("field type", field.type);

	function debounce(fn: () => void, ms: number) {
		return () => {
			if (searchTimeout) clearTimeout(searchTimeout);
			searchTimeout = setTimeout(fn, ms);
		}
	}

	async function findThings(): Promise<void> {
		if (searchString.length < 2) {
      findings = [];
      return;
    }

    try {
      const response = await fetch(`/api/${field.type}/read`, {
        method: 'POST',
        headers,
        body: JSON.stringify({ name: searchString }),
      });

      const result = await response.json();

      if (response.ok && result) {
				console.log("result", result);
				findings = result.map((res: any) => JSON.stringify(res));
      }
    } catch (error) {
      console.error(error instanceof Error ? error.message : 'An unknown error occurred');
      findings = [];
    }
	}

	const debouncedSearch = debounce(findThings, 300);

	function onKeydown(e: KeyboardEvent) {
		if (e.key === "Escape") {
			findings = [];
		} else if (e.key === "Enter") {
			e.preventDefault();
			findings = [];
		} else if (e.key === 'ArrowDown') {
			e.preventDefault();
			findings[0] ? findings[0].focus() : null;
		}
	}

	const selectAFinding = (finding: string) => {
		searchString = finding;
		findings = [];
	}

	onMount(() => {
    return () => {
      if (searchTimeout) {
        clearTimeout(searchTimeout);
      }
    };
  });

</script>

<div class="flex flex-col">
	<div class="search flex flex-row-reverse">
		<input
			bind:value={searchString}
			on:input={debouncedSearch}
			name={`q_${fC(field.name)}`}
			type="search"
			placeholder={fC(field.name)}
			spellcheck="true"
			class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
		/>
		<SearchOutline class="z-10 absolute mt-3 mr-2 text-gray-500"/>
	</div>
	{#if findings.length > 0}
		<div id="search-findings" class="flex flex-col z-10 absolute mt-11 ml-2 bg-gray-50 opacity-95 w-72 lg:w-[600px] text-sm text-gray-600 rounded-sm">
			{#each findings as finding}
				<button type="button" class="hover:bg-teal-200 text-start focus:bg-teal-200 p-2" on:click={() => selectAFinding(finding)} on:keydown={onKeydown}>{finding}</button>
				<hr>
			{/each}
		</div>
	{/if}
</div>






