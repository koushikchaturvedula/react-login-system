import { LockOutlined, MailOutlined, PhoneOutlined, UserOutlined } from '@ant-design/icons';
import { Button, Input, Radio } from 'antd';
import { ErrorMessage, Field, Form, Formik } from 'formik';
import * as Yup from 'yup';
import { Content } from './Layout/Content';
import { post } from './Services/api.service';

const Signup = () => {
  const initialValues = {
    firstName: '',
    lastName: '',
    email: '',
    phone: '',
    gender: '',
    password: '',
  };

  const validationSchema = Yup.object().shape({
    firstName: Yup.string().required('Please input your first name!'),
    lastName: Yup.string().required('Please input your last name!'),
    email: Yup.string().email('The input is not a valid email!').required('Please input your email!'),
    phoneNumber: Yup.string().required('Please input your phone number!'),
    gender: Yup.string().required('Please select your gender!'),
    password: Yup.string().required('Please input your password!'),
  });

  const handleSubmit = (values: any) => {
    console.log('Submitted values:', values);
    // API call to submit form data
    const payload = {
      first_name: values.firstName,
      last_name: values.lastName,
      email: values.email,
      phone_number: values.phoneNumber,
      gender: values.gender,
      password: values.password,
    }
    post("/signup", payload)
  };

  return (
    <Content>
      <Formik initialValues={initialValues} validationSchema={validationSchema} onSubmit={(values) => handleSubmit(values)}

      >
        {({ isSubmitting }) => (
          <Form className="signup-form">
            <div className="form-group">
              <label htmlFor="firstName">First Name</label>
              <Field type="text" name="firstName" placeholder="First Name" as={Input} prefix={<UserOutlined />} />
              <ErrorMessage name="firstName" className="error-message" />
            </div>

            <div className="form-group">
              <label htmlFor="lastName">Last Name</label>
              <Field type="text" name="lastName" placeholder="Last Name" as={Input} prefix={<UserOutlined />} />
              <ErrorMessage name="lastName" className="error-message" />
            </div>

            <div className="form-group">
              <label htmlFor="email">Email</label>
              <Field type="email" name="email" placeholder="Email" as={Input} prefix={<MailOutlined />} />
              <ErrorMessage name="email" className="error-message" />
            </div>

            <div className="form-group">
              <label htmlFor="phoneNumber">Phone Number</label>
              <Field type="text" name="phoneNumber" placeholder="Phone Number" as={Input} prefix={<PhoneOutlined />} />
              <ErrorMessage name="phoneNumber" className="error-message" />
            </div>

            <div className="form-group">
              <label htmlFor="gender">Gender</label>
              <div className="radio-group">
                <Field type="radio" name="gender" value="male" as={Radio} className="radio-button" /> Male
                <Field type="radio" name="gender" value="female" as={Radio} className="radio-button" /> Female
                <Field type="radio" name="gender" value="other" as={Radio} className="radio-button" /> Other
              </div>
              <ErrorMessage name="gender" className="error-message" />
            </div>

            <div className="form-group">
              <label htmlFor="password">Password</label>
              <Field type="password" name="password" placeholder="Password" as={Input.Password} prefix={<LockOutlined />} />
              <ErrorMessage name="password" className="error-message" />
            </div>

            <Button type="primary" htmlType="submit" className="submit-button" disabled={isSubmitting}>
              {isSubmitting ? 'Submitting...' : 'Submit'}
            </Button>
          </Form>
        )}
      </Formik>
    </Content>
  );
};

export default Signup;