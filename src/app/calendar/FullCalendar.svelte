<script lang="ts">
	import { GradientButton, Input, Label, Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell } from 'flowbite-svelte';
	import { InlineCalendar } from 'svelte-calendar';
	import { writable } from 'svelte/store';
	import { darkTheme, lightTheme } from './calendar.theme';


	let store: any;
	let theme = writable(lightTheme);

	document.addEventListener('dark-mode', (e) => {
		console.log("dark-mode", e);
		theme.set($theme === lightTheme ? darkTheme : lightTheme);
	})
</script>

<div class="flex gap-8">
	<InlineCalendar bind:store theme={$theme} format={'DD/MM/YYYY'} />

	<div class="shadow-xl w-[40vw]" >

		<div class="flex mx-4">
			<div class="mb-6 px-1">
				<Label for="default-input" class="block mb-2">Patient Name</Label>
				<Input id="default-input" placeholder="Full Name of Patient" />
			</div>
			<div class="mb-6 px-1">
				<Label for="default-input" class="block mb-2">Time</Label>
				<Input id="default-input" placeholder="Start to End Time" />
			</div>
			<div class="mb-6 px-1">
				<Label for="default-input" class="block mb-2">Doctor</Label>
				<Input id="default-input" placeholder="Doctor / Provider" />
			</div>
			<div class="mb-6 px-1 place-self-end">
				<GradientButton class="bg-teal-400" shadow>Quick Add</GradientButton>
			</div>
		</div>

		<Table striped={true}>
			<TableHead>
				<TableHeadCell>Patient Name</TableHeadCell>
				<TableHeadCell>Start Time</TableHeadCell>
				<TableHeadCell>End Time</TableHeadCell>
				<TableHeadCell>Doctor</TableHeadCell>
				<TableHeadCell>
					<span class="sr-only">Edit</span>
				</TableHeadCell>
			</TableHead>
			<TableBody tableBodyClass="divide-y">
				<TableBodyRow>
					<TableBodyCell>Apple MacBook Pro 17"</TableBodyCell>
					<TableBodyCell>Sliver</TableBodyCell>
					<TableBodyCell>Laptop</TableBodyCell>
					<TableBodyCell>$2999</TableBodyCell>
					<TableBodyCell>
						<div class="flex gap-4">
							<a href="/tables" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Edit</a>
							<a href="/tables" class="font-medium text-red-600 hover:underline dark:text-red-500">Delete</a>
						</div>
					</TableBodyCell>
				</TableBodyRow>
				<TableBodyRow>
					<TableBodyCell>Microsoft Surface Pro</TableBodyCell>
					<TableBodyCell>White</TableBodyCell>
					<TableBodyCell>Laptop PC</TableBodyCell>
					<TableBodyCell>$1999</TableBodyCell>
					<TableBodyCell>
						<a href="/tables" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Edit</a>
					</TableBodyCell>
				</TableBodyRow>
				<TableBodyRow>
					<TableBodyCell>Magic Mouse 2</TableBodyCell>
					<TableBodyCell>Black</TableBodyCell>
					<TableBodyCell>Accessories</TableBodyCell>
					<TableBodyCell>$99</TableBodyCell>
					<TableBodyCell>
						<a href="/tables" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Edit</a>
					</TableBodyCell>
				</TableBodyRow>
				<TableBodyRow>
					<TableBodyCell>Google Pixel Phone</TableBodyCell>
					<TableBodyCell>Gray</TableBodyCell>
					<TableBodyCell>Phone</TableBodyCell>
					<TableBodyCell>$799</TableBodyCell>
					<TableBodyCell>
						<a href="/tables" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Edit</a>
					</TableBodyCell>
				</TableBodyRow>
				<TableBodyRow>
					<TableBodyCell>Apple Watch 5</TableBodyCell>
					<TableBodyCell>Red</TableBodyCell>
					<TableBodyCell>Wearables</TableBodyCell>
					<TableBodyCell>$999</TableBodyCell>
					<TableBodyCell>
						<a href="/tables" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Edit</a>
					</TableBodyCell>
				</TableBodyRow>
			</TableBody>
		</Table>
	</div>
</div>
