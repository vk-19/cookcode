package com.vineet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao dao = new UserDao();
		String roll = request.getParameter("roll");
		String pass = request.getParameter("pass");
		
		String user;
		try {
			user = dao.getUserName(roll, pass);

			if (user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("uname", user);
				session.setAttribute("roll", roll);
				response.sendRedirect("home.jsp");
			}
			else {
				HttpSession session = request.getSession();
				session.setAttribute("usernotfound","true" );
				response.sendRedirect("login.jsp");
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
