<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Manage Order</title>
	<link rel="stylesheet" href="css/ManageOrder.css">
</head>
<body>

	<table>
    <tr>
        <th>Order ID</th>
        <th>Final Amount</th>
        <th>Paid Amount</th>
        <th>Bill Date</th>
        <th>Due Date</th>
        <th>Order State</th>
        <th>Option</th>
    </tr>
    <c:forEach var="order" items="${orderDetails}">
    
    <c:set var="refno" value="${order.refNo}"/>
	<c:set var="finalamount" value="${order.finalAmount}"/>
	<c:set var="paidamount" value="${order.paidAmount}"/>
	<c:set var="billdate" value="${order.billDate}"/>
	<c:set var="duedate" value="${order.dueDate}"/>
	<c:set var="state" value="${order.state}"/>
    
        <tr>
            <td>${order.refNo}</td>
            <td>${order.finalAmount}</td>
            <td>${order.paidAmount}</td>
            <td>${order.billDate}</td>
            <td>${order.dueDate}</td>
            <td>${order.state}</td>
            
            
         <c:url value="UpdateOrder.jsp" var="updateorder">
			<c:param name="refNo" value="${refno}" />
			<c:param name="finalAmount" value="${finalamount}" />
			<c:param name="paidAmount" value="${paidamount}" />
			<c:param name="billDate" value="${billdate}" />
			<c:param name="dueDate" value="${duedate}" />
			<c:param name="orderState" value="${state}" />
		</c:url>
		
		<c:url value="DeleteOrder.jsp" var="deleteorder">
			<c:param name="refNo" value="${refno}" />
			<c:param name="finalAmount" value="${finalamount}" />
			<c:param name="paidAmount" value="${paidamount}" />
			<c:param name="billDate" value="${billdate}" />
			<c:param name="dueDate" value="${duedate}" />
			<c:param name="orderState" value="${state}" />
		</c:url>
	
			<td>
				<a href="${updateorder}">
					<input type="button" name="update" value="Update">
				</a>
				<a href="${deleteorder}">
					<input type="button" name="delete" value="Delete">
				</a>
			</td>
			
        </tr>
    </c:forEach>
</table>
	
</body>
</html>