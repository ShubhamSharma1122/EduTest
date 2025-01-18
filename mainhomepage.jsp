<%-- 
    Document   : mainhomepage
    Created on : 22 Apr, 2024, 2:41:14 PM
    Author     : Shiva
--%>
<!DOCTYPE html>
<html>
<head>
    <title>Main Home Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('home.jpg');
            background-size: cover;
            background-position: center;
            margin: 20px;
            padding: 20px;
        }
        h1 {
            color: #1a73e8;
        }
        .container {
            max-width: 600px;
            margin: auto;
            text-align: center;
            background-color: #f4f4f4;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        a {
            display: block;
            margin-bottom: 15px;
            padding: 10px;
            background-color: #1a73e8;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #0d47a1;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to the Student Portal!</h1>
        <p>Please choose an option:</p>
        <a href="studentregistrationpage.jsp">Register as a Student</a>
        <a href="studentloginpage.jsp">Login</a>
    </div>
</body>
</html>
