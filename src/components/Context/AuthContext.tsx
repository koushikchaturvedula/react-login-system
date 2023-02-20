
// import { apiBaseUrl, post } from "@services/api.service";
import React, { createContext, useMemo, useState } from "react";
import { decodeToken } from "react-jwt";
import { useNavigate } from "react-router-dom";
import { useLocalStorage } from "../Hooks/useLocalStorage";
import { useNotification } from "../Hooks/useNotification";
import { post } from "../Services/api.service";
export interface AuthContextT {
  user: {
    token: string;
    email: string;
    name: string;
    role: string;
    access: string[];
  };
  // eslint-disable-next-line @typescript-eslint/no-unsafe-assignment
  login: (data: any) => void;
  logout: () => void;
  isLoading: boolean;
}

export const AuthContext = createContext({} as AuthContextT);

export const AuthProvider = ({ children }: { children: React.ReactNode }) => {
  const [user, setUser, removeUser] = useLocalStorage("user", null);
  const [xAuthProvider, setxAuthProvider] = useLocalStorage(
    "authProvider",
    "internal"
  );
  const [isLoading, setIsLoading] = useState(false);
  const { openToast } = useNotification();


  const navigate = useNavigate();

  // call this function when you want to authenticate the user
  const login = async (data: any) => {
    // api login here
    setIsLoading(true);
    post("signin", data)
      .then((res: any) => {
        console.log(JSON.stringify(res.token) + "  res")
        const access = [] as string[];
        access.push(res.role)
        const token = res.token;
        if (token) {
          const tokenDetails: any = decodeToken(token);
          setUser({
            token,
            email: res.email,
            access: access,
            name: `${res.first_name} ${res.last_name}`
          });
          setxAuthProvider("internal");
          setIsLoading(false);
          navigate("/dashboard");
        }
      })
      .catch(() => {
        setIsLoading(false);
      });
  };



  // call this function to sign out logged in user
  const logout = () => {
    // remove token here

    removeUser("user");
    window.location.reload();
  };

  const value: AuthContextT = useMemo(
    () => ({
      user,
      login,
      logout,
      isLoading,
    }),
    // eslint-disable-next-line
    [user]
  );

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
};

