package com.laundrypro.mix;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//drag user inputs to the -
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
			
			List<User> userDetails = LMSDBUtil.validate(username, password);
			request.setAttribute("userDetails", userDetails);			
		}
		
		catch (Exception e ) {
			e.printStackTrace();
		}

		RequestDispatcher dis = request.getRequestDispatcher("Profile.jsp");
		dis.forward(request, response);
	}
}