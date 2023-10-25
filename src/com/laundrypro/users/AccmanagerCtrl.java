package com.laundrypro.users;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AccmanagerCtrl")
public class AccmanagerCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<user> alluserDetails = userDbUtil.selectAllUsers();
		request.setAttribute("alluserDetails", alluserDetails);
		
		RequestDispatcher dis = request.getRequestDispatcher("AccManagepg.jsp");
		dis.forward(request, response);
	}

}
