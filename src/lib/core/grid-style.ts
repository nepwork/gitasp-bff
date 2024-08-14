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
