package com.laundrypro.bill;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BillDiscardServlet
 */
@WebServlet("/BillDiscardServlet")
public class BillDiscardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// clear the array
		boolean clearArray = BillProgram.emptyArray();
		HttpSession session = request.getSession();

		// remove refno from session
		session.removeAttribute("refno");

		if (clearArray == true) {
			response.sendRedirect("billingPage.jsp");
		} else {
			String error = "Something went horibbly wrong, please contact a system admin";
			request.setAttribute("error", error);
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("billingPage.jsp");
			dispatcher.forward(request, response);

		}

	}

}
