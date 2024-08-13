export const style = {
  table: {
    border: '1px solid #e2e8f0',
    fontSize: '14px',
    backgroundColor: '#ffffff',
  },
  th: {
    backgroundColor: '#f8fafc',
    color: '#475569',
    borderBottom: '2px solid #e2e8f0',
    padding: '12px 16px',
    fontWeight: '600',
    textTransform: 'uppercase',
    letterSpacing: '0.05em',
  },
  td: {
    padding: '16px',
    borderBottom: '1px solid #e2e8f0',
    color: '#1e293b',
  },
  container: {
    boxShadow: '0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06)',
  },
  footer: {
    backgroundColor: '#f8fafc',
    borderTop: '1px solid #e2e8f0',
    padding: '12px 16px',
    fontSize: '13px',
    color: '#64748b',
  },
  pagination: {
    padding: '12px 16px',
    fontSize: '13px',
    color: '#64748b',
    button: {
      border: '1px solid #e2e8f0',
      padding: '6px 12px',
      marginRight: '8px',
      cursor: 'pointer',
      backgroundColor: '#ffffff',
      color: '#64748b',
      borderRadius: '4px',
      transition: 'all 0.2s',
      '&:enabled:hover': {
        backgroundColor: 'rgba(0, 188, 212, 0.1)',
        borderColor: 'rgba(0, 188, 212, 0.5)',
      },
      '&:disabled': {
        opacity: '0.5',
        cursor: 'not-allowed',
      },
      '&:enabled:active': {
        backgroundColor: 'rgba(0, 188, 212, 0.2)',
      },
      '&.selected': {
        backgroundColor: 'rgba(0, 188, 212, 0.1)',
        borderColor: 'rgba(0, 188, 212, 0.5)',
        color: '#0891b2',
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
        color: '#0891b2',
        '&:hover': {
          backgroundColor: 'rgba(8, 145, 178, 0.1)',
        },
      },
      '&.delete': {
        color: '#e11d48',
        '&:hover': {
          backgroundColor: 'rgba(225, 29, 72, 0.1)',
        },
      },
    },
  },
}
