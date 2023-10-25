package com.laundrypro.users;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Controller used to manager createacc.jsp and DbUtil for the purpose of Employee account creation

@WebServlet("/createAccCtrl")
public class createAccCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		 //taking values from createacc.jsp
			String Name = request.getParameter("name");
			String NIC = request.getParameter("nic");
			String phoneNo = request.getParameter("phoneNo");
			String UserName = request.getParameter("username");
			String Password = request.getParameter("password");
			String Type = request.getParameter("jobRole");
			
			boolean isTRUE;
			
			isTRUE=userDbUtil.insertuser(Name, NIC, phoneNo, UserName, Password, Type);
			
			if(isTRUE == true) {
				//when creation success redirect to SucessAcc.jsp and next to manager dashboard (manager.jsp)
				RequestDispatcher disSuccess = request.getRequestDispatcher("SucessAcc.jsp");
				disSuccess.forward(request, response);
			}
			else if(isTRUE == false) {
				//when creation success redirect to UnsucessAcc.jsp and next to manager dashboard (manager.jsp)
				RequestDispatcher disUnsuccess = request.getRequestDispatcher("UnsucessAcc.jsp");
				disUnsuccess.forward(request, response);
			}
			
		}

}
