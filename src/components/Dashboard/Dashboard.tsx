
import { Icon } from "@iconify/react";
import { Button, Modal, Space, Typography } from 'antd';

import Table from 'antd/es/table';
import moment from 'moment';
import { useEffect, useState } from 'react';
import { useHasAccess } from "../Hooks/useHasAccess";
import { useNotification } from "../Hooks/useNotification";
import { get, post, put, remove } from '../Services/api.service';
import { permissions } from "../Utils/Roles";
import { User } from '../Utils/types';
import { capitalizedStr } from './../Utils/CommonUtils';
import { dbformat } from './../Utils/types';
import UserForm from './UserForm';



export const Dashboard = () => {
  const [users, setUsers] = useState<any[]>([]);
  const [selectedUser, setSelectedUser] = useState<User | null>(null);
  const [showAddModal, setShowAddModal] = useState(false);
  const [showEditModal, setShowEditModal] = useState(false);
  const [showDeleteModal, setShowDeleteModal] = useState(false);
  const { hasPermissions, hasRole } = useHasAccess();
  const { openToast, openNotification } = useNotification();

  const fetchUsers = async () => {
    try {
      get("employee").then((res: any) => {
        setUsers(res);
      })
    } catch (error) {
      console.error(error);
    }
  };
  useEffect(() => {

    fetchUsers();
  }, []);

  const handleAddUser = () => {
    setShowAddModal(true);
  };

  const handleEditUser = (user: User) => {
    setSelectedUser(user);
    setShowEditModal(true);
  };

  const handleDeleteUser = (user: User) => {
    setSelectedUser(user);
    setShowDeleteModal(true);
  };
  const columns = [
    {
      title: 'First Name',
      dataIndex: 'first_name',
      key: 'first_name',
      sorter: (a: any, b: any) =>
        a.first_name.localeCompare(b.first_name),
      render: (value: string) =>
        capitalizedStr(value)

    },
    {
      title: 'Last Name',
      dataIndex: 'last_name',
      key: 'last_name',
      sorter: (a: any, b: any) =>
        a.last_name.localeCompare(b.last_name),
      render: (value: string) =>
        capitalizedStr(value)
    },
    {
      title: 'Email',
      dataIndex: 'email',
      sorter: (a: any, b: any) =>
        a.email.localeCompare(b.email),
      key: 'email',
    },
    {
      title: 'Phone Number',
      dataIndex: 'phone_number',
      key: 'phone_number',
      sorter: (a: any, b: any) =>
        a.phone_number.localeCompare(b.phone_number),
      render: (value: string) =>
        `+65 ${value}`
    },
    {
      title: 'Gender',
      dataIndex: 'gender',
      key: 'gender',
      sorter: (a: any, b: any) =>
        a.gender.localeCompare(b.gender),
      render: (value: string) =>
        capitalizedStr(value)
    },
    {
      title: 'Joined Date',
      dataIndex: 'joined_date',
      key: 'joined_date',
      sorter: (a: any, b: any) =>
        a.joined_date.localeCompare(b.joined_date),
      render: (value: string) =>
        moment(value, dbformat).format("DD MMM YYYY"),
    },
    {
      title: 'Actions',
      key: 'actions',
      render: (text: any, record: User) => (
        <>
          <Space>
            <Icon
              type="link"
              icon={"typcn:edit"}
              width={20}
              style={{ cursor: "pointer", color: "#1677ff" }}
              onClick={() => handleEditUser(record)}
            />
            <Icon
              type="link"
              icon={"ic:baseline-delete"}
              width={20}
              style={{ cursor: "pointer", color: "red" }}
              onClick={() => handleDeleteUser(record)}
            />
          </Space>
        </>
      ),
    },
  ];

  const handleAddUserModalOk = async (values: any) => {
    try {
      let data
      post('/employee', values)
        .then((res: any) => {
          if (res) {
            openNotification({
              title: "success!!",
              message: "Employee created successfully",
              type: "success",
            });
            fetchUsers()
          }
        })
      setShowAddModal(false);
    } catch (error) {
      console.error(error);
    }
  };

  const handleEditUserModalOk = async (id: any, values: any) => {
    try {
      console.log(values + "  values");
      put(`/employee/${selectedUser?.id}`, values).then(() => {
        openNotification({
          title: "success!!",
          message: "Employee updated successfully",
          type: "success",
        });
        fetchUsers()
      })

      setShowEditModal(false);
    } catch (error) {
      console.error(error);
    }
  };

  const handleDeleteUserModalOk = async () => {
    try {
      remove(`/employee/${selectedUser?.id}`).then(() => {
        fetchUsers()
        openNotification({
          title: "success!!",
          message: "Employee deleted successfully",
          type: "success",
        });
      })
      setShowDeleteModal(false);
    } catch (error) {
      console.error(error);
    }
  }
  return (
    <>
      <Typography.Text strong style={{ color: "#4096ff" }}>
        Employee's
      </Typography.Text>
      <Button
        disabled={!hasPermissions([permissions.VIEW_CHART])}
        type="primary" onClick={handleAddUser} style={{ marginBottom: 16, float: "right" }}>Add Employee</Button>
      <Table
        dataSource={users}
        columns={columns.filter((column) => {
          if (hasPermissions([permissions.VIEW_CHART])) {
            return true;
          }
          return column.key !== 'actions';
        })} rowKey="id" />
      <Modal
        style={{ paddingBottom: "20px" }}
        title="Add Employee"
        open={showAddModal}
        onCancel={() => setShowAddModal(false)}
        footer={null}
      >
        <UserForm
          createUser={handleAddUserModalOk}
          updateUser={handleEditUserModalOk}
        />
      </Modal>

      <Modal
        style={{ marginBottom: "120px" }}

        title="Edit Employee"
        open={showEditModal}
        onCancel={() => setShowEditModal(false)}
        destroyOnClose={true}
        footer={null}
      >
        {selectedUser &&
          <UserForm user={selectedUser}
            createUser={handleAddUserModalOk}
            updateUser={handleEditUserModalOk}
          />
        }
      </Modal>

      <Modal
        title="Delete Employee"
        open={showDeleteModal}
        onCancel={() => setShowDeleteModal(false)}
        onOk={handleDeleteUserModalOk}
        okText="Delete"
        cancelText="Cancel"
        okButtonProps={{ danger: true }}
      >
        {selectedUser && (
          <>
            <p>Are you sure you want to delete this user?</p>
            <p><strong>{`${capitalizedStr(selectedUser.first_name)} ${capitalizedStr(selectedUser.last_name)}`}</strong></p>
          </>
        )}
      </Modal>
    </>
  );
};


