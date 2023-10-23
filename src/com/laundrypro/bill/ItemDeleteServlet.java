package com.laundrypro.bill;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ItemDeleteServlet
 */
@WebServlet("/ItemDeleteServlet")
public class ItemDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ItemDeleteServlet() {
		super();

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String desc = request.getParameter("desc");
		String type = request.getParameter("type");
		int qty = Integer.parseInt(request.getParameter("qty"));
		double unitPrice = Double.parseDouble(request.getParameter("subTotal"));
		double subTotal = Double.parseDouble(request.getParameter("subTotal"));

		BillProgram.DeleteItemFromList(desc, type, qty, unitPrice, subTotal);

		response.sendRedirect(request.getContextPath() + "/ItemListDisplayServlet");

	}

}
