<%-- 
    Document   : AddQuestion2
    Created on : 14 Jun, 2024, 2:33:36 PM
    Author     : Shiva
--%>


<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Question</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            background-image: url('home.jpg');
            background-size: cover;
            background-position: center;
            padding: 20px;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
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
        input[type="text"], textarea {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            width: 100%; /* Set the text input width to 100% */
        }
        input[type="submit"] {
            background-color: #1a73e8;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0d47a1;
        }
        .message {
            margin-top: 20px;
            padding: 10px;
            border-radius: 4px;
            text-align: center;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
            border-color: #c3e6cb;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
            border-color: #f5c6cb;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Add a New Question</h2>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String questionText = request.getParameter("question_text");
            String optionA = request.getParameter("option_a");
            String optionB = request.getParameter("option_b");
            String optionC = request.getParameter("option_c");
            String optionD = request.getParameter("option_d");
            String correctAnswer = request.getParameter("correct_answer");

            // Validate and sanitize inputs (not shown in this example)

            Connection conn = null;
            Statement stmt = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql:///dwivedijidb?useSSL=false", "root", "dwivediji");
                stmt = conn.createStatement();

                String sql = "INSERT INTO questionsappt (question_text, option_a, option_b, option_c, option_d, correct_answer) " +
                             "VALUES ('" + questionText + "', '" + optionA + "', '" + optionB + "', '" + optionC + "', '" + optionD + "', '" + correctAnswer + "')";

                int rowsAffected = stmt.executeUpdate(sql);

                if (rowsAffected > 0) {
    %>
                    <div class="message success">
                        Question added successfully!
                    </div>
    <%
                } else {
    %>
                    <div class="message error">
                        Failed to add question.
                    </div>
    <%
                }
            } catch (Exception e) {
    %>
                <div class="message error">
                    An error occurred: <%= e.getMessage() %>
                </div>
    <%
            } finally {
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
        <label for="question_text">Question:</label>
        <textarea id="question_text" name="question_text" rows="4" required></textarea>

        <label for="option_a">Option A:</label>
        <input type="text" id="option_a" name="option_a" required>

        <label for="option_b">Option B:</label>
        <input type="text" id="option_b" name="option_b" required>

        <label for="option_c">Option C:</label>
        <input type="text" id="option_c" name="option_c" required>

        <label for="option_d">Option D:</label>
        <input type="text" id="option_d" name="option_d" required>

        <label for="correct_answer">Correct Answer:</label>
        <input type="text" id="correct_answer" name="correct_answer" maxlength="1" required>

        <input type="submit" value="Add Question">
    </form>
</div>

</body>
</html>





