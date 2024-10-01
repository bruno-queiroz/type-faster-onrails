export interface ServerDefaultResponse<T> {
  data: T;
  isOk: boolean;
  message: string;
}

export interface User {
  created_at: Date,
  email: string,
  id: number,
  image: string,
  name: string,
  provider: string,
  uid: string,
  updated_at: Date
}

export const baseApiUrl = "http://127.0.0.1:3000";
export const deployUrl = "";
