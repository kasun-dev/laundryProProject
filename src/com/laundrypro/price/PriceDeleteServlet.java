package com.laundrypro.price;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PriceDeleteServlet
 */
@WebServlet("/PriceDeleteServlet")
public class PriceDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PriceDeleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		boolean doDelete = false;
		String type = request.getParameter("type");

		//check type of price to delete
		if (type.equals("bulk")) {
			int id = Integer.parseInt(request.getParameter("bid"));
			
			
			doDelete = PriceUtil.DeleteBulkPrice(id); //method call

		} else if (type.equals("dry_clean")) {
			int id = Integer.parseInt(request.getParameter("dcid"));
			
			doDelete = PriceUtil.DeleteDryCleanPrice(id); //method call
		}

		// redirection
		if (doDelete == true) {

			response.sendRedirect(request.getContextPath() + "/retrievePrice");

		} else {

			response.sendRedirect(request.getContextPath() + "/retrievePrice");

		}
	}

}
