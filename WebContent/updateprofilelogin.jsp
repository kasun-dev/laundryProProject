<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>lms.createAcc</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/styles.css">
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var password = document.getElementById('password');
        var confirmPassword = document.getElementById('confirmPassword');
        var errorDiv = document.getElementById('error-message');

        function validatePassword() {
            if (password.value !== confirmPassword.value) {
                errorDiv.textContent = 'Passwords do not match';
            } else {
                errorDiv.textContent = '';
            }
        }

        confirmPassword.addEventListener('input', validatePassword);
    });
</script>
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="aside.jsp" />
		<!--main content-->
		<main class="main">
			<div id="main-content">
				<div class="createacc">
					<%
					String name = request.getParameter("name");
					String nic = request.getParameter("nic");
					String uname = request.getParameter("uname");
					String pwd = request.getParameter("pwd");
					String phoneNo = request.getParameter("phoneNo");
					%>
					<table>
						<tr>
							<td>
								<h1>LAUNDRY PRO</h1> <br>
								<h3>Update Profile</h3>
							</td>
						</tr>
						<tr>
							<td>
								<form action="updateAccCtrl" method="post">
									<label for="name">Name:</label>
									<input type="text" id="name" name="name" value="<%=name%>" required>

									<label for="nic">National Identity Card (NIC):</label>
									<input type="text" id="nic" name="nic" value="<%=nic%>"
										pattern="[0-9]{9}[v]|[0-9]{9}[V]|[0-9]{9}[Z]|[0-9]{9}[z]|[0-9]{12}"
										title="Please enter a valid NIC number eg:199912345678 or 991234567V" required>

									<label for="address">phone No.:</label>
									<input type="text" id="phoneNo" name="phoneNo" value="<%=phoneNo%>" pattern="(\+94\d{9}|0\d{9,10})"
										title="Please enter a valid phone number. eg:0123456789 or +94123456789" required>

									<label for="username">Username:</label>
									<input type="text" id="username" name="username" value="<%=uname%>" readonly>

									<label for="password">Password:</label>
									<input type="password" id="password" name="password" value="<%=pwd%>" required>

									<label for="confirmPassword">Confirm Password:</label>
									<input type="password" id="confirmPassword" name="confirmPassword" required>
									<div id="error-message"></div>

									<input type="submit" value="Update Account">
								</form>
							</td>
						</tr>
					</table>

				</div>
			</div>
		</main>
	</div>
</body>
</html>







