package com.laundrypro.mix;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class insertExtCustToBill
 */
@WebServlet("/InsertExtCustToBill")
public class InsertExtCustToBill extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String refno = request.getParameter("refno");
		String contactno = request.getParameter("contactno");
		String action = request.getParameter("action");
		
		boolean doInsert = false;
	
		if(action.equals("continue"))
		{
			try {
				doInsert = LMSDBUtil.linkExtCusToBill(refno, contactno);
				
				if(doInsert == true) {
					
					List<TrackOrder> orderDetails = LMSDBUtil.TrackOrder(refno);
					request.setAttribute("orderDetails", orderDetails);
					
					List<OrderItem> orderItem = LMSDBUtil.OrderItem(refno);
					request.setAttribute("orderItem", orderItem);
					
					List<Customer> cusDetails = LMSDBUtil.CustomerDetails(refno);
					request.setAttribute("cusDetails", cusDetails);
					
					RequestDispatcher dis = request.getRequestDispatcher("createNewBill.fullbill.jsp");
					dis.forward(request, response);
											
					
				}
				else
				{
					String error = "Something went horribly wrong, contact a system admin !";
					request.setAttribute("error", error);
					RequestDispatcher dis = request.getRequestDispatcher("billingPage.jsp");
					dis.forward(request, response);
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else if (action.equals("back"))
		{
			
			request.setAttribute("refno", refno);
			RequestDispatcher dis = request.getRequestDispatcher("createNewBill.cusDetails.jsp");
			dis.forward(request, response);
		}
				
		
	}
}
