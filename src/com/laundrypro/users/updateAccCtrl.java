package com.laundrypro.users;


import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/updateAccCtrl")
public class updateAccCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		 //taking values from updateprofile.jsp
			
			String Name = request.getParameter("name");
			String NIC = request.getParameter("nic");
			String PhoneNo = request.getParameter("phoneNo");
			String Password = request.getParameter("password");
			String Uname = request.getParameter("username");
			
			boolean isTRUE;
			
			isTRUE=userDbUtil.updateuser(Name, NIC, PhoneNo, Password,Uname);
			
			if(isTRUE == true) {
				RequestDispatcher disSuccess = request.getRequestDispatcher("SucessAcc.jsp");
				disSuccess.forward(request, response);
			}
			else if(isTRUE == false) {
				RequestDispatcher disUnsuccess = request.getRequestDispatcher("UnsucessAcc.jsp");
				disUnsuccess.forward(request, response);
			}
			
		}

}
