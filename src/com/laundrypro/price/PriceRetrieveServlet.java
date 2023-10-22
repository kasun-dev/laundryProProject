package com.laundrypro.price;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PriceRetrieveServlet
 */
@WebServlet("/PriceRetrieveServlet")
public class PriceRetrieveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PriceRetrieveServlet() {
		super();
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		//response.getWriter().append("Served at:")
				//.append(request.getContextPath());

		
		ArrayList<BulkPrice> array1 = PriceUtil.getBulkPriceList(); //get bulk prices
		ArrayList<DryCleanPrice> array2 = PriceUtil.getDryCleanPriceList(); //get dry clean prices

		request.setAttribute("bprices", array1);
		request.setAttribute("dcprices", array2);

		RequestDispatcher dispatcher = request.getRequestDispatcher("managePrices.jsp");
		
		dispatcher.forward(request, response);
		
		
	}


}
