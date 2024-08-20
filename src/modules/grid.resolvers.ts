import type { ColDef } from 'ag-grid-community';
import { isRemovable, mapAgGridType } from './form.resolvers';
import { getMetaData } from '../../prisma/db-utils';

export const resolveColumns = (entity: string) => {
	const metaData = getMetaData(entity);

	const mapper = new Map<string, string | boolean>();
	mapper.set('Decimal', 'number');
	mapper.set('Int', 'number');
	mapper.set('BigInt', 'number');
	mapper.set('String', 'text');
	mapper.set('DateTime', 'date');

	const mapColType = mapAgGridType(metaData);

	const columnDefs: (rowData: any[]) => ColDef[] = (rowData) =>
		rowData.length
			? Object.keys(rowData[0] as object)
					.filter((f) => !isRemovable(f))
					.map((field) => {
						const ret = {
							field,
							filter: true,
							cellDataType: mapper.get(mapColType(field)) ?? 'text',
						};

						if (ret.cellDataType === 'date') {
							return {
								...ret,
								valueFormatter: (params) => {
									console.log("params data", params.data)
									const date = new Date(params.data[field]);
									if (!Number.isNaN(date)) {
										return `${date.toLocaleTimeString()} ${date.toLocaleDateString()}`;
									}
									return ''; // Handle invalid date
								},
							};
						}

						if (ret.cellDataType === 'number' && field !== 'id') {
							return {
								...ret,
								valueFormatter: (params) => {
									if (
										params.value != null &&
										!Number.isNaN(params.data[field])
									) {
										return params.data[field].toFixed(2);
									}
									return ''; // Handle invalid number
								},
							};
						}

						if (field === 'id') {
							return {
								...ret,
								hide: true,
							};
						}
						return {
							...ret,
						};
					})
			: [];

	return {
		columnDefs,
	};
};
