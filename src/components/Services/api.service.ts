/* eslint-disable */
import axios, { AxiosError, AxiosResponse } from 'axios';

import { isEmpty } from 'lodash';


import { message as notificationMessage } from 'antd';

export const apiBaseUrl = `http://localhost:5000`;

const validateResponse = (res: AxiosResponse, resolve: Function, reject: Function) => {
  const { data } = res;
  console.log(data)
  if (data) {
    resolve(data);
  } else {
    notificationMessage.error(data.message);
    reject(data.message);
  }
};

const extractErrMsg = (
  err: AxiosError,
  reject: Function) => {
  if (err) {
    const { message } = err.response?.data as any;
    if (message) {
      notificationMessage.error(message);
      // reject(message);
    } else {
      notificationMessage.error("Something went wrong!");
      // reject("Something went wrong!");
    }
  }
};

const handleErr = (err: AxiosError, reject: Function) => {
  if (err.response?.status === 401) {
    localStorage.removeItem('user');
    window.location.reload();
  }
  return extractErrMsg(err, reject);
};

const api = axios.create({
  baseURL: apiBaseUrl,
});

const updateHeader = () => {
  const user = JSON.parse(localStorage.getItem('user') as any) || {};
  const authProvider = JSON.parse(localStorage.getItem('authProvider') as any);
  if (!isEmpty(user)) {
    const { token } = user;
    api.defaults.headers.common.Authorization = `Bearer ${token} `;
    api.defaults.headers.common.x_auth_provider = authProvider || 'internal';
    return;
  }
  api.defaults.headers.common.Authorization = '';
};
//eslint-disable-next-line @typescript-eslint/no-unsafe-assignment
export const get = async (endpoint: string): Promise<any> => {
  updateHeader();
  return new Promise((resolve, reject) => {
    api
      .get(endpoint)
      .then((res: AxiosResponse) => {
        validateResponse(res, resolve, reject);
      })
      .catch((err: AxiosError) => {
        handleErr(err, reject);
      });
  });
};

export const post = async (
  endpoint: string,
  //eslint-disable-next-line @typescript-eslint/no-unsafe-assignment
  payload: any,
  headers?: { [key in string]: any }
): Promise<any> => {
  updateHeader();

  return new Promise((resolve, reject) => {
    api
      .post(endpoint, !isEmpty(payload) && payload, {
        ...(headers && {
          headers: {
            ...headers,
          },
        }),
      })
      .then((res: AxiosResponse) => {
        validateResponse(res, resolve, reject);
      })
      .catch((err: AxiosError) => {
        handleErr(err, reject);
      });
  });
};

// eslint-disable-next-line
export const put = async (endpoint: string, payload: any) => {
  updateHeader();
  return new Promise((resolve, reject) => {
    api
      .put(endpoint, payload,)
      .then((res: AxiosResponse) => {
        validateResponse(res, resolve, reject);
      })
      .catch((err: AxiosError) => {
        // handleErr(err, reject)
      });
  });
};

// eslint-disable-next-line
export const remove = async (endpoint: string, payload?: any) => {
  updateHeader();
  return new Promise((resolve, reject) => {
    api
      .delete(endpoint, {
        ...(payload && { data: payload }),
      })
      .then((res: AxiosResponse) => {
        validateResponse(res, resolve, reject);
      })
      .catch((err: AxiosError) => {
        handleErr(err, reject);
      });
  });
};