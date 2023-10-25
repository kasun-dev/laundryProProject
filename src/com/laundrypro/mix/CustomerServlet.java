package com.laundrypro.mix;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Customer")
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String contactNo = request.getParameter("contact_number");
		String address = request.getParameter("address");
		
		boolean isTrue;
		
		isTrue = LMSDBUtil.cutomerDetails(name, contactNo, address);
		
		if(isTrue == true)
		{
			RequestDispatcher dis = request.getRequestDispatcher("sucess.jsp");
			dis.forward(request, response);			
		}
		else
		{
			request.setAttribute("errorMessage", "This customer already exsist!!!");
			
			List<Customer> customer = LMSDBUtil.ValidateCustomer(contactNo);
			request.setAttribute("customer", customer);
			
			
			RequestDispatcher dis2 = request.getRequestDispatcher("ExistingCustomer.jsp");
			dis2.forward(request, response);
		}
	}
}
