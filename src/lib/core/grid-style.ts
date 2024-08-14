export const style = {
  table: {
    border: '1px solid #80deea',
    fontSize: '14px',
    backgroundColor: '#ffffff',
		whiteSpace: 'no-wrap'
  },
  th: {
    backgroundColor: '#e0f7fa',
    color: '#00838f',
    borderBottom: '2px solid #0097a7',
    padding: '12px 16px',
    fontWeight: '600',
    textTransform: 'uppercase',
    letterSpacing: '0.05em',
  },
  td: {
    padding: '16px',
    borderBottom: '1px solid #e0f7fa',
    color: '#00838f',
  },
  container: {
    boxShadow: '0 1px 3px 0 rgba(0, 188, 212, 0.1), 0 1px 2px 0 rgba(0, 188, 212, 0.06)',
  },
  footer: {
    backgroundColor: '#e0f7fa',
    borderTop: '1px solid #b2ebf2',
    padding: '12px 16px',
    fontSize: '13px',
    color: '#00838f',
  },
  pagination: {
    padding: '12px 16px',
    fontSize: '13px',
    color: '#00838f',
    button: {
      border: '1px solid #4dd0e1',
      padding: '6px 12px',
      marginRight: '8px',
      cursor: 'pointer',
      backgroundColor: '#ffffff',
      color: '#00bcd4',
      borderRadius: '4px',
      transition: 'all 0.2s',
      '&:enabled:hover': {
        backgroundColor: '#e0f7fa',
        borderColor: '#00bcd4',
      },
      '&:disabled': {
        opacity: '0.5',
        cursor: 'not-allowed',
      },
      '&:enabled:active': {
        backgroundColor: '#b2ebf2',
      },
      '&.selected': {
        backgroundColor: '#4dd0e1',
        borderColor: '#00bcd4',
        color: '#ffffff',
      },
    },
  },
  action: {
    button: {
      border: 'none',
      padding: '6px 12px',
      cursor: 'pointer',
      backgroundColor: 'transparent',
      transition: 'background-color 0.2s',
      fontSize: '14px',
      borderRadius: '4px',
      '&.edit': {
        color: '#00acc1',
        '&:hover': {
          backgroundColor: 'rgba(0, 172, 193, 0.1)',
        },
      },
      '&.delete': {
        color: '#f44336',
        '&:hover': {
          backgroundColor: 'rgba(244, 67, 54, 0.1)',
        },
      },
    },
  },
}



export const updateButton = `

<button class="inline-flex items-center px-3 py-1 text-sm font-medium text-center text-white rounded-lg bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
												<svg
													class="w-4 h-4 mr-2"
													fill="currentColor"
													viewBox="0 0 20 20"
													xmlns="http://www.w3.org/2000/svg"
												>
													<svg>
														<path d="M17.414 2.586a2 2 0 00-2.828 0L7 10.172V13h2.828l7.586-7.586a2 2 0 000-2.828z" />
														<path
															fill-rule="evenodd"
															d="M2 6a2 2 0 012-2h4a1 1 0 010 2H4v10h10v-4a1 1 0 112 0v4a2 2 0 01-2 2H4a2 2 0 01-2-2V6z"
															clip-rule="evenodd"
														/>
													</svg>
												</svg>
												Update
											</button>
</button>

`

export const deleteButton = `

<button class="inline-flex items-center px-3 py-1 text-sm font-medium text-center text-white bg-red-700 rounded-lg hover:bg-red-800 focus:ring-4 focus:ring-red-300 dark:focus:ring-red-900"
>
												<svg
													class="w-4 h-4 mr-2"
													fill="currentColor"
													viewBox="0 0 20 20"
													xmlns="http://www.w3.org/2000/svg"
												>
													<path
														fill-rule="evenodd"
														d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"
														clip-rule="evenodd"
													/>
												</svg>
												Delete
											</button>
</button>

`
