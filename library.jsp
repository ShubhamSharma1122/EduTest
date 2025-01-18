<%-- 
    Document   : library
    Created on : 29 Apr, 2024, 1:07:37 AM
    Author     : Shiva
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library</title>
    <style>
        /* Global styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        header {
            background-color: #007bff;
            color: #fff;
            padding: 20px;
            text-align: center;
        }
        nav {
            text-align: center;
            margin-top: 20px;
        }
        nav ul {
            list-style-type: none;
            padding: 0;
        }
        nav ul li {
            display: inline;
            margin-right: 10px;
        }
        nav ul li a {
            color: #fff;
            text-decoration: none;
            padding: 10px;
        }
        main {
            padding: 20px;
            text-align: center;
        }
        section {
            background-color: #fff;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            text-align: left;
        }
        h2 {
            color: #007bff;
            margin-bottom: 10px;
        }
        ul {
            padding-left: 20px;
        }
        footer {
            background-color: #007bff;
            color: #fff;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
        }

        /* Responsive layout */
        @media (max-width: 768px) {
            nav ul {
                display: block;
                text-align: center;
            }
            nav ul li {
                display: block;
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>Library</h1>
        <nav>
            <ul>
                <li><a href="mainhomepage.jsp">Home</a></li>
                <li><a href="exam.jsp">Exam</a></li>
                <li><a href="result.jsp">Results</a></li>
                <li><a href="library.jsp">Library</a></li>
                <li><a href="index.html">Logout</a></li>
            </ul>
        </nav>
    </header>
    
    <main>
        <section>
            <h2>Study Materials</h2>
            <ul>
                <li>Mathematics Notes</li>
                <li>Physics Formulas</li>
                <li>Chemistry Revision Guide</li>
            </ul>
        </section>
        
        <section>
            <h2>Reference Books</h2>
            <ul>
                <li>Introduction to Java Programming</li>
                <li>Data Structures and Algorithms</li>
                <li>Web Development Essentials</li>
            </ul>
        </section>
        
        <section>
            <h2>Past Exam Papers</h2>
            <ul>
                <li>Mathematics Exam 2023</li>
                <li>Physics Exam 2022</li>
                <li>Chemistry Exam 2021</li>
            </ul>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2024 Online Exam System</p>
    </footer>
</body>
</html>
