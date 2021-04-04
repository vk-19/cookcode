package com.vineet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao dao = new UserDao();
		
		String roll = request.getParameter("roll");
		String name = request.getParameter("name");
		String pass = request.getParameter("pass1");
		

		
		try {
			if (dao.isRollExist(roll)) {
				HttpSession session = request.getSession();
				session.setAttribute("rollexist", "true");
			    response.sendRedirect("register.jsp");
			}
			
			else {
				PrintWriter out = response.getWriter();
				out.println(name);
				dao.register(roll, name, pass);
				dao.addUserResult(roll);
				HttpSession session = request.getSession();
				session.setAttribute("registered", "true");
				response.sendRedirect("register.jsp");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
