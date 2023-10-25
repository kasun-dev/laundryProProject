<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LaundryPro.lms.Signin</title>
<link rel="stylesheet" href="css/styles.css">


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script>
    //password and confirmpassword matching js	
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

					<table>
						<tr>
							<td>
								<h1>LAUNDRY PRO</h1> <br>
								<h3>Create Profile</h3>
							</td>
						</tr>
						<tr>
							<td>
								<form action="createAccCtrl" method="post">
									<label for="name">Name:</label>
									<input type="text" id="name" name="name" required>
									<br />
									<label for="nic">National Identity Card (NIC):</label>
									<input type="text" id="nic" name="nic" pattern="[0-9]{9}[v]|[0-9]{9}[V]|[0-9]{9}[Z]|[0-9]{9}[z]|[0-9]{12}"
										title="Please enter a valid NIC number eg:199912345678 or 991234567V" required>
									<div id="nic_error-message"></div>
									<br />
									<label for="address">Phone No.:</label>
									<input type="text" id="phoneNo" name="phoneNo" pattern="(\+94\d{9}|0\d{9,10})"
										title="Please enter a valid phone number. eg:0123456789 or +94123456789" required>
									<br />
									<label for="username">Username:</label>
									<input type="text" id="username" name="username" required>
									<br />
									<label for="password">Password:</label>
									<input type="password" id="password" name="password" required>
									<br />
									<label for="confirmPassword">Confirm Password:</label>
									<input type="password" id="confirmPassword" name="confirmPassword" required>
									<div id="error-message"></div>
									<br />
									<label for="jobRole">Job Role:</label>
									<select id="jobRole" name="jobRole" required>
										<option value="Worker">Worker</option>
										<option value="Cashier">Cashier</option>
										<option value="Manager">Manager</option>
									</select> <br />
									<input type="submit" value="Create Account">
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







