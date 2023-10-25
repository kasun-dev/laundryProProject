package com.laundrypro.mix;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TrackOrderServlet")
public class TrackOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String refNo = request.getParameter("refno");
		
		try {
			
			List<TrackOrder> trackOrder = LMSDBUtil.TrackOrder(refNo);
			request.setAttribute("trackOrder", trackOrder);			
		}
		
		catch (Exception e ) {
			e.printStackTrace();
		}

		RequestDispatcher dis = request.getRequestDispatcher("OrderDetails.jsp");
		dis.forward(request, response);
	}

}
