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

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String contactNo = request.getParameter("contact_number");
		String address = request.getParameter("address");
		String refno = request.getParameter("refno");

		boolean isTrue = false;

		isTrue = LMSDBUtil.insertCutomerDetails(refno, name, contactNo,
				address);
		
		request.setAttribute("refno", refno);

		if (isTrue == true) {

			List<TrackOrder> orderDetails = LMSDBUtil.TrackOrder(refno);
			request.setAttribute("orderDetails", orderDetails);
			
			List<OrderItem> orderItem = LMSDBUtil.OrderItem(refno);
			request.setAttribute("orderItem", orderItem);
			
			List<Customer> cusDetails = LMSDBUtil.CustomerDetails(refno);
			request.setAttribute("cusDetails", cusDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("createNewBill.fullbill.jsp");
			dis.forward(request, response);

			//response.sendRedirect(request.getContextPath() + "/DisplayNewFullBillServlet");

		} else {
			request.setAttribute("errorMessage",
					"This customer already exsist!!!");

			List<Customer> customer = LMSDBUtil.ValidateCustomer(contactNo);
			request.setAttribute("customer", customer);

			RequestDispatcher dis = request
					.getRequestDispatcher("ExistingCustomer.jsp");
			dis.forward(request, response);
		}
	}
}
