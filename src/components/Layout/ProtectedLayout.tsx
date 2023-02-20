import { Grid, Layout, Space } from "antd";
import { Navigate, useLocation, useOutlet } from "react-router-dom";

import { useEffect, useState } from "react";
import { ErrorBoundary, Header, Navbar } from "../";
import { useAuth } from "../Hooks/useAuth";
import styles from "./Layout.module.scss";
const { useBreakpoint } = Grid;
const { Content, Sider } = Layout;
export const ProtectedLayout = () => {
  const { user } = useAuth();
  const outlet = useOutlet();
  const location = useLocation();
  const { md, lg, sm } = useBreakpoint();
  const [height, setHeight] = useState(0);

  useEffect(() => {
    setHeight(window.innerHeight - 110);

    window.addEventListener("resize", () => {
      setHeight(window.innerHeight - 110);
    });
  }, []);

  if (!user || !user.token) {
    return <Navigate to="/login" replace state={{ location }} />;
  }

  const collapsed = !(md && lg);

  return (
    <Layout>
      <Space direction="vertical" size="middle">
        <Header />
        <Layout>
          <Sider
            style={{
              height,
            }}
            className={styles.sider}
            collapsed={collapsed}
          >
            <Navbar collapsed={collapsed} />
          </Sider>
          <ErrorBoundary>
            <Content
              style={{
                overflowY: "auto",
                overflowX: "hidden",
                height,
                width: "100%",
                padding: "40px 40px",
              }}
            >
              {outlet}
            </Content>
          </ErrorBoundary>
        </Layout>
      </Space>
    </Layout>
  );
};
