<script lang="ts">
  import type { FieldsShape } from '../../../prisma/db-utils';
  import { fC, inputTypeGuess, isAbsent, isHid, isRequired, isRequired1to1Relation } from '../../modules/form.resolvers';
  import SearchField from './SearchField.svelte';
	
	export let metaData: FieldsShape; // Define the type more specifically if possible
  export let entity: string;

  // Object to store enum values for each field
  export let enumValues: Map<string, string[]>;
	console.log("metadata", metaData);
  // Function to handle form submission
  function handleSubmit(event: Event) {
    event.preventDefault();
    // Add your form submission logic here
  }

	const get1to1RequiredRelations = metaData.filter(f => isRequired1to1Relation(f));
	console.log("1-1 relations", get1to1RequiredRelations);

</script>

<form on:submit={handleSubmit}>
  <div class="grid gap-4 sm:grid-cols-2 sm:gap-6">
    {#if metaData?.length}
      {#each metaData as field}
			{#if !isAbsent(field)}
        <div class="w-full {isHid(field) ? 'hidden' : ''}">
          <label
            for={field.name}
            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
          >
            {fC(field.name)} 
            <span class="text-gray-400">
              {isRequired(field) ? ' *' : ''}
            </span>
          </label>
          {#if field.kind === 'enum'}
            <select
              name={field.name}
              class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            >
              {#if !field.hasDefaultValue}
                <option selected value="">Select {fC(field.name)}</option>
              {/if}
              {#each enumValues.get(field.name) || [] as e}
                <option value={e}>{fC(e)}</option>
              {/each}
            </select>
					{:else if isRequired1to1Relation(field)}
						<SearchField {field} />
          {:else}
            <input
              type={inputTypeGuess(field)}
              name={field.name}
              id={field.name}
              class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
              placeholder={fC(field.name)}
              required={isRequired(field)}
            />
          {/if}
        </div>
				{/if}
      {/each}
    {/if}
  </div>
  <button
    type="submit"
    class="inline-flex items-center px-5 py-2.5 mt-4 sm:mt-6 text-sm font-medium text-center text-white bg-primary-700 rounded-lg focus:ring-4 focus:ring-primary-200 dark:focus:ring-primary-900 hover:bg-primary-800"
  >
    Add {fC(entity)}
  </button>
</form>


<style>
	input[type=checkbox] {
		height: 50%;
		position: relative;
		cursor: pointer;
	}

	input[type=checkbox]:checked {
		border: solid red;
	}
</style>
