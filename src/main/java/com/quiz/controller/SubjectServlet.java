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

@WebServlet("/SubjectServlet")
public class SubjectServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DBHandler db = new DBHandler();
		List<Subject> subjectList = db.getAllSubjects();
		request.setAttribute("subjects", subjectList);
		request.getRequestDispatcher("student/subjectSelection.jsp").forward(request,response);

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			}

}
