import { LockOutlined, UserOutlined } from '@ant-design/icons';
import { Button, Form, Input, Typography } from 'antd';
import { Formik } from 'formik';
import * as Yup from 'yup';
import { useAuth } from './Hooks/useAuth';
import { Content } from './Layout/Content';

const Login = () => {
  const { login, isLoading } = useAuth();

  const handleSubmit = (values: any, { setSubmitting }: { setSubmitting: (isSubmitting: boolean) => void }) => {
    // API call to submit form data
    login(values)
    setSubmitting(false);
  };


  const validationSchema = Yup.object().shape({
    email: Yup.string().email('The input is not a valid email!').required('Please input your email!'),
    password: Yup.string().required('Please input your password!'),
  });

  return (
    <Content>
      <Formik
        initialValues={{ email: '', password: '' }}
        validationSchema={validationSchema}
        onSubmit={handleSubmit}
      >
        {({ values, errors, touched, handleChange, handleBlur, handleSubmit, isSubmitting }) => (
          <Form className="signup-form" onFinish={handleSubmit}>
            <Typography.Title level={2} style={{ textAlign: "center" }} >Login</Typography.Title>
            <Form.Item
              name="email"
              validateStatus={touched.email && errors.email ? 'error' : ''}
              help={touched.email && errors.email ? errors.email : ''}
            >
              <Input
                prefix={<UserOutlined className="site-form-item-icon" />}
                placeholder="Email address"
                name="email"
                value={values.email}
                onChange={handleChange}
                onBlur={handleBlur}
              />
            </Form.Item>
            <Form.Item
              name="password"
              validateStatus={touched.password && errors.password ? 'error' : ''}
              help={touched.password && errors.password ? errors.password : ''}
            >
              <Input.Password
                prefix={<LockOutlined className="site-form-item-icon" />}
                placeholder="Password"
                name="password"
                value={values.password}
                onChange={handleChange}
                onBlur={handleBlur}
              />
            </Form.Item>
            <Button type="primary" style={{ width: "100%" }} htmlType="submit" className="submit-button" disabled={isLoading}>
              {isLoading ? 'Logging in...' : 'Login'}
            </Button>
          </Form>
        )}
      </Formik>
    </Content>
  );
};
export default Login;
