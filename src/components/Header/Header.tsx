import { UserOutlined } from '@ant-design/icons';
import { Icon } from '@iconify/react';
import {
  Avatar,
  Col,
  Divider,
  Dropdown,
  Grid,
  Image,
  InputRef,
  Layout,
  Menu,
  Row,
  Space,
  Typography
} from 'antd';
import cs from 'classnames';
import { useRef, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../Hooks/useAuth';
import { useNotification } from '../Hooks/useNotification';
import { Roles } from '../Utils/Roles';
import styles from './Header.module.scss';
const { Text } = Typography;
const { useBreakpoint } = Grid;

export const Header = () => {
  const [searchText, setSearchText] = useState('');
  const { user, logout } = useAuth();
  const { lg, md, xs } = useBreakpoint();
  const { openToast } = useNotification();
  const navigate = useNavigate();
  const extras = useRef<HTMLDivElement>(null);
  const searchBar = useRef<InputRef>(null);

  if (!user) {
    navigate('/login');
  }



  const getRole = () => {
    switch (user.access[0]) {
      case Roles.SUPER_ADMIN:
        return 'Admin';
      case Roles.STANDARD:
        return 'Standard';
      default:
        return '';
    }
  };

  if (!user) {
    navigate('/login');
  }

  return (
    <Layout.Header
      className={cs(styles.header, {
        [styles.SmallHeader]: xs,
      })}
    >
      <Row justify="space-between" align="middle" style={{ height: '100%' }}>
        <Col span={6} className={styles.logoStyle}>
          <Image
            // src={Employee}
            preview={false}
            style={{
              maxWidth: 180,
              cursor: 'pointer',
            }}
            onClick={() => navigate('/dashboard')}
          />{' '}
        </Col>
        <Col span={18} style={{ textAlign: 'right' }}>
          <div
            style={{
              marginLeft: 'auto',
              display: 'flex',
              justifyContent: 'flex-end',
              alignItems: 'center',
              lineHeight: 1,
              gap: 16,
            }}
          >

            <div className={styles.NavExtras} ref={extras}>
              <Divider type="vertical" />
              <Typography.Link>
                <Dropdown
                  overlay={
                    <Menu>
                      {!lg && (
                        <Menu.Item key="profile" disabled>
                          <Space
                            style={{
                              display: 'flex',
                              flexDirection: 'column',
                              lineHeight: 1,
                              textAlign: 'left',
                              alignItems: 'start',
                              justifyContent: 'center',
                            }}
                            size={4}
                          >
                            <Text strong className={styles.userName} ellipsis>
                              {user && user.email.split('@')[0]}
                            </Text>
                            <Text type="secondary" strong={false} ellipsis>
                              {getRole()}
                            </Text>
                          </Space>
                        </Menu.Item>
                      )}

                      <Menu.Item key="logout" onClick={() => logout()}>
                        Logout
                      </Menu.Item>
                    </Menu>
                  }
                  trigger={['click']}
                >
                  <Space size={'small'} style={{ display: 'inline-flex', alignItems: 'center' }}>
                    <Avatar
                      size={40}
                      icon={<UserOutlined />}
                    />
                    {lg && (
                      <Space
                        style={{
                          display: 'flex',
                          flexDirection: 'column',
                          lineHeight: 1,
                          textAlign: 'left',
                          alignItems: 'start',
                          justifyContent: 'center',
                        }}
                        size={4}
                      >
                        <Text strong className={styles.userName} ellipsis>
                          {user && user.name}
                        </Text>
                        <Text type="secondary" strong={false} ellipsis>
                          {getRole()}
                        </Text>
                      </Space>
                    )}

                    <Icon
                      icon="ep:arrow-down-bold"
                      height="20"
                      style={{ margin: 'auto', color: styles.strawberry }}
                    />
                  </Space>
                </Dropdown>
              </Typography.Link>
            </div>
          </div>
        </Col>
      </Row>
    </Layout.Header>
  );
};
