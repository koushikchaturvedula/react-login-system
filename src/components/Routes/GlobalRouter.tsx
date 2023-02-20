import { Navigate, Route, Routes } from "react-router-dom";
import { GlobalLayout, PageNotFound, ProtectedLayout } from "../";

import { ReactNode } from "react";
import { useAuth } from "../Hooks/useAuth";
import { useHasAccess } from "../Hooks/useHasAccess";
import { globalRoutes, protectRoutes } from "./Routes";

export function GlobalRouter() {
  const { hasPermissions } = useHasAccess();
  const { user } = useAuth();
  const getElementwithAccess = (element: ReactNode, roles: string[]) => {
    if (!user || !user.token) {
      return <Navigate to="/login" />;
    } else {
      console.log(roles + "  rples list");
      return hasPermissions(roles) ? (
        <> {element} </>
      ) : (
        <Navigate to="/unauthorized-entry" />
      );
    }
  };
  return (
    <Routes>
      <Route path="*" element={<PageNotFound />} />
      <Route path="/" element={<Navigate to="/dashboard" />} />
      <Route element={<ProtectedLayout />}>
        {protectRoutes.map(({ path, element, roles }) => (
          <Route
            path={path}
            element={getElementwithAccess(element, roles)}
            key={path}
          />
        ))}
      </Route>
      <Route element={<GlobalLayout />}>
        {globalRoutes.map(({ path, element, ...res }) => (
          <Route path={path} {...res} element={element} key={path} />
        ))}
      </Route>
    </Routes>
  );
}
