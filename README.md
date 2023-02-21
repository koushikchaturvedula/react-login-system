# Getting Started with Create React App

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Available Scripts

In the project directory, you can run:

### `yarn start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

The page will reload if you make edits.\
You will also see any lint errors in the console.

### `yarn test`

Launches the test runner in the interactive watch mode.\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `yarn run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `yarn run eject`

**Note: this is a one-way operation. Once you `eject`, you can’t go back!**

If you aren’t satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you’re on your own.

You don’t have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn’t feel obligated to use this feature. However we understand that this tool wouldn’t be useful if you couldn’t customize it when you are ready for it.

## Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

## backend server setup

Navigate to the server folder using the command line interface or terminal.
Once inside the server folder, run `yarn` command to install all the required packages for the server.
After the installation is complete, run `yarn start` to start the server. The server will be hosted at [http://localhost:5000].

To configure the PostgreSQL database, please follow the instructions below:

Ensure that you have PostgreSQL installed on your machine.
Locate the dump.sql file inside the server folder at path /server/dump.sql.
Create a new database in PostgreSQL with the name of your choice.
Import the data from the dump.sql file into your new database using the following command:

`psql -U [username] -d employee_management < path/to/dump.sql`

ADMIN
eamil: alicejohnson@example.com
password: Qw1qw1

STANDART
email: janedoe@example.com
password: Qw1qw1
