package com.laundrypro.users;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteAccCtrl")
public class deleteAccCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String UserName = request.getParameter("uname");
		
		boolean isTRUE;
		
		isTRUE=userDbUtil.deleteUAcc(UserName);
		
		if(isTRUE == true) {
			//when delete is success-redirect to AccManage page
			RequestDispatcher disSuccess = request.getRequestDispatcher("SucessAcc.jsp");
			disSuccess.forward(request, response);
		}
		else if(isTRUE == false) {
			//when delete is unsuccess-redirect to AccManage page
			RequestDispatcher disUnsuccess = request.getRequestDispatcher("UnsucessAcc.jsp");
			disUnsuccess.forward(request, response);
		}
	}

}
