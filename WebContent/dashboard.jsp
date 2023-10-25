<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.laundrypro.mix.LMSDBUtil"%>

<!DOCTYPE html>
<html>
<head>
<title>DashBoard</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">

<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/Dashboard.css">
</head>
<body>

	<%
	int ConfirmedCount = LMSDBUtil.ConfirmedCount();
	int ProcessingCount = LMSDBUtil.ProcessingCount();
	int ReadyCount = LMSDBUtil.ReadyCount();
	int HoldCount = LMSDBUtil.HoldCount();
	int CompleteCount = LMSDBUtil.CompleteCount();
	double MonthlyIncome = LMSDBUtil.MonthlyIncome();
	double DailyIncome = LMSDBUtil.DailyIncome();
	%>

	<div class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="aside.jsp" />
		<!--main content-->
		<main class="main-container">
			<div class="main-title">
				<p class="font-weight-bold">Current Process States</p>
			</div>

			<div class="main-cards">

				<div class="card">
					<div class="card-inner">
						<p class="text-primary">CONFIRMED</p>
						<span class="material-icons-outlined">check</span>
					</div>
					<span class="font-weight-bold"><%=ConfirmedCount%></span>
				</div>

				<div class="card">
					<div class="card-inner">
						<p class="text-primary">PROCESSING</p>
						<span class="material-icons-outlined">loop</span>
					</div>
					<span class="font-weight-bold"><%=ProcessingCount%></span>
				</div>

				<div class="card">
					<div class="card-inner">
						<p class="text-primary">HOLD</p>
						<span class="material-icons-outlined">report</span>
					</div>
					<span class="font-weight-bold"><%=HoldCount%></span>
				</div>

				<div class="card">
					<div class="card-inner">
						<p class="text-primary">READY</p>
						<span class="material-icons-outlined">check_circle</span>
					</div>
					<span class="font-weight-bold"><%=ReadyCount%></span>
				</div>

				<div class="card">
					<div class="card-inner">
						<p class="text-primary">COMPLETE</p>
						<span class="material-icons-outlined">assignment_turned_in</span>
					</div>
					<span class="font-weight-bold"><%=CompleteCount%></span>
				</div>

			</div>

			<div class="main-title">
				<p class="font-weight-bold">Income Section</p>
			</div>

			<div class="income">

				<div class="income-card">
					<div class="card-inner">
						<p class="text-primary">MONTHLY INCOME</p>
						<span class="material-icons-outlined"> calendar_month </span>
					</div>
					<span class="font-weight-bold">Rs. <%=MonthlyIncome%></span>
				</div>

				<div class="income-card">
					<div class="card-inner">
						<p class="text-primary">DAYLY INCOME</p>
						<span class="material-icons-outlined"> attach_money </span>
					</div>
					<span class="font-weight-bold">Rs. <%=DailyIncome%></span>
				</div>

			</div>

		</main>
	</div>
</body>
</html>