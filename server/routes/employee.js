const express = require('express');
const authMiddleware = require('../middleware/auth');
const { pool } = require('../db/connect');
const Router = express.Router();

const getAccountByAccountId = async function (account_id) {
  try {
    const result = await pool.query(
      'select * from account a inner join employee_user b on a.userid = b.userid where a.account_id=$1',
      [account_id]
    );
    return result.rows[0];
  } catch (error) {
    return null;
  }
};

async function getEmployeeDetails() {
  try {
    const result = await pool.query(
      'select * from employee_info'
    );
    // delete result.rows[0].password;
    return result.rows;
  } catch (error) {
    return null;
  }
}

// get account details by email
Router.get('/employee', authMiddleware, async (req, res) => {
  try {
    const result = await getEmployeeDetails();
    if (result) {
      res.send(result);
    } else {
      res.status(400).send({
        get_error: 'Account details does not exist.'
      });
    }
  } catch (error) {
    res.status(400).send({
      get_error: 'Error while getting account details..Try again later.'
    });
  }
});

Router.post('/employee', authMiddleware, async (req, res) => {
  const { first_name, last_name, email, phone_number, gender, joined_date } = req.body;
  try {
    const existingEmployee = await pool.query(
      'SELECT * FROM employee_info WHERE email = $1',
      [email]
    );
    
    if (existingEmployee.rows.length > 0) {
      return res.status(400).json({ message: 'An employee with that email already exists' });
    }
    
    const result = await pool.query(
      'INSERT INTO employee_info (first_name, last_name, email, phone_number, gender, joined_date) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *',
      [first_name, last_name, email, phone_number, gender, joined_date]
    );
    res.json(result.rows[0]);
  } catch (error) {
    console.error(error);
    res.status(500).send('Server error');
  }
});

Router.put('/employee/:id', authMiddleware, async (req, res) => {
  const id = req.params.id;
  const { first_name, last_name, email, phone_number, gender, joined_date } = req.body;
  try {
    const result = await pool.query(
      'UPDATE employee_info SET first_name = $1, last_name = $2, email = $3, phone_number = $4, gender = $5, joined_date = $6 WHERE id = $7 RETURNING *',
      [first_name, last_name, email, phone_number, gender, joined_date, id]
    );
    if (result.rows.length === 0) {
      res.status(404).send('User not found');
    } else {
      res.json(result.rows[0]);
    }
  } catch (err) {
    console.error(err);
    res.status(401).send(err);
  }

});
Router.delete('/employee/:id', authMiddleware, async (req, res) => {
  const id = req.params.id;
  try {
    const result = await pool.query('DELETE FROM employee_info WHERE id = $1 RETURNING *', [id]);
    if (result.rows.length === 0) {
    res.status(404).send('User not found');
    } else {
    res.json(result.rows[0]);
    }
    } catch (err) {
    console.error(err);
    res.status(500).send('Server error');
    }
    });

module.exports = { Router, getAccountByAccountId };
