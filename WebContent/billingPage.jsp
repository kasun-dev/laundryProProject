<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Billing</title>
<link rel="stylesheet" href="css/styles.css">
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="aside.jsp" />
		<!--main content-->
		<main class="main">
			<div id="main-content">
				<div class=b1>
					<a href="ItemListDisplayServlet">
						<button>Create New Bill</button>
					</a>
				</div>
			</div>
			<div class=b1>
				<a href="SearchBill.jsp">
					<button>Close Existing Bill</button>
				</a>
			</div>

		</main>
	</div>
</body>
</html>