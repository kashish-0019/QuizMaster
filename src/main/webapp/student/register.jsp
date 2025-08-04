<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Register | QuizzMaster</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: linear-gradient(135deg, #f093fb, #f5576c);
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
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top shadow">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold fs-4" href="#">🧠 QuizzMaster</a>
    <div class="ms-auto">
      <span class="text-white me-2">Already registered?</span>
      <a href="student/login.jsp" class="btn btn-light btn-sm">Login</a>
    </div>
  </div>
</nav>

<!-- Register Form -->
<div class="container d-flex justify-content-center align-items-center" style="flex: 1; margin-top: 100px;">
  <div class="col-md-6 col-lg-5">
    <div class="card p-4">
      <div class="text-center mb-3">
        <h3 class="fw-bold">Create Account</h3>
        <p class="text-muted">Join QuizzMaster to explore quizzes</p>
      </div>
      <form action="RegisterServlet" method="post">
        <div class="mb-3">
          <label class="form-label">Name</label>
          <input type="text" name="name" class="form-control" placeholder="Enter your name" required />
        </div>
        <div class="mb-3">
          <label class="form-label">Email</label>
          <input type="email" name="email" class="form-control" placeholder="Enter your email" required />
        </div>
        <div class="mb-3">
          <label class="form-label">Password</label>
          <input type="password" name="password" class="form-control" placeholder="Choose a password" required />
        </div>
        <button type="submit" class="btn btn-purple w-100">Register</button>
      </form>
    </div>
  </div>
</div>

</body>
</html>
