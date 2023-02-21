const express = require('express');
const authRoute = require('./routes/auth');
const cors = require('cors');
const employeeRoute = require('./routes/employee');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 5000;

app.use(express.json());
app.use(cors());
app.set('view engine', 'ejs');
app.use(authRoute);
app.use(employeeRoute.Router);

app.listen(PORT, () => {
  console.log(`server started on port ${PORT}`);
});
