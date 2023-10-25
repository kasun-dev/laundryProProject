<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

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
				<div>
					<form action="deleteAccCtrl" method="post">
						<label for="name">Name:</label>
						<input type="text" id="name" name="name" value="<%=name%>" readonly>
						<label for="username">Username:</label>
						<input type="text" id="username" name="uname" value="<%=uname%>" readonly>

						<input type="submit" value="Delete">
					</form>
				</div>
			</div>
		</main>
	</div>
</body>
</html>