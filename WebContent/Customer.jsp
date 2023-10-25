<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Customer</title>
<link rel="stylesheet" href="css/CustomerDetails.css">
<link rel="stylesheet" href="css/styles.css">
<script>
    function validatePhoneNumber() {
        var phoneNumberInput = document.getElementById("contact_number");
        var phoneNumber = phoneNumberInput.value;

        if (/[^0-9]/.test(phoneNumber)) {
            alert("Error : Only digits are allowed in the phone number.");
            phoneNumberInput.focus();
            return false;
        }

        if (phoneNumber.length !== 10) {
            if (phoneNumber.length > 10) {
                alert("Error : Phone number cannot exceed 10 digits.");
            } else if (phoneNumber.length < 10) {
                alert("Error : Phone number must have exactly 10 digits.");
            }
            phoneNumberInput.focus();
            return false;
        }
        return true;
    }
</script>
</head>
<body>

	<div class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="aside.jsp" />
		<!--main content-->
		<main class="main-container">
			<div class="form-container">
				<form action="addcustomer" method="post" onsubmit="return validatePhoneNumber();">
					<table>
						<tr>
							<td>
								<div class="td-container">
									<h1>Full Name :</h1>
								</div>
								<div class="td-container">
									<input type="text" name="name" required>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="td-container">
									<h1>Contact Number :</h1>
								</div>
								<div class="td-container">
									<input type="text" name="contact_number" id="contact_number" required>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="td-container">
									<h1>Address :</h1>
								</div>
								<div class="td-container">
									<input type="text" name="address" required>
								</div>
							</td>
						</tr>
					</table>
					<div class="add-button">
						<button class="button-element">Add Customer</button>
					</div>
				</form>
			</div>
		</main>
	</div>
</body>
</html>