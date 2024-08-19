<script lang="ts">
		import { GradientButton, Input, Label, Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell } from 'flowbite-svelte';

</script>

<Table striped={true} class="overflow-y-scroll">
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
			<TableBodyCell>Apple Watch 5</TableBodyCell>
			<TableBodyCell>Red</TableBodyCell>
			<TableBodyCell>Wearables</TableBodyCell>
			<TableBodyCell>$999</TableBodyCell>
			<TableBodyCell>
				<div class="flex gap-4">
					<a href="/tables" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Edit</a>
					<a href="/tables" class="font-medium text-red-600 hover:underline dark:text-red-500">Delete</a>
				</div>
			</TableBodyCell>
		</TableBodyRow>
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
				<div class="flex gap-4">
					<a href="/tables" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Edit</a>
					<a href="/tables" class="font-medium text-red-600 hover:underline dark:text-red-500">Delete</a>
				</div>
			</TableBodyCell>
		</TableBodyRow>
		<TableBodyRow>
			<TableBodyCell>Magic Mouse 2</TableBodyCell>
			<TableBodyCell>Black</TableBodyCell>
			<TableBodyCell>Accessories</TableBodyCell>
			<TableBodyCell>$99</TableBodyCell>
			<TableBodyCell>
				<div class="flex gap-4">
					<a href="/tables" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Edit</a>
					<a href="/tables" class="font-medium text-red-600 hover:underline dark:text-red-500">Delete</a>
				</div>

			</TableBodyCell>
		</TableBodyRow>
		<TableBodyRow>
			<TableBodyCell>Google Pixel Phone</TableBodyCell>
			<TableBodyCell>Gray</TableBodyCell>
			<TableBodyCell>Phone</TableBodyCell>
			<TableBodyCell>$799</TableBodyCell>
			<TableBodyCell>
				<div class="flex gap-4">
					<a href="/tables" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Edit</a>
					<a href="/tables" class="font-medium text-red-600 hover:underline dark:text-red-500">Delete</a>
				</div>

			</TableBodyCell>
		</TableBodyRow>
		<TableBodyRow>
			<TableBodyCell>Apple Watch 5</TableBodyCell>
			<TableBodyCell>Red</TableBodyCell>
			<TableBodyCell>Wearables</TableBodyCell>
			<TableBodyCell>$999</TableBodyCell>
			<TableBodyCell>
				<div class="flex gap-4">
					<a href="/tables" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Edit</a>
					<a href="/tables" class="font-medium text-red-600 hover:underline dark:text-red-500">Delete</a>
				</div>
			</TableBodyCell>
		</TableBodyRow>
	</TableBody>
</Table>
