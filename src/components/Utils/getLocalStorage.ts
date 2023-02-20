export const getAccessToken = () => {
    return JSON.parse(localStorage.getItem('user') || '{}')?.token;
  };
  