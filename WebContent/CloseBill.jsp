<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Close Order</title>
    <link rel="stylesheet" href="css/styles.css">
    <script>
    <!--validate the form-->
        function showSubmitAlert() {
            var paidAmountInput = document.getElementById("paidAmount");
            var amount = paidAmountInput.value;

            var finalAmountInput = document.getElementById("finalAmount");
            var famount = finalAmountInput.value;

            var state = document.getElementById("state");
            var fstate = state.value;

            if (!/^\d+(\.\d+)?$/.test(amount)) { // if user enters a character value other than ".", the form won't submit
                alert("Error: Only digits or decimal numbers are allowed.");
                paidAmountInput.focus();
                return false; // Validation fails, form won't submit
            }

            if (parseFloat(amount) != parseFloat(famount)) { // if paidAmount is not equal to finalAmount, the form won't submit
                alert("Error: You should pay all the due amount.");
                paidAmountInput.focus();
                return false; // Validation fails, form won't submit
            }

            if (fstate != "Complete") { // if the state is not set to complete, the form won't submit
                alert("Error: You should complete the order.");
                state.focus();
                return false; // Validation fails, form won't submit
            }

            return true; // Validation passes, allow form submission
        }
    </script>
</head>
<body>
    <div class="container">
        <jsp:include page="header.jsp" />
        <jsp:include page="aside.jsp" />
        <!--main content-->
        <main class="main">
            <div class="main-container-full-bill">
                <form action="billclose" method="post" onsubmit="return showSubmitAlert()">
                    <div class="card-container">
                    	<!--retrieve customer details-->
                        <c:forEach var="cus" items="${cusDetails}">
                            <div class="cardraw-1">
                                <div class="card">
                                    <div class="card-inner">
                                        <p class="card-name">Customer Name :</p>
                                    </div>
                                    <div class="output-container">
                                        <p class="card-details">
                                            <span class="font-weight-bold">${cus.name}</span>
                                        </p>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-inner">
                                        <p class="card-name">Contact No :</p>
                                    </div>
                                    <div class="output-container">
                                        <p class="card-details">
                                            <span class="font-weight-bold">${cus.contactNo}</span>
                                        </p>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-inner">
                                        <p class="card-name">Address :</p>
                                    </div>
                                    <div class="output-container">
                                        <p class="card-details">
                                            <span class="font-weight-bold">${cus.address}</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

						<!--retrieve order details-->
                        <c:forEach var="order" items="${orderDetails}">
                            <div class="cardraw-2">
                                <div class="card">
                                    <div class="card-inner">
                                        <p class="card-name">Reference No :</p>
                                    </div>
                                    <div class="output-container">
                                        <p class="card-details">
                                            <span class="font-weight-bold"><input type="text" name="refNo" value="${order.refNo}" readonly></span>
                                        </p>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-inner">
                                        <p class="card-name">Final Amount :</p>
                                    </div>
                                    <div class="output-container">
                                        <p class="card-details">
                                            <span class="font-weight-bold"><input type="text" id="finalAmount" name="finalAmount" value="${order.finalAmount}" readonly></span>
                                        </p>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-inner">
                                        <p class="card-name">Paid Amount :</p>
                                    </div>
                                    <div class="output-container">
                                        <p class="card-details">
                                            <span class="font-weight-bold"><input type="text" id="paidAmount" name="paidAmount" value="${order.paidAmount}"></span>
                                        </p>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-inner">
                                        <p class="card-name">Bill Date :</p>
                                    </div>
                                    <div class="output-container">
                                        <p class="card-details">
                                            <span class="font-weight-bold"><input type="text" name="billDate" value="${order.billDate}" readonly></span>
                                        </p>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-inner">
                                        <p class="card-name">Due Date :</p>
                                    </div>
                                    <div class="output-container">
                                        <p class="card-details">
                                            <span class="font-weight-bold"><input type="text" name="dueDate" value="${order.dueDate}" readonly></span>
                                        </p>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-inner">
                                        <p class="card-name">State :</p>
                                    </div>
                                    <div class="output-container">
                                        <p class="card-details">
                                            <span class="font-weight-bold">
                                                <select name="orderState" id="state">
                                                    <option selected>${order.state}</option>
                                                    <option value="Complete">Complete</option>
                                                </select>
                                            </span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

					<!--display the bill-->
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>Description</th>
                                    <th>Service Type</th>
                                    <th>Qty</th>
                                    <th>Unit Price</th>
                                    <th>Sub Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="items" items="${orderItem}">
                                    <tr>
                                        <td>${items.description}</td>
                                        <td>${items.serviceType}</td>
                                        <td>${items.quantity}</td>
                                        <td>${items.unitPrice}</td>
                                        <td>${items.subTotal}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div class="close-button">
                        <button class="button-element" type="submit">Close Bill</button>
                    </div>
                </form>
            </div>
        </main>
    </div>
</body>
</html>
