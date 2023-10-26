package com.laundrypro.mix;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FinalBillServlet")
public class FinalBillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		String refNo = request.getParameter("refno");
		
		int count;
		
		count = LMSDBUtil.CheckRefNo(refNo);

		if(count == 1)
		{
			try {
				List<TrackOrder> orderDetails = LMSDBUtil.TrackOrder(refNo);
				request.setAttribute("orderDetails", orderDetails);
				
				List<OrderItem> orderItem = LMSDBUtil.OrderItem(refNo);
				request.setAttribute("orderItem", orderItem);
				
				List<Customer> cusDetails = LMSDBUtil.CustomerDetails(refNo);
				request.setAttribute("cusDetails", cusDetails);
			}
			
			catch (Exception e ) {
				e.printStackTrace();
			}
			
			RequestDispatcher dis = request.getRequestDispatcher("CloseBill.jsp");
			dis.forward(request, response);
		}

		else {
			request.setAttribute("errorMessage", "Invalid Reference Number!!!");
			
			RequestDispatcher dis = request.getRequestDispatcher("SearchBill.jsp");
			dis.forward(request, response);
		}

	}

}
