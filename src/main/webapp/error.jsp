<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error | QuizMaster</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #fbc2eb, #a6c1ee);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .error-container {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .btn-purple {
            background-color: #6f42c1;
            color: white;
        }
        .btn-purple:hover {
            background-color: #563d7c;
        }
    </style>
</head>
<body>

<div class="error-container">
    <h2 class="text-danger mb-4">⚠️ Oops! Something went wrong.</h2>
    <p class="text-muted fs-5">
        <%= request.getAttribute("message") != null ? request.getAttribute("message") : "An unexpected error occurred." %>
    </p>
    <a href="student/dashboard.jsp" class="btn btn-purple mt-4">Go Back</a>
</div>

</body>
</html>
