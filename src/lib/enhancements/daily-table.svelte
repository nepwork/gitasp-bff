<script lang="ts">
  import { createSvelteTable, getCoreRowModel } from '@tanstack/svelte-table';
  import type { ColumnDef } from '@tanstack/svelte-table';
	import { Component } from 'gridjs';

  type Person = {
    id: string;
    name: string;
    email: string;
    position: string;
    status: 'Online' | 'Offline';
    image: string;
  };

  const data: Person[] = [
    {
      id: '1',
      name: 'Neil Sams',
      email: 'neil.sims@flowbite.com',
      position: 'React Developer',
      status: 'Online',
      image: '/docs/images/people/profile-picture-1.jpg',
    },
    {
      id: '2',
      name: 'Bon E Green',
      email: 'bonnie@flowbite.com',
      position: 'Designer',
      status: 'Online',
      image: '/docs/images/people/profile-picture-3.jpg',
    },
    {
      id: '3',
      name: 'Jese Leos',
      email: 'jese@flowbite.com',
      position: 'Vue JS Developer',
      status: 'Online',
      image: '/docs/images/people/profile-picture-2.jpg',
    },
    {
      id: '4',
      name: 'Thomas Lean',
      email: 'thomes@flowbite.com',
      position: 'UI/UX Engineer',
      status: 'Online',
      image: '/docs/images/people/profile-picture-5.jpg',
    },
    {
      id: '5',
      name: 'Leslie Livingston',
      email: 'leslie@flowbite.com',
      position: 'SEO Specialist',
      status: 'Offline',
      image: '/docs/images/people/profile-picture-4.jpg',
    },
  ];

  const columns: ColumnDef<Person>[] = [
    {
      id: 'select',
      header: ({ table }) => ({
        component: 'input',
        props: {
          type: 'checkbox',
          checked: table?.getIsAllRowsSelected() ?? false,
          indeterminate: table?.getIsSomeRowsSelected(),
          on: {
            change: table?.getToggleAllRowsSelectedHandler()
          }
        }
      }),
      cell: ({ row }) => ({
        component: 'input',
				table,
        props: {
          type: 'checkbox',
          checked: row.getIsSelected(),
          on: {
            change: row.getToggleSelectedHandler()
          }
        }
      }),
    },
    {
      accessorKey: 'name',
      header: 'Name',
      cell: ({ row }) => ({
        component: 'div',
        props: {
          class: 'flex items-center'
        },
        children: [
          {
            component: 'img',
            props: {
              class: 'w-10 h-10 rounded-full',
              src: row.original.image,
              alt: `${row.original.name} image`
            }
          },
          {
            component: 'div',
            props: {
              class: 'ps-3'
            },
            children: [
              {
                component: 'div',
                props: {
                  class: 'text-base font-semibold'
                },
                children: row.original.name
              },
              {
                component: 'div',
                props: {
                  class: 'font-normal text-gray-500'
                },
                children: row.original.email
              }
            ]
          }
        ]
      }),
    },
		{
      accessorKey: 'position',
      header: 'Position',
    },
    {
      accessorKey: 'status',
      header: 'Status',
      cell: ({ row }) => ({
        component: 'div',
        props: {
          class: 'flex items-center'
        },
        children: [
          {
            component: 'div',
            props: {
              class: `h-2.5 w-2.5 rounded-full ${row.original.status === 'Online' ? 'bg-green-500' : 'bg-red-500'} me-2`
            }
          },
          row.original.status
        ]
      }),
    },
    {
      id: 'action',
      header: 'Action',
      cell: () => ({
        component: 'a',
        props: {
          href: '#',
          class: 'font-medium text-teal-600 dark:text-teal-500 hover:underline'
        },
        children: 'Edit user'
      }),
    },
  ];

  const table = createSvelteTable({
    data,
    columns,
    getCoreRowModel: getCoreRowModel(),
  });
</script>

<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
  <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
    <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
      {#each $table.getHeaderGroups() as headerGroup}
        <tr>
          {#each headerGroup.headers as header}
            <th scope="col" class="px-6 py-3">
              {#if header.isPlaceholder}
                null
              {:else if typeof header.column.columnDef.header === 'function'}
							{@const headerContent = header.column.columnDef.header(header.getContext())}
								{#if headerContent?.component}
                <svelte:component this={headerContent.component} {...headerContent.props}>
                  {headerContent.children}
                </svelte:component>
								{/if}
              {:else}
                {header.column.columnDef.header}
              {/if}
            </th>
          {/each}
        </tr>
      {/each}
    </thead>
    <tbody>
      {#each $table.getRowModel().rows as row}
        <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
          {#each row.getVisibleCells() as cell}
            <td class="px-6 py-4">
              {#if typeof cell.column.columnDef.cell === 'function'}
                {@const cellContent = cell.column.columnDef.cell( cell.getContext())}
                <svelte:component this={cellContent.component} {...cellContent.props}>
                  {#if cellContent.children}
                    {#if Array.isArray(cellContent.children)}
                      {#each cellContent.children as child}
											{#if child?.component}
                        <svelte:component this={child.component} {...child.props}>
                          {child.children}
                        </svelte:component>
											{/if}
                      {/each}
                    {:else}
                      {cellContent.children}
                    {/if}
                  {/if}
                </svelte:component>
              {:else}
                {cell.getValue()}
              {/if}
            </td>
          {/each}
        </tr>
      {/each}
    </tbody>
  </table>
</div>
