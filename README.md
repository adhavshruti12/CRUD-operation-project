# Register_form Project

This web-based application allows users to perform CRUD (Create, Read, Update, Delete) operations on user records. Each record includes the user's name, roll number, address, and gender. It is built using JSP for frontend rendering and Java Servlets for backend logic, interacting with a MySQL database.

## Features

1. **Create**: Add a new user record using a form.
2. **Read**: Display user records in a table.
3. **Update**: Update an existing user record by clicking the pencil icon.
4. **Delete**: Delete a user record by clicking the trash icon.
5. **View**: View details of a user record by clicking the eye icon.

## Technologies Used

- **Frontend**: JSP, CSS
- **Backend**: Java Servlets
- **Database**: MySQL
- **Server**: Apache Tomcat

## Prerequisites

- Java Development Kit (JDK) installed
- Apache Tomcat installed
- MySQL database installed and running
- A MySQL database and user set up

## Project Configuration

### 1. Clone the Repository

Clone the forked repository to your local machine using the following command:

    ```bash
     git clone https://github.com/yourusername/Register_form.git
### 2. Import Project
Import the project into your Java IDE (e.g., Eclipse, IntelliJ IDEA) after cloning it.

### 3. Configure Database Connection
Update the database connection details (jdbc:mysql://localhost:3306/Register_form, username, password) in the database.java file located in the src directory of the project.

### 4. Run the Application
Deploy on Apache Tomcat
Deploy the project on the Apache Tomcat server from your IDE or manually copy the files to the Tomcat webapps directory.

## Prerequisites
Create a database and table to store user records.
 ```sql
CREATE DATABASE Register_form;

USE Register_form;

CREATE TABLE info (
 ID INT AUTO_INCREMENT PRIMARY KEY,
NAME NVARCHAR(40),
ROLL_NO NVARCHAR(30),
ADDRESS NVARCHAR(90),
GENDER NVARCHAR(20)
);

