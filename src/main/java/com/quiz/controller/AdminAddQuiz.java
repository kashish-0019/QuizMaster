package com.quiz.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.quiz.db.DBHandler;
import com.quiz.model.Subject;

@WebServlet("/AdminAddQuiz")
public class AdminAddQuiz extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Subject> subjectList = DBHandler.getAllSubjects();
		request.setAttribute("subjectList", subjectList);
        request.getRequestDispatcher("/admin/addQuiz.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int subjectId = Integer.parseInt(request.getParameter("subjectId"));
        String question = request.getParameter("question");
        String optionA = request.getParameter("optionA");
        String optionB = request.getParameter("optionB");
        String optionC = request.getParameter("optionC");
        String optionD = request.getParameter("optionD");
        String correctOption = request.getParameter("correctOption");

        boolean success = DBHandler.addQuestions(subjectId, question, optionA, optionB, optionC, optionD, correctOption);
        String message="";
        if(success){
        	message += "Your question has been added successfully!";
        	request.setAttribute("message",message);
            request.getRequestDispatcher("admin/dashboard.jsp").forward(request, response);
        } else {
        	message += "Your question could not be added. Please try again!";
        	request.setAttribute("message",message);
        	request.getRequestDispatcher("admin/dashboard.jsp").forward(request, response);
        }
	}

}
