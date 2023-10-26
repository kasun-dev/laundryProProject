<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Manage Prices</title>
<script src="js/scripts.js"></script>
<link rel="stylesheet" href="css/styles.css">
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="aside.jsp" />
		<!--main content-->
		<main class="main">
			<div id="main-content">
				<!-- add new price -->
				<div class="add-price">
					<div class="price-header">Add New Price</div>
					<!-- form add new price -->
					<form class="price-form" method="post" action="insertPrice">
						<label>Service type</label>
						<select name="service" id="service" onchange="changeFormContentPrices()">
							<option value="dry_clean">Dry Clean</option>
							<option value="bulk">Bulk laundry</option>
						</select> <br />
						<div id="dry-clean" style="display: block">
							<label>Item name</label>
							<input type="text" name="iname" placeholder="Enter item name" />
							<br />
							<label>Item price(rs)</label>
							<input type="text" inputmode="numeric" name="iprice1" placeholder="Enter price in rupees" />
							<br />
							<input type="submit" value="add" />
						</div>
						<div id="bulk" style="display: none">
							<label>Weight(in kilos)</label>
							<input type="text" inputmode="numeric" name="weight" placeholder="Enter weight in kilos(kg)" />
							<br />
							<label>Item price(rs)</label>
							<input type="text" inputmode="numeric" name="iprice2" placeholder="Enter price in rupees" />
							<br />
							<input type="submit" value="add" />
						</div>
					</form>
				</div>

				<!--show, edit and delete price - BULK -->
				<div class="bulk-table">
					<table>
						<caption>Bulk Prices</caption>

						<tr>
							<th>Weight (in Kilos)</th>
							<th>Price</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>

						<!--  Iterate over retrieved array list -->
						<c:forEach var="bprice" items="${bprices}">

							<!-- Save items to variables -->
							<c:set var="bid" value="${bprice.id}" />
							<c:set var="weight" value="${bprice.weight}" />
							<c:set var="kgprice" value="${bprice.price}" />

							<!-- forward data as parameters for update -->
							<c:url value="updatePricesBulk.jsp" var="bulkupdate">
								<c:param name="bid" value="${bid}"></c:param>
								<c:param name="weight" value="${weight}"></c:param>
								<c:param name="kgprice" value="${kgprice}"></c:param>
							</c:url>

							<!-- display data with edit and delete options -->
							<tr>
								<td>${bprice.weight}</td>
								<td>${bprice.price}</td>
								<td><a href="${bulkupdate}">
										<input type="button" name="edit" value="edit" class="edit-button"/>
									</a></td>
								<td><form method="post" action="deletePrices">
										<input type="submit" value="delete" class="delete-button"/>
										<input type="hidden" name="bid" value="${bid}" />
										<input type="hidden" name="type" value="bulk" />
									</form></td>
							</tr>
						</c:forEach>
					</table>
				</div>



				<!--show, edit and delete price - DRY CLEAN-->
				<div class="dry-clean-table">
					<table>
						<caption>Dry Clean Prices</caption>
						<tr>
							<th>Item name</th>
							<th>Price</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
						<!--  Iterate over retrieved array list -->
						<c:forEach var="dcprice" items="${dcprices}">

							<!-- Save items to variables -->
							<c:set var="itemname" value="${dcprice.itemname }" />
							<c:set var="iprice" value="${dcprice.price }" />
							<c:set var="dcid" value="${dcprice.id}" />

							<!-- forward data as parameters for update -->
							<c:url value="updatePricesDryClean.jsp" var="dcupdate">
								<c:param name="dcid" value="${dcid}"></c:param>
								<c:param name="itemname" value="${itemname}"></c:param>
								<c:param name="iprice" value="${iprice}"></c:param>
							</c:url>

							<tr>
								<td>${dcprice.itemname}</td>
								<td>${dcprice.price}</td>

								<td><a href="${dcupdate}">
										<input type="button" name="edit" value="edit" class="edit-button"/>
									</a></td>
								<td><form method="post" action="deletePrices">
										<input type="submit" value="delete" class="delete-button"/>
										<input type="hidden" name="dcid" value="${dcid}" />
										<input type="hidden" name="type" value="dry_clean" />
									</form></td>

							</tr>
						</c:forEach>
					</table>
				</div>
			</div>

		</main>
	</div>
</body>
</html>
