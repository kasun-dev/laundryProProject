package com.laundrypro.users;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import login.lms.userDbUtil.userDButil;


@WebServlet("/loginctrl")
public class logincontrol extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//to show js error when login credentials wrong
		
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			
			String uName = request.getParameter("username");
			String Password = request.getParameter("password");
			boolean isVALID;
			String Type;
			
			isVALID = userDbUtil.validate(uName, Password);
			Type = userDbUtil.UserAcctype(uName);
			
			if (isVALID==true) {
			//when the user is valid
				List<user> userDetails = userDbUtil.getuser(uName);
				request.setAttribute("userDetails", userDetails);							
				//when the user is manager redirect to manager page
				if (Type.equals("Manager")) {
					RequestDispatcher dis = request.getRequestDispatcher("dashboard.jsp");
					dis.forward(request, response);
				}
				//when the user is cashier redirect to cashier page
				else if(Type.equals("Cashier")) {
					RequestDispatcher dis = request.getRequestDispatcher("billingPage.jsp");
					dis.forward(request, response);
				}
				//when the user is worker redirect to worker page
				else if(Type.equals("Worker")) {
		            response.sendRedirect(request.getContextPath()+"/ManageOrderServlet");
				}
			}
			else if(isVALID==false) {
				//when the user is invalid 
				out.println("<script type='text/javascript'>");
				out.println("alert('Username or password incorrect');");
				out.println("location='loginpg.jsp'");
				out.println("</script>");
			} 
			
			
		}

}
  