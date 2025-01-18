<%-- 
    Document   : Exam1.jsp
    Created on : 14 Jun, 2024, 2:12:02 PM
    Author     : Shiva
--%>

<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Exam</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('exam.jpg');
            background-size: cover;
            background-position: center;
            background-color: #f7f7f7;
            color: #333;
            padding: 20px;
            box-sizing: border-box;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #1a73e8;
            text-align: center;
        }
        .options label {
            display: block;
            margin-bottom: 10px;
        }
        input[type="radio"] {
            margin-right: 10px;
        }
        #timer {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #e91e63;
        }
        #result {
            margin-top: 20px;
            padding: 20px;
            border-radius: 8px;
            background-color: #e3f2fd;
        }
        #result h3 {
            color: #1a73e8;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Online Exam</h2>

    <div id="timer">Time Left: <span id="countdown">30:00</span></div>

    <div class="card" id="questionCard">
        <%  
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql:///dwivedijidb?useSSL=false", "root", "dwivediji");

                if (request.getMethod().equalsIgnoreCase("post")) {
                    // Exam submission handling
                    int totalQuestions = 0;
                    int correctAnswers = 0;

                    stmt = conn.createStatement();
                    String sql = "SELECT * FROM questionsdsa";
                    rs = stmt.executeQuery(sql);

                    while (rs.next()) {
                        String correctAnswer = rs.getString("correct_answer");
                        String userAnswer = request.getParameter("answer_" + rs.getInt("id"));

                        totalQuestions++;

                        if (userAnswer != null && userAnswer.equals(correctAnswer)) {
                            correctAnswers++;
                        }
                    }

                    // Calculate score percentage
                    int scorePercentage = (int) ((correctAnswers / (double) totalQuestions) * 100);

                    // Display exam results
        %>
                    <div id="result">
                        <h3>Exam Results</h3>
                        <p>Total Questions: <%= totalQuestions %></p>
                        <p>Correct Answers: <%= correctAnswers %></p>
                        <p>Score: <%= scorePercentage %>%</p>
                    </div>
        <%
                } else {
                    // Display exam questions
                    stmt = conn.createStatement();
                    String sql = "SELECT * FROM questionsdsa";
                    rs = stmt.executeQuery(sql);

                    int questionNumber = 1;

                    out.println("<form id='examForm' method='post'>");

                    while (rs.next()) {
                        String questionText = rs.getString("question_text");
                        String optionA = rs.getString("option_a");
                        String optionB = rs.getString("option_b");
                        String optionC = rs.getString("option_c");
                        String optionD = rs.getString("option_d");

        %>
                        <div class="question">
                            <p><strong>Question <%= questionNumber %>:</strong> <%= questionText %></p>
                            <div class="options">
                                <label><input type='radio' name='answer_<%= rs.getInt("id") %>' value='A'> <%= optionA %></label>
                                <label><input type='radio' name='answer_<%= rs.getInt("id") %>' value='B'> <%= optionB %></label>
                                <label><input type='radio' name='answer_<%= rs.getInt("id") %>' value='C'> <%= optionC %></label>
                                <label><input type='radio' name='answer_<%= rs.getInt("id") %>' value='D'> <%= optionD %></label>
                            </div>
                        </div>
        <%
                        questionNumber++;
                    }

                    // Add a submit button
                    out.println("<input type='submit' value='Submit Exam'>");
                    out.println("</form>");
                }

            } catch (Exception e) {
                out.println("<p>An error occurred: " + e.getMessage() + "</p>");
                e.printStackTrace();
            } finally {
                // Close resources
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
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
        %>
    </div>

</div>

<script>
    // Timer countdown script
    var countdown = document.getElementById('countdown');
    var totalTime = 15 * 60; // 120 minutes in seconds

    function startTimer() {
        var timer = setInterval(function() {
            var minutes = Math.floor(totalTime / 60);
            var seconds = totalTime % 60;

            countdown.textContent = (minutes < 10 ? '0' : '') + minutes + ':' + (seconds < 10 ? '0' : '') + seconds;

            if (totalTime <= 0) {
                clearInterval(timer);
                document.getElementById('examForm').submit(); // Automatically submit exam when time's up
            }

            totalTime--;
        }, 1000);
    }

    startTimer(); // Start the timer
</script>

</body>
</html>