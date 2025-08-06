<%@page import="com.quiz.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    int totalQuestions = (int) session.getAttribute("totalQuestions");
    int attempted = (int) session.getAttribute("attempted");
    int correct = (int) session.getAttribute("correct");
    int incorrect = (int) session.getAttribute("incorrect");
    int score = (int) session.getAttribute("score");
   
    User user = (User) session.getAttribute("currentuser");


    int percentage = (int)(((double)score / totalQuestions) * 100);
    String message = percentage >= 80 ? "🎉 Excellent Work!" : percentage >= 50 ? "👍 Good Job!" : "🙁 Keep Practicing!";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz Result | QuizMaster</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #a18cd1, #fbc2eb);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .navbar-custom {
            background-color: #6f42c1;
        }
        .card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
        }
        .btn-purple {
            background-color: #6f42c1;
            color: white;
            transition: all 0.3s ease;
        }
        .btn-purple:hover {
            background-color: #563d7c;
            transform: scale(1.05);
        }
        .result-label {
            font-weight: 500;
            color: #6f42c1;
        }
        .score-display {
            font-size: 3.5rem;
            font-weight: 700;
            background: linear-gradient(to right, #00c6ff, #0072ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-top: 10px;
            text-shadow: 0px 0px 10px rgba(0,0,0,0.2);
        }
        .result-message {
            font-size: 1.2rem;
            font-weight: 500;
            color: #333;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top shadow">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold fs-4" href="#">🧠 QuizMaster</a>
    <div class="ms-auto">
      <a href="dashboard.jsp" class="btn btn-light btn-sm">Dashboard</a>
    </div>
  </div>
</nav>

<!-- Result Card -->
<div class="container d-flex justify-content-center align-items-center" style="flex: 1; margin-top: 100px;">
  <div class="col-md-6 col-lg-5">
    <div class="card p-4 text-center">
      <h3 class="fw-bold mb-2">🎯 Quiz Result</h3>
      <p class="result-message"><%= message %></p>

      <div class="score-display"><%= score %> / <%= totalQuestions %></div>

      <hr class="my-4">

      <p class="result-label">Attempted: <span class="text-dark"><%= attempted %></span></p>
      <p class="result-label">Correct: <span class="text-success fw-bold"><%= correct %></span></p>
      <p class="result-label">Incorrect: <span class="text-danger fw-bold"><%= incorrect %></span></p>

      <div class="mt-4 d-flex justify-content-center gap-3 flex-wrap">
        <a href="quiz.jsp" class="btn btn-purple">🔁 Retake Quiz</a>
        <a href="dashboard.jsp" class="btn btn-outline-secondary">🏠 Go to Dashboard</a>
      </div>
    </div>
  </div>
</div>

</body>
</html>
