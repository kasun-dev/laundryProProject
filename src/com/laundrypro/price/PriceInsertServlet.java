package com.laundrypro.price;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Price_Insert
 */
@WebServlet("/Price_Insert")
public class PriceInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String service = request.getParameter("service");
		

		boolean doInsert = false;

		if (service.equals("dry_clean")) {
			
			String iname = request.getParameter("iname");
			double iprice = Double.parseDouble(request.getParameter("iprice1"));
			

			//call method to insert into db
			doInsert = PriceUtil.insertDryCleanPrice(iname, iprice);
			
		} else if (service.equals("bulk")) {
			
			double weight = Double.parseDouble(request.getParameter("weight"));
			double iprice = Double.parseDouble(request.getParameter("iprice2"));
			
			//call method to insert into db
			doInsert = PriceUtil.insertBulkPrice(weight, iprice);

		}

		if (doInsert == true) {
			response.sendRedirect(request.getContextPath()+"/retrievePrice");
			
		} else
		{
			response.sendRedirect(request.getContextPath() +"/retrievePrice");
		}

	}

}
