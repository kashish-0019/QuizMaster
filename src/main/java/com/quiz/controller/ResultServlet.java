package com.quiz.controller;

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
import com.quiz.model.User;

@WebServlet("/ResultServlet")
public class ResultServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    List<Question> questions = (List<Question>) session.getAttribute("questions");
	    int subjectid = (int)session.getAttribute("subject_id");
	    User user = (User) session.getAttribute("currentuser");
	    DBHandler db = new DBHandler();
	    
	    
	    int totalQuestions = questions.size();
	    int attempted = 0;
	    int correct = 0;
        int incorrect = 0;
	    for (Question q : questions) {
	        String selectedAnswer = request.getParameter(String.valueOf(q.getId()));
	        System.out.println("QID: " + q.getId());
	        System.out.println("Correct Answer: " + q.getCorrectAnswer());
	        System.out.println("Selected Answer: " + selectedAnswer);

	        if (selectedAnswer != null) {
	            attempted++;
	            
	            String correctAnswerStr = String.valueOf(q.getCorrectAnswer()).trim();

	            if (selectedAnswer.trim().equalsIgnoreCase(correctAnswerStr)) {
	                correct++;
	            } else {
	                incorrect++;
	            }
	        }

	    }

	    int score = correct;

	    session.setAttribute("totalQuestions", totalQuestions);
	    session.setAttribute("attempted", attempted);
	    session.setAttribute("correct", correct);
	    session.setAttribute("incorrect", incorrect);
	    session.setAttribute("score", score);
        db.saveQuizResult(user.getId(),subjectid,score);
	    response.sendRedirect("student/result.jsp");
	}
}
