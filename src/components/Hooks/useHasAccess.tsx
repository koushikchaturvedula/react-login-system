import { isNull } from "lodash";
import { getPermissions } from "../Utils/Roles";
import { useAuth } from "./useAuth";
export const useHasAccess = () => {
  const { user } = useAuth();

  const hasPermissions = (roles: string[]) => {
    if (isNull(user)) {
      return false;
    }

    if (!user.token) {
      return false;
    }
    if (roles[0] === "*") {
      return true;
    } else {
      return user.access.some((permissionName) =>
        Boolean(getPermissions[permissionName].includes(roles[0]))
      );
    }
  };

  const hasRole = (role: string) => {
    if (isNull(user)) {
      return false;
    }

    if (!user.access) {
      return false;
    }

    if (role === "*") {
      return true;
    } else {
      return user.access[0] === role;
    }
  };

  return {
    hasPermissions,
    hasRole,
  };

};
