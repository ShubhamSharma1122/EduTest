<%-- 
    Document   : DeleteQuestion
    Created on : 22 Apr, 2024, 9:54:11 PM
    Author     : Shiva
--%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Question</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            background-image: url('home.jpg');
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
            box-sizing: border-box;
        }

        h2 {
            color: #1a73e8;
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-bottom: 8px;
        }

        input[type="text"] {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #1a73e8;
            color: #ffffff;
            border: none;
            padding: 12px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0d47a1;
        }

        .message {
            padding: 12px;
            border-radius: 4px;
            text-align: center;
            margin-top: 20px;
        }

        .message.success {
            background-color: #d4edda;
            color: #155724;
            border-color: #c3e6cb;
        }

        .message.error {
            background-color: #f8d7da;
            color: #721c24;
            border-color: #f5c6cb;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Delete a Question</h2>

    <% 
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String questionToDelete = request.getParameter("question_to_delete");

            Connection conn = null;
            PreparedStatement stmt = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql:///dwivedijidb?useSSL=false", "root", "dwivediji");

                String sql = "DELETE FROM questions WHERE question_text = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, questionToDelete);

                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) { %>
                    <div class="message success">
                        Question deleted successfully!
                    </div>
                <% } else { %>
                    <div class="message error">
                        Question not found or failed to delete.
                    </div>
                <% }
            } catch (Exception e) { %>
                <div class="message error">
                    An error occurred: <%= e.getMessage() %>
                </div>
            <% } finally {
                if (stmt != null) {
                    try {
                        stmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    %>

    <form method="post">
        <label for="question_to_delete">Enter Question to Delete:</label>
        <input type="text" id="question_to_delete" name="question_to_delete" required>

        <input type="submit" value="Delete Question">
    </form>
</div>

</body>
</html>
