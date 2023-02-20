import { Button, DatePicker, Input, Radio, Select, Space, Typography } from 'antd';
import dayjs from 'dayjs';
import { ErrorMessage, Field, Form, Formik } from 'formik';
import { parsePhoneNumberFromString } from 'libphonenumber-js';
import moment from 'moment';
import * as Yup from 'yup';
import "yup-phone";
import { User, dateFormat } from '../Utils/types';
import styles from './Dashboard.module.scss';

const { Option } = Select;

type UserFormProps = {
  user?: User;
  createUser: (user: User) => void;
  updateUser: (id: number, user: User) => void;
};
const prefixSelector = (
  <Input.Group compact>
    <Input style={{ width: '70px' }} defaultValue="+65" disabled />
  </Input.Group>
);

const UserForm: React.FC<UserFormProps> = ({ user, createUser, updateUser }) => {
  const initialValues: User = {
    id: user?.id || 0,
    first_name: user?.first_name || '',
    last_name: user?.last_name || '',
    email: user?.email || '',
    phone_number: user?.phone_number || '',
    gender: user?.gender || 'male',
    joined_date: user?.joined_date || '',
  };

  const validationSchema = Yup.object().shape({
    first_name: Yup.string()
      .required('First name is required')
      .min(6, 'First name must be at least 6 characters')
      .max(10, 'First name cannot be more than 10 characters'),
    last_name: Yup.string()
      .required('Last name is required')
      .min(6, 'Last name must be at least 6 characters')
      .max(10, 'Last name cannot be more than 10 characters'),
    email: Yup.string()
      .email('Invalid email address')
      .required('Email address is required'),
    phone_number: Yup.string().required()
      .test('valid-phone', 'Invalid phone number', (value) => {
        if (!value) return false;
        const phoneNumber = parsePhoneNumberFromString(value, 'SG');
        return phoneNumber ? phoneNumber.isValid() : false;
      }),
    gender: Yup.string().required('Gender is required'),
    joined_date: Yup.date()
      .max(new Date(), 'Joined date cannot be in the future')
  });

  function disabledDate(current: any) {
    return current && current > moment().endOf('day');
  }
  const handleSubmit = (values: User) => {
    if (user && user.id) {
      console.log(values);
      updateUser(user.id, values);
    } else {
      createUser(values);
    }
  };

  return (
    <Formik initialValues={initialValues} onSubmit={handleSubmit} validationSchema={validationSchema}>
      {({ values, errors, touched, setFieldValue, isValid }) => (
        <Form>
          <div style={{ padding: "10px 0px" }}>
            <label htmlFor="first_name">First Name <span className={styles.error}>*</span></label>
            <Field type="text" name="first_name" as={Input} />
            <ErrorMessage name="first_name" render={msg => <div className={styles.error}>{msg}</div>} />
          </div>
          <div style={{ padding: "10px 0px" }}>
            <label htmlFor="last_name">Last Name <span className={styles.error}>*</span></label>
            <Field type="text" name="last_name" as={Input} />
            <ErrorMessage name="last_name" render={msg => <div className={styles.error}>{msg}</div>} />
          </div>
          <div style={{ padding: "10px 0px" }}>
            <label htmlFor="email">Email <span className={styles.error}>*</span></label>
            <Field type="email" name="email" as={Input} />
            <ErrorMessage name="email" render={msg => <div className={styles.error}>{msg}</div>} />
          </div>
          <div style={{ padding: "10px 0px" }}>
            <label htmlFor="phone_number">Phone Number <span className={styles.error}>*</span></label>
            <Input.Group>
              <Input value={values.phone_number} prefix="+65"
                onChange={e => setFieldValue('phone_number', e.target.value)}
                placeholder="Phone number" />
            </Input.Group>
            <ErrorMessage name="phone_number" render={msg => <div className={styles.error}>
              {errors.phone_number}</div>} />
            <Typography.Text type="danger">{errors.phone_number && "Phone number is required"}</Typography.Text>

          </div>
          <div style={{ padding: "10px 0px" }}>
            <Space>
              <label htmlFor="gender">Gender <span className={styles.error}>*</span> :</label>
              <Radio.Group
                name="gender"
                onChange={e => setFieldValue('gender', e.target.value)}
                value={values.gender}
              >
                <Radio value="male">Male</Radio>
                <Radio value="female">Female</Radio>
                <Radio value="other">Other</Radio>
              </Radio.Group>
            </Space>
            <ErrorMessage name="gender" render={msg => <div className={styles.error}>{msg}</div>} />
          </div>
          <div style={{ padding: "10px 0px" }}>
            <Space>
              <label htmlFor="joined_date">Joined Date <span className={styles.error}>*</span>:</label>
              <DatePicker
                defaultValue={values.joined_date ? dayjs(values.joined_date, dateFormat) : undefined}
                placeholder='YYYY/MM/DD'
                onChange={(date, dateString) => setFieldValue("joined_date", dateString)}
                format={dateFormat}
                disabledDate={disabledDate}
              />
            </Space>
            <ErrorMessage name="joined_date" render={msg => <div className={styles.error}>{msg}</div>} />
            <Space align="end" style={{ float: "right" }}>
              <Button
                type="primary"
                disabled={!(isValid)}
                onClick={(e: any) => handleSubmit(values)}
              >
                {user ? 'Update' : 'Add'}
              </Button>
            </Space>
          </div>
          {/* <Button style={{ float: "right" }} type="primary" htmlType="submit">{user ? 'Update' : 'Add'}</Button> */}

        </Form>
      )}
    </Formik>
  );
};

export default UserForm;
