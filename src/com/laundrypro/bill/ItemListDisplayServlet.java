package com.laundrypro.bill;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ItemListDisplayServlet
 */
@WebServlet("/ItemListDisplayServlet")
public class ItemListDisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//displaying item list
		ArrayList<OrderItem> itemList = BillProgram.getItemList(); //get list of items
		
		//calculate bill final price and minimum payment
		double finalPrice = BillProgram.CalculateFinalAmount();
		double minPayment = BillProgram.CalculateMinPayment(finalPrice);
		
		request.setAttribute("itemList", itemList); //set itemList as attribute
		
		request.setAttribute("finalPrice", finalPrice);
		request.setAttribute("minPayment", minPayment);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("createNewBill.jsp"); 
		
		dispatcher.forward(request, response);
	}

}
