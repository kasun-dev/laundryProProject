package com.laundrypro.price;

import java.io.IOException;
import java.util.List;

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

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// priceUtil Object to access methods
		IPriceUtil priceUtil = new PriceUtil();

		// get bulk prices;
		List<BulkPrice> array1 = priceUtil.getBulkPriceList();
		// get dry clean pricess
		List<DryCleanPrice> array2 = priceUtil.getDryCleanPriceList();

		request.setAttribute("bprices", array1);
		request.setAttribute("dcprices", array2);

		RequestDispatcher dispatcher = request
				.getRequestDispatcher("managePrices.jsp");

		dispatcher.forward(request, response);

	}
}
