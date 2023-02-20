import { Card, Col, Layout, Row } from "antd";

import styles from "./Layout.module.scss";

export const Content = (props: any) => {
  return (
    <Layout.Content>
      <Row style={{ height: window.innerHeight }} align="middle">
        {/* <Col
          xs={{ span: 0 }}
          md={{ span: 12 }}
          className={styles.rightSideSection}
        ></Col> */}
        <Col
          xs={{ span: 24 }}
          md={{ span: 24 }}
          className={styles.leftSideSection}
        >
          <div className={styles.onboardingContentWrapper}>
            <Row
              justify="center"
              align="middle"
              style={{ marginTop: styles.whitespace3, width: "100%" }}
            >
              <Col xs={{ span: 24 }} md={{ span: 24 }}>
                <Card
                  className={styles.cardStyle}
                  bodyStyle={{
                    width: "100%",
                    margin: "auto",
                    paddingBlock: styles.whitespace4,
                  }}
                >
                  {props.children}
                </Card>
              </Col>
            </Row>
          </div>
        </Col>
      </Row>
    </Layout.Content>
  );
};
