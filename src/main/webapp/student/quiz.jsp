<%@page import="com.quiz.model.Question"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    List<Question> questions = (List<Question>) session.getAttribute("questions");
    int subject_id = (int) session.getAttribute("subject_id");
    String subject_name = (String) session.getAttribute("subjectName");
    
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title><%= subject_name %> Quiz | QuizMaster</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: linear-gradient(135deg, #a18cd1, #fbc2eb);
      min-height: 100vh;
    }
    .navbar-custom {
      background-color: #6f42c1;
    }
    .card {
      border: none;
      border-radius: 20px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
      padding: 2rem;
      background-color: white;
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
    .timer {
      font-size: 1.5rem;
      color: red;
      font-weight: bold;
      margin-bottom: 15px;
      text-align: right;
    }
    .question {
      margin-bottom: 1.5rem;
    }
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top shadow">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold fs-4" href="#">🧠 QuizzMaster</a>
  </div>
</nav>



<!-- Quiz Form -->
<div class="container" style="margin-top: 100px;">
  <div class="row justify-content-center">
    <div class="col-lg-10">
      <div class="card">
        <h3 class="fw-bold text-center mb-4"><%= subject_name %> Quiz</h3>
        <div id="timer" class="timer">10:00</div>

        <form action="<%=request.getContextPath()%>/ResultServlet" method="post">
          <%
            int count = 0;
            for (Question q : questions) {
                count++;
          %>
            <div class="question">
              <p class="fw-semibold">Q<%= count %>: <%= q.getQuestionText() %></p>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="<%= q.getId() %>" value="A" id="q<%= q.getId() %>a">
                <label class="form-check-label" for="q<%= q.getId() %>a"><%= q.getOptionA() %></label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="<%= q.getId() %>" value="B" id="q<%= q.getId() %>b">
                <label class="form-check-label" for="q<%= q.getId() %>b"><%= q.getOptionB() %></label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="<%= q.getId() %>" value="C" id="q<%= q.getId() %>c">
                <label class="form-check-label" for="q<%= q.getId() %>c"><%= q.getOptionC() %></label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="<%= q.getId() %>" value="D" id="q<%= q.getId() %>d">
                <label class="form-check-label" for="q<%= q.getId() %>d"><%= q.getOptionD() %></label>
              </div>
            </div>
          <% } %>

          <div class="text-center">
            <button type="submit" class="btn btn-purple px-5">Submit</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Timer Script -->
<script>
  let totalTime = 10 * 60;
  const timerDisplay = document.getElementById("timer");

  const timer = setInterval(() => {
    const mins = Math.floor(totalTime / 60);
    const sec = totalTime % 60;

    const formattedTime =
      (mins < 10 ? '0' + mins : mins) + ':' + (sec < 10 ? '0' + sec : sec);

    timerDisplay.textContent = formattedTime;

    if (totalTime === 0) {
      clearInterval(timer);
      timerDisplay.textContent = "Time is Up!";
      document.querySelector("form").submit();
    }

    totalTime--;
  }, 1000);
</script>

</body>
</html>
