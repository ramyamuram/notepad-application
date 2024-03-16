<!-- add-note.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Note</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: radial-gradient(circle at 84% 82%, rgba(217, 217, 217,0.03) 0%, rgba(217, 217, 217,0.03) 21%,transparent 21%, transparent 100%),radial-gradient(circle at 75% 56%, rgba(3, 3, 3,0.03) 0%, rgba(3, 3, 3,0.03) 30%,transparent 30%, transparent 100%),radial-gradient(circle at 74% 53%, rgba(153, 153, 153,0.03) 0%, rgba(153, 153, 153,0.03) 95%,transparent 95%, transparent 100%),radial-gradient(circle at 86% 43%, rgba(209, 209, 209,0.03) 0%, rgba(209, 209, 209,0.03) 83%,transparent 83%, transparent 100%),radial-gradient(circle at 64% 88%, rgba(192, 192, 192,0.03) 0%, rgba(192, 192, 192,0.03) 2%,transparent 2%, transparent 100%),radial-gradient(circle at 73% 77%, rgba(205, 205, 205,0.03) 0%, rgba(205, 205, 205,0.03) 18%,transparent 18%, transparent 100%),radial-gradient(circle at 57% 51%, rgba(161, 161, 161,0.03) 0%, rgba(161, 161, 161,0.03) 64%,transparent 64%, transparent 100%),radial-gradient(circle at 40% 84%, rgba(115, 115, 115,0.03) 0%, rgba(115, 115, 115,0.03) 14%,transparent 14%, transparent 100%),linear-gradient(90deg, rgb(0,0,0),rgb(0,0,0));
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: rgb(80 85 92 / 34%); /* Transparent white background */
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #fff;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #fff;
        }
        input[type="text"],
        textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            background-color: rgba(255, 255, 255, 0.8); /* Transparent white background */
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .error-message {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add Note</h1>
        <form action="/notes/add" method="post">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title">
            <label for="content">Content:</label>
            <textarea id="content" name="content" rows="6"></textarea>
            <input type="submit" value="Submit">
        </form>
        <c:if test="${param.error == 'true'}">
            <p class="error-message">Please fill out all fields</p>
        </c:if>
    </div>
</body>
</html>


