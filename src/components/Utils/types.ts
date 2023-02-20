export interface User {
  id?: number;
  first_name: string;
  last_name: string;
  email: string;
  phone_number: string;
  gender: 'male' | 'female' | 'other';
  joined_date: string;
}
export const dateFormat = 'YYYY/MM/DD';
export const dbformat = 'YYYY-MM-DD';
export const dateMonthFormat = 'DD/MM/YYYY';
export const dateTZFormat = 'YYYY-MM-DDT00:00:00.000Z';