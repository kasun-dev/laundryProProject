package com.laundrypro.bill;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String dueDate = request.getParameter("dueDate");
		String currentDate= request.getParameter("currentDate");
		double paidAmount = Double.parseDouble(request.getParameter("paidAmount"));
		double finalAmount = Double.parseDouble(request.getParameter("finalAmount"));
		String state = request.getParameter("state");
		
		
		
		//generate and get UUID for new bill
		String UUID = BillProgram.GenerateUUID();
		
		//save UUID in DB to generate Reference Number
		boolean doInsert = false;
		
		try {
			doInsert = BillDbUtil.insertUUID(UUID);
			
			if(doInsert == true)
			{
				/*get referenceNo from Database
				 * (reference number generated from DB using trigger)
				 */
				
				String refNo = BillDbUtil.getRefNoFromDB(UUID);
				
				if(refNo.length() > 1)
				{
					
					ArrayList<OrderItem> itemList = BillProgram.getItemList(); //get Item List
					//insert bill items into database
				}
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		
		
	}

}
