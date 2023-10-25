package com.laundrypro.mix;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateOrderServlet")
public class UpdateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String refNo = request.getParameter("refNo");
	    String finalAmount = request.getParameter("finalAmount");
	    String paidAmount = request.getParameter("paidAmount");
	    String billDate = request.getParameter("billDate");
	    String dueDate = request.getParameter("dueDate");
	    String orderState = request.getParameter("orderState");
	    
	    boolean isTrue;
		
		isTrue = LMSDBUtil.UpdateOrder(refNo, finalAmount, paidAmount, billDate, dueDate, orderState);
		
		if(isTrue == true) {
			
			List<Order> orderDetails = LMSDBUtil.orderDetails();
			request.setAttribute("orderDetails", orderDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("ManageOrder.jsp");
			dis.forward(request, response);
			
		}

		else {
			List<Order> orderDetails = LMSDBUtil.orderDetails();
			request.setAttribute("orderDetails", orderDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("ManageOrder.jsp");
			dis.forward(request, response);
		}
	}
}