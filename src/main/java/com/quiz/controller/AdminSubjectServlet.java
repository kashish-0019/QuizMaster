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


@WebServlet("/AdminSubjectServlet")
public class AdminSubjectServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Subject> subjects = DBHandler.getAllSubjects();
		request.setAttribute("subjectList", subjects);
		request.getRequestDispatcher("admin/manageSubject.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(("add").equals(action)) {
			String subjectName =  request.getParameter("subjectName");
			DBHandler.addSubject(subjectName);
		}
		if(("delete").equals(action)) {
			int id = Integer.parseInt(request.getParameter("id"));
			DBHandler.deleteSubject(id);
			
		}
		response.sendRedirect(request.getContextPath() + "/AdminSubjectServlet");
	}

}
