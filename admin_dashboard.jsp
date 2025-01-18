<%-- 
    Document   : admin_dashboard
    Created on : 27 Apr, 2024, 10:12:26 PM
    Author     : Shiva
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('home.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: #333;
            color: #fff;
            padding: 15px 20px;
            box-sizing: border-box;
            z-index: 1000;
        }
        .container {
            max-width: 800px;
            margin: 80px auto 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            box-sizing: border-box;
            text-align: center;
        }
        .menu {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            margin-top: 20px;
        }
        .menu a {
            display: inline-block;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            padding: 15px 40px;
            border-radius: 25px;
            margin: 10px;
            font-size: 18px;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: background-color 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 123, 255, 0.2);
        }
        .menu a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Admin Dashboard</h1>
    </div>
    
    
    <div class="container">
        <div class="menu">
            <a href="adminloginpage.jsp">Home</a>
            <a href="AddQuestionServlet.jsp">Add java Questions</a>
            <a href="AddQuestion1.jsp">Add DSA Questions</a>
            <a href="AddQuestion2.jsp">Add Apptitude Questions</a>
            <a href="DeleteQuestion.jsp">Delete Question</a>
            
            
            <a href="index.html">Logout</a>
        </div>
        
    </div>
</body>
</html>
