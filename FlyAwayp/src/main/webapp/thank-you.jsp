<%@  page import="model.Search"%>
<%@ page import="model.Booking"%>
<%

Booking.name_on_card = request.getParameter("name_on_card");
Booking.card_details = request.getParameter("card_details");

if (Booking.name_on_card.equals("") || Booking.card_details.equals("")) {
	out.println("Please enter valid card details");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Thank You - FlyAway Airlines</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", sans-serif
}

body, html {
	height: 100%;
	line-height: 1.8;
	background: #2980b9;
}

.bgimg-1 {
	background-position: center;
	background-size: cover;
	background-image: url("img/plane.png");
	min-height: 100%;
}

.w3-bar .w3-button {
	padding: 16px;
}
</style>
</head>

<body>
	<div class="w3-bar w3-black w3-card" id="myNavbar">
		<a href="index.jsp" class="w3-bar-item w3-button w3-wide">Fly<span
			style="color: blue; font-weight: 600">Away</span></a>
		<div class="w3-right w3-hide-small">
			<a href="login.jsp" class="w3-bar-item w3-button"><i
				class="fa fa-gear"></i>Login</a>
		</div>
	</div>
	<div class="container">
		<h1 align="center">
			<span><strong>THANK YOU </strong></span>
		</h1>
		<div align="center" class="col">
			<!--<img src="img/flight.png" class="img-fluid" alt="image">
		--></div>
		<p align="center">
			<span><strong>Your ticket has been booked.<br>
			 The summary/details are as follows</strong></span>
		</p>
		<p>
			<button onclick="window.print()" class="btn btn-success btn-block">Print
				Ticket</button>
		</p>
		<br>
		<h3 ><strong style=" text-decoration: underline;">Ticket Summary :</strong></h3><br>
		
		<h3>
			<strong>Traveling :</strong>&nbsp; <%=Search.source%> To <%=Search.destination%> <br> <br>
			<strong>Date :</strong> &nbsp; <%=Search.date%><br><br>
			<strong>Day:</strong>&nbsp;<%=Search.day%><br><br>
			<strong>Booking ID :</strong>&nbsp;<%=Booking.flight_booking_id%><br><br>
			<strong>Flight Name :</strong>&nbsp;<%=Booking.flight_name%><br><br>
			<strong>People :</strong> &nbsp;<%=Search.persons%>
		</h3>
		
		<br><br>
		<h3>
			<strong style=" text-decoration: underline;">Passenger Summary : </strong>
		</h3>
		
		<h3>
			<strong>Name:</strong> &nbsp;
			<%=Booking.passenger_name%><br> <br>
			<strong> Email :</strong>&nbsp;
			<%=Booking.passenger_email%><br> <br>
			<strong>Phone No :</strong> &nbsp;
			<%=Booking.passenger_phone%><br><br>
		</h3>
		<br>
		<h3>
			<strong style=" text-decoration: underline;">Payment Summary : </strong>
		</h3>
		<h4>
			<strong>Payment By:</strong>&nbsp; <%=Booking.name_on_card%><br><br>
			<strong>Card No:</strong>&nbsp; <%=Booking.card_details%>
		</h4>
		<br>
		<br> <br>

</body>
</html>
