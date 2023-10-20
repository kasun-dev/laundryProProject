package com.lms;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteOrderServlet")
public class DeleteOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String refNo = request.getParameter("refNo");
		boolean isTrue;
		
		isTrue = LMSDBUtil.DeleteOrder(refNo);
		
		if (isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("Button.jsp");
			dis.forward(request, response);
		}
		else {
			
			List<Order> orderDetails = LMSDBUtil.orderDetails();
			request.setAttribute("orderDetails", orderDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("Button.jsp");
			dis.forward(request, response);
		}
	}

}
