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
 * Servlet implementation class AddItemServlet
 */
@WebServlet("/AddItemServlet")
public class AddItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String desc = request.getParameter("desc");
		String serviceType = request.getParameter("type");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		double unitPrice = Double.parseDouble(request.getParameter("unitPrice"));
		
		//add items to item list
		BillProgram.addItemToList(desc,serviceType,unitPrice,quantity);
	
		
		response.sendRedirect(request.getContextPath()+"/ItemListDisplayServlet");
		
		
		
		
	}

}
