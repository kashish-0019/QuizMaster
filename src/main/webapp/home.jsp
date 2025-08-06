<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Welcome | QuizMaster</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: linear-gradient(135deg, #a18cd1, #fbc2eb);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .card {
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
      background-color: #ffffff;
      max-width: 400px;
      width: 100%;
      text-align: center;
    }
    .card h2 {
      color: #6f42c1;
      margin-bottom: 25px;
      font-weight: bold;
    }
    .btn-custom {
      background-color: #6f42c1;
      color: #fff;
      border: none;
      margin: 10px 0;
      padding: 10px 20px;
      width: 100%;
      transition: all 0.3s ease;
    }
    .btn-custom:hover {
      background-color: #563d7c;
      transform: scale(1.05);
    }
  </style>
</head>
<body>

  <div class="card">
    <h2>Welcome to 🧠 QuizMaster</h2>
    <a href="<%= request.getContextPath() %>/student/register.jsp" class="btn btn-custom">Register as Student</a>
    <a href="<%= request.getContextPath() %>/student/login.jsp" class="btn btn-custom">Login as Student</a>
    <a href="<%= request.getContextPath() %>/admin/login.jsp" class="btn btn-custom">Login as Admin</a>
  </div>

</body>
</html>
