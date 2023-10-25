package com.laundrypro.mix;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ManageOrderServlet")
public class ManageOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
	 List<Order> orderDetails = LMSDBUtil.orderDetails();
	 request.setAttribute("orderDetails", orderDetails);
	 
	 RequestDispatcher dis = request.getRequestDispatcher("ManageOrder.jsp");
	 dis.forward(request, response);
	 }
}