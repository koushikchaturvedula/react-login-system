
import { ReactNode } from "react";
import { Chart } from "../Chart";
import { Dashboard } from '../Dashboard/Dashboard';
import { UnAuthorized } from "../ErrorHandlers/UnAuthorized";
import Login from "../Login";
import Signup from "../SignUp";
import { permissions } from "../Utils/Roles";

interface RouteBase {
  path: string;
  element: ReactNode;
}

interface ProtectedRoutes extends RouteBase {
  roles: string[];
}

export const protectRoutes: ProtectedRoutes[] = [
  {
    path: "/dashboard",
    element: <Dashboard />,
    roles: ["*"],
  },
  {
    path: "/chart",
    element: <Chart />,
    roles: [permissions.VIEW_CHART],
  },
];

export const globalRoutes = [
  {
    path: "/login",
    element: <Login />,
  },
  {
    path: "/signup",
    element: <Signup />,
  },
  {
    path: "/unauthorized-entry",
    element: <UnAuthorized />,
  },
];
