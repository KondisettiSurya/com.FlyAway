<%@ page import="java.sql.*"%>
<%@page import="servlets.Login"%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FlyAway Airlines</title>
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
	background-color: #7f7fd5;
}

.bgimg-1 {
	background-position: bottom;
	background-size: 50%;
	background-repeat: no-repeat;
	background-image: url("img/flight.png");
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
			style="color: rgb(189, 75, 170); font-weight: 600">Away</span></a>
		<div class="w3-right w3-hide-small">
			<a href="login.jsp" class="w3-bar-item w3-button"><i
				class="fa fa-gear"></i> Login</a>
		</div>
	</div>
<%
	if (Login.isLoggedIn) {
	%>
	<div class="container bgimg-1">
		<h2 align="center">
			<b>Admin Dashboard</b>
		</h2>
		<p align="center">
			<span><strong>You are LoggedIn as : <%=Login.email%>.
					Your Password is : <%=Login.password%></strong></span>
		</p>
		<br> <br>
		<div class="row">
			<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
				<form method="post"
					action="${pageContext.request.contextPath}/change-password.jsp">
					<button type="submit" class="btn btn-success mb-2 btn-block">Change
						Password</button>
		</form>
				&ensp;
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
				<form method="post"
					action="${pageContext.request.contextPath}/add-flight.jsp">
					<button type="submit" class="btn btn-success mb-2 btn-block">Add
						new Flight</button>
				</form>
				&ensp;
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
				<form method="post"
					action="${pageContext.request.contextPath}/show-bookings.jsp">
					<button type="submit" class="btn btn-success mb-2 btn-block">Previous
						bookings</button>
				</form>
				&ensp;
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
				<form method="post"
					action="${pageContext.request.contextPath}/login.jsp">
					<button type="submit" class="btn mb-2 btn-danger btn-block">Logout</button>
				</form>
			</div>

		</div>
	</div>

	<section class="container-fluid">
		<section class="row justify-content-center">
			<section>
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th scope="col">Flight ID</th>
							<th scope="col">Name</th>
							<th scope="col">Source</th>
							<th scope="col">Destination</th>
							<th scope="col">Day</th>
							<th scope="col">Ticket Price</th>
						</tr>
					</thead>
					<tbody>

						<p align="center">
							<span
								style="font-size: 50px; font-weight: 600; text-decoration: underline">
								Flight Details</span>
						</p>
						<br>

						<%
						String driverName = "com.mysql.cj.jdbc.Driver";
						String connectionUrl = "jdbc:mysql://localhost:3306/flyaway";
						String userId = "root";
						String password = "root";

						try {
							Class.forName(driverName);
							System.out.println("connected driver");
						} catch (ClassNotFoundException e) {
							e.printStackTrace();
						}

						Connection con = null;
						Statement stmt = null;
						ResultSet res = null;
						
						try {
							con = DriverManager.getConnection(connectionUrl, userId, password);
							stmt = con.createStatement();
							String sql = "SELECT * FROM flight";
							res = stmt.executeQuery(sql);
							System.out.println("executed");
							while (res.next()) {
						%>

						<tr>
							<td><%=res.getInt("flight_id")%></td>
							<td><%=res.getString("name")%></td>
							<td><%=res.getString("source")%></td>
							<td><%=res.getString("destination")%></td>
							<td><%=res.getString("days")%></td>
							<td><%=res.getInt("ticket_price") %>
							</td>
						</tr>
						<%
						}
						} catch (Exception e) {
						e.printStackTrace();
						}
						} else {
						out.print("You must Login first");
						}
						%>
					</tbody>
				</table>
			</section>
		</section>
	</section>
</body>
</html>