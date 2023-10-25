package com.laundrypro.bill;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/BillCheckoutServlet")
public class BillCheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String dueDate = request.getParameter("dueDate");
		String currentDate= request.getParameter("currentDate");
		double paidAmount = Double.parseDouble(request.getParameter("paidAmount"));
		double finalAmount = Double.parseDouble(request.getParameter("finalAmount"));
		String state = request.getParameter("state");
		
		
		
		//generate and get UUID for new bill
		String UUID = BillProgram.GenerateUUID();
		
		//save UUID in DB to generate Reference Number
		boolean dotask = false;
		
		try {
			dotask = BillDbUtil.insertUUID(UUID);
			
			if(dotask == true)
			{
				/*get referenceNo from Database
				 * (reference number generated from DB using trigger)
				 */
				
				String refNo = BillDbUtil.getRefNoFromDB(UUID);
					
				ArrayList<OrderItem> itemList = BillProgram.getItemList(); //get Item List
				
				//insert bill into database
				dotask = BillDbUtil.insertBillData(refNo, finalAmount, paidAmount, currentDate, dueDate, state);
				
				
				if(dotask == true)
				{
					//insert bill items into database
					dotask = BillDbUtil.insertBillItem(refNo, itemList);
					
					
					if(dotask == true)
					{
						HttpSession session = request.getSession();
						session.setAttribute("refno", refNo);
					}
				}
				
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		
		
	}

}
