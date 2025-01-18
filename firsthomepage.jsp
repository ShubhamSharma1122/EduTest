<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Examination System</title>
    <style>
        /* Full page background image */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('home.jpg'); /* Replace with your image */
            background-size: cover; /* Image should cover the whole page */
            background-position: center; /* Center the image */
            height: 100vh; /* Full height of the page */
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
        }

        /* Centered container with transparent background */
        .container {
            text-align: center;
            padding: 40px;
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black background */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 500px; /* Maximum width for container */
            width: 100%; /* Ensure container takes full width in smaller screens */
        }

        /* Header text styling */
        h1 {
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6); /* Shadow to make text clearer */
        }

        /* Quote styling */
        .quote {
            font-size: 18px;
            font-style: italic;
            color: #ddd; /* Lighter text color for readability */
            margin-bottom: 20px;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.6); /* Shadow for better visibility */
        }

        /* Button container */
        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        /* Button styling */
        button {
            padding: 12px 24px;
            font-size: 18px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: transform 0.2s, background-color 0.3s;
        }

        /* Styling for 'Student' button */
        button.student {
            background-color: #007bff;
            color: #fff;
        }

        /* Styling for 'Admin' button */
        button.admin {
            background-color: #28a745;
            color: #fff;
        }

        /* Hover effect for buttons */
        button:hover {
            transform: scale(1.1);
        }

        /* Hover effect for admin button */
        button.admin:hover {
            background-color: #218838;
        }

        /* Media queries for responsiveness */
        @media (max-width: 600px) {
            body {
                padding: 20px;
            }
            h1 {
                font-size: 28px;
            }
        }
    </style>
</head>
<body>
    <!-- Main container with content -->
    <div class="container">
        <h1>Edutest</h1>
        <h1>Hello, Welcome</h1>
        <p class="quote">"We provide services related to testing your abilities."</p>
        <p class="quote">"Success is not the key to happiness. Happiness is the key to success. If you love what you are doing, you will be successful."</p>
        
        <!-- Button container -->
        <div class="button-container">
            <button class="student" onclick="window.location.href='mainhomepage.jsp?type=student'">Student Services</button>
            <button class="admin" onclick="window.location.href='firsthomepage.jsp?type=admin'">Administrator Services</button>
        </div>
    </div>
</body>
</html>
