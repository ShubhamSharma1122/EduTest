<%-- 
    Document   : adminregistrationpage
    Created on : 27 Apr, 2024, 5:15:56 PM
    Author     : Shiva
--%>

<%@page import="java.sql.*"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('home.jpg');
            background-size: cover;
            background-position: center;
            margin: 20px;
            padding: 20px;
        }
        h2 {
            color: #1a73e8;
        }
        form {
            max-width: 500px;
            margin: auto;
            background-color: #f4f4f4;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }
        input[type="text"],
        input[type="email"],
        input[type="date"],
        input[type="password"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="radio"] {
            margin-right: 10px;
        }
        input[type="submit"] {
            background-color: #1a73e8;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0d47a1;
        }
        .message {
            margin-top: 20px;
            padding: 10px;
            border-radius: 4px;
        }
        .success {
            background-color: #d4edda;
            border-color: #c3e6cb;
            color: #155724;
        }
        .error {
            background-color: #f8d7da;
            border-color: #f5c6cb;
            color: #721c24;
        }
    </style>
</head>
<body>
    <h2>Admin Registration</h2>
    

    <%!
        // Method to generate a unique application number
        private String generateApplicationNumber() {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
            return "APP" + sdf.format(new Date());
        }
    %>

    <%
        // Process registration form submission
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            // Retrieve form data
            String fullName = request.getParameter("fullname");
            String email = request.getParameter("email");
            String dob = request.getParameter("dob");
            String contact = request.getParameter("contact");
            String city = request.getParameter("city");
            String country = request.getParameter("country");
            String gender = request.getParameter("gender");
            String password = request.getParameter("password");

            // Generate application number
            String applicationNumber = generateApplicationNumber();

            // Establish MySQL database connection
            Connection conn = null;
            Statement statement = null;
            try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql:///dwivedijidb?useSSL=false", "root", "dwivediji");

                statement = conn.createStatement();

                // Construct SQL query for insertion
                String sql = "INSERT INTO studentreg (application_number, fullname, email, dob, contact, city, country, gender, password) " +
                             "VALUES ('" + applicationNumber + "', '" + fullName + "', '" + email + "', '" + dob + "', '" + contact + "', '" + city + "', '" + country + "', '" + gender + "', '" + password + "')";

                // Execute the SQL statement
                int rowsInserted = statement.executeUpdate(sql);
                if (rowsInserted > 0) {
    %>
                    <div class="message success">
                        Registration successful. Your application number is: <%= applicationNumber %>
                    </div>
    <%
                } else {
    %>
                    <div class="message error">
                        Registration failed. Please try again.
                    </div>
    <%
                }
            } catch (Exception e) {
    %>
                <div class="message error">
                    Error: <%= e.getMessage() %>
                </div>
    <%
            } finally {
                // Close resources
                try {
                    if (statement != null) {
                        statement.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException ex) {
    %>
                    <div class="message error">
                        Error closing database connection: <%= ex.getMessage() %>
                    </div>
    <%
                }
            }
        }
    %>

    <form method="post" action="adminregistrationpage.jsp">
        <label for="fullname">Full Name:</label>
        <input type="text" id="fullname" name="fullname" required><br>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>
        
        <label for="dob">Date of Birth:</label>
        <input type="date" id="dob" name="dob" required><br>
        
        <label for="contact">Contact No:</label>
        <input type="text" id="contact" name="contact" required><br>
        
        <label for="city">City:</label>
        <input type="text" id="city" name="city" required><br>
        
        <label for="country">Country:</label>
        <input type="text" id="country" name="country" required><br>
        
        <label>Gender:</label>
        <input type="radio" name="gender" value="Male" id="genderMale" checked>
        <label for="genderMale">Male</label>
        <input type="radio" name="gender" value="Female" id="genderFemale">
        <label for="genderFemale">Female</label><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>
        
        <input type="submit" value="Register">
    </form>
</body>
</html>
