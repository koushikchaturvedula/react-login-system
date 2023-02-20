import { Icon } from '@iconify/react';
import { Layout, Menu, MenuProps, Typography } from 'antd';
import moment from 'moment';
import { ReactElement, useState } from 'react';
import { useLocation, useNavigate } from 'react-router-dom';
import { useHasAccess } from '../Hooks/useHasAccess';
import { permissions } from '../Utils/Roles';
import styles from './Navbar.module.scss';
const { Footer } = Layout;
const { Text, Title } = Typography;

const getIcon = (icon: string, rotate = 0) => (
  <Icon icon={icon} className={styles.navbarItemIcon} inline rotate={rotate} />
);

type NavItem = {
  icon: ReactElement;
  label: string;
  key: string;
  locked?: boolean;
  roles: string[];
};

type AntMenuItem = Required<MenuProps>['items'][number];

interface MenuItem extends NavItem {
  childrens?: NavItem[];
}

interface Props {
  collapsed: boolean;
}

export const Navbar = ({ collapsed }: Props) => {
  const { hasPermissions, hasRole } = useHasAccess();
  const { pathname } = useLocation();
  const [open, setOpen] = useState(false);

  const navigate = useNavigate();

  function getItem({
    roles,
    label,
    key,
    icon,
    children,
    locked,
    checkRole = false,
  }: {
    roles: string[];
    label: React.ReactNode;
    key?: React.Key | null;
    icon?: React.ReactNode;
    children?: AntMenuItem[];
    locked?: boolean;
    checkRole?: boolean;
  }): AntMenuItem {
    if (checkRole) {
      if (hasRole(roles[0])) {
        return {
          key,
          icon,
          children,
          label,
          ...(locked && { disabled: true }),
        } as AntMenuItem;
      } else {
        return null;
      }
    } else if (hasPermissions(roles)) {
      return {
        key,
        icon,
        children,
        label,
      } as AntMenuItem;
    }
    return null;
  }

  const items: AntMenuItem[] = [
    getItem({
      roles: ['*'],
      label: 'Dashboard',
      key: '/dashboard',
      icon: getIcon('ic:outline-poll'),
    }),
    getItem({
      roles: [permissions.VIEW_CHART],
      label: 'Chart',
      key: '/chart',
      icon: getIcon('ic:outline-poll'),
    }),

    getItem({
      roles: [permissions.VIEW_USER],
      label: 'Users',
      key: '/users',
      icon: getIcon('ph:users-bold'),
    }),
  ];

  const getOpenKeys = () => {
    const keys: any = [];

    items.find((o: any) =>
      o?.key === pathname
        ? keys.push(o.key)
        : o?.children?.find((c: any) => (c?.key === pathname ? keys.push(o.key) : null))
    );

    return keys;
  };

  const getPrimaryActiveKey = () => {
    let result = '';
    items.map((primary: any) =>
      primary?.key?.split('/')[1] === pathname.split('/')[1]
        ? (result = primary.key)
        : primary?.children?.map((child: any) =>
          child.key.split('?')[0] === pathname.split('?')[0] ? (result = child.key) : ''
        )
    );

    return result;
  };



  return (
    <Layout
      style={{
        background: "#4CB5F5",
        height: '100%',
        paddingTop: 12,
        overflowY: 'auto',
        overflowX: 'hidden',
      }}
    >
      <Menu
        selectable
        mode="inline"
        items={items}
        style={{
          background: "transparent",
        }}
        className={styles.navBar}
        defaultOpenKeys={getOpenKeys()}
        selectedKeys={[getPrimaryActiveKey()]}
        onClick={({ key }) => {
          if (key === 'nocloud') {
            // setOpen(true);
            return false;
          } else {
            navigate(key);
          }
        }}
      />
      {!collapsed && (
        <Footer className={styles.footerStyle}>
          <Title level={5} style={{ color: styles.white }}>
            &copy; {moment().format('YYYY')}
          </Title>
        </Footer>
      )}
    </Layout>
  );
};
