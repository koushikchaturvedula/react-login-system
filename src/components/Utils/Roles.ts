export const permissions = {
  VIEW_DASHBOARD: "VIEW_DASHBOARD",
  VIEW_USER: "VIEW_USER",
  VIEW_CHART: "VIEW_CHART",
  VIEW_SETTINGS: "VIEW_SETTINGS"

};

export const Roles = {
  SUPER_ADMIN: "ADMIN",
  STANDARD: "STANDARD",
};

export const getPermissions = {
  [Roles.SUPER_ADMIN]: [
    permissions.VIEW_DASHBOARD,
    permissions.VIEW_SETTINGS,
    permissions.VIEW_CHART

  ],
  [Roles.STANDARD]: [
    permissions.VIEW_DASHBOARD,
  ],

};
