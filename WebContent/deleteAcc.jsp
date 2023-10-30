<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>delete user account</title>

<link rel="stylesheet" href="css/styles.css">
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="aside.jsp" />
		<!--main content-->
		<main class="main">
			<div id="main-content">

				<%
				String name = request.getParameter("name");
				String uname = request.getParameter("uname");
				%>
					<table style="width:20%">
						<form action="deleteAccCtrl" method="post">
						<tr>
							<td>
								<label for="name">Name:</label>
							</td>
							<td>
								<input type="text" id="name" name="name" value="<%=name%>" readonly>
							</td>
						</tr>
						<tr>
							<td>
								<label for="username">Username:</label>
							</td>
							<td>
								<input type="text" id="username" name="uname" value="<%=uname%>" readonly>
							</td>
						</tr>
					
						<tr>
							<td colspan ="2">
								<input type="submit" value="Delete">
							</td>
						</tr>
						</form>
					</table>	
				
			</div>
		</main>
	</div>
</body>
</html>