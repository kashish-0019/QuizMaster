package com.quiz.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.quiz.db.DBHandler;
import com.quiz.model.Question;
import com.quiz.model.Subject;

@WebServlet("/QuizServlet")
public class QuizServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          int subjectId = Integer.parseInt(request.getParameter("subject_id"));
          
          DBHandler db = new DBHandler();
          Subject q = new Subject();
          List<Question> questions = db.getQuestionsBySubjectId(subjectId);
          Subject subject = db.getSubjectById(subjectId);
          
          if(questions.size() >= 10) {
          
          HttpSession session = request.getSession();
          session.setAttribute("questions", questions);
          session.setAttribute("subject_id", subjectId);
          session.setAttribute("subjectName",subject.getName());
          
          RequestDispatcher rd = request.getRequestDispatcher("student/quiz.jsp");
          rd.forward(request,response);
          }else {
        	  String message = "The Quiz is currently unavailable. Please try again later!";
        	  request.setAttribute("message", message);
        	  RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
              rd.forward(request,response);
          }
	}

}
