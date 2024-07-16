<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Registration</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.css" type="text/css"> 
    <link rel="stylesheet" href="css/font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.min.css" type="text/css">
</head>
<body>
    <div class="container">
        <div class="login-box">
            <form name="infoForm" action="info" method="post">
                <input type="hidden" name="takeaction" id="takeaction" value="ADD">
                <input type="hidden" name="roll_no" id="roll_no">
                <h1>Student Registration</h1>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" placeholder="Enter your name" name="name" id="name" required>
                </div>
                <div class="form-group">
                    <label for="roll_no_input">Roll No.:</label>
                    <input type="text" placeholder="Enter your roll no" name="roll_no_input" id="roll_no_input" required>
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" placeholder="Enter your address" name="address" id="address" required>
                </div>
                <div class="form-group">
                    <label for="gender">Gender:</label>
                    <select name="gender" id="gender" required>
                        <option value="">Select Gender</option>
                        <option value="female">Female</option>
                        <option value="male">Male</option>
                        <option value="other">Other</option>
                    </select>
                </div>
                 
                <button class="btn" type="submit">Submit</button>
                <button class="btn-save" type="button" onclick="saveChanges()">Save Changes</button>

            </form>
        </div>
        
        <div class="table-container">
            <table id="entriesTable">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Roll No.</th>
                        <th>Address</th>
                        <th>Gender</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Register_form", "root", "root");
                        Statement st = cn.createStatement();
                        ResultSet rs = st.executeQuery("select * from info");
                        while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getString("NAME") %></td>
                        <td><%= rs.getString("ROLL_NO") %></td>
                        <td><%= rs.getString("ADDRESS") %></td>
                        <td><%= rs.getString("GENDER") %></td>
                        <td>
                            <button type="button" class="view-button" onclick="viewRecord('<%= rs.getString("NAME") %>', '<%= rs.getString("ROLL_NO") %>', '<%= rs.getString("ADDRESS") %>', '<%= rs.getString("GENDER") %>')">
                                <i class="fa fa-eye" aria-hidden="true"></i>
                            </button>
                            <button type="button" class="update-button" onclick="updateRecord('<%= rs.getString("NAME") %>', '<%= rs.getString("ROLL_NO") %>', '<%= rs.getString("ADDRESS") %>', '<%= rs.getString("GENDER") %>')">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                            </button>
                            <button type="button" class="delete-button" onclick="deleteRecord('<%= rs.getString("ROLL_NO") %>')">
                                <i class="fa fa-trash" aria-hidden="true"></i>
                            </button>
                        </td>
                    </tr>
                    <% 
                        }
                        rs.close();
                        st.close();
                        cn.close();
                    } catch (Exception e) {
                        out.println(e);
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <script type="text/javascript">
        function viewRecord(name, roll_no, address, gender) {
            document.getElementById('name').value = name;
            document.getElementById('roll_no').value = roll_no;
            document.getElementById('address').value = address;
            document.getElementById('gender').value = gender;

            disableFormFields();
        }

        function updateRecord(name, roll_no, address, gender) {
            document.getElementById('name').value = name;
            document.getElementById('roll_no').value = roll_no;
            document.getElementById('address').value = address;
            document.getElementById('gender').value = gender;

            document.getElementById('takeaction').value = "UPDATE";
        }

        function deleteRecord(roll_no) {
            if (confirm("Are you sure you want to delete this record?")) {
                document.getElementById('roll_no').value = roll_no;
                document.getElementById('takeaction').value = "DELETE";
                document.infoForm.submit();
            }
        }

        function disableFormFields() {
            document.getElementById('name').disabled = true;
            document.getElementById('roll_no').disabled = true;
            document.getElementById('address').disabled = true;
            document.getElementById('gender').disabled = true;
        }

        function saveChanges() {
            document.getElementById('takeaction').value = "UPDATE";
            document.infoForm.submit();
        }
    </script>
</body>
</html>
