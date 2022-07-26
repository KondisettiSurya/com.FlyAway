<%@page import="java.sql.*"%>
<%@ page import="model.Search"%>

<%
String driverName = "com.mysql.cj.jdbc.Driver";

String connectionUrl = "jdbc:mysql://localhost:3306/flyaway";
String userId = "root";
String password = "root";

String query = Search.getQuery();
try {
	Class.forName(driverName);
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Search Results - FlyAway Airlines</title>
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
	background-color: #7f7fd5;
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
				class="fa fa-gear"></i> Login</a>
		</div>
	</div>
	<div class="container">
		<h1 align="center" style="color: white">
			<span><strong>Search Results</strong></span>
		</h1>
		<p align="center" style="color: white">
			<span><strong> Showing available flights from <br>
					<%=Search.source%> to <%=Search.destination%> <br> Date of
					travel : <%=Search.date%> (<%=Search.day%>) <br> No of
					travellers : <%=Search.persons%> <br>
		</p>
		<table class="table table-hover table-striped">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Flight</th>
					<th scope="col">Source</th>
					<th scope="col">Destination</th>
					<th scope="col">Date</th>
					<th scope="col">Ticket Price</th>
					<th scope="col">Select</th>
				</tr>
			</thead>
			<tbody>
				<br>
				<p align="center" style="color: white">
					<span><strong>Select a flight</strong></span>
				</p>
				<br>
				<%
				try {
					connection = DriverManager.getConnection(connectionUrl, userId, password);
					statement = connection.createStatement();
					resultSet = statement.executeQuery(query);
					while (resultSet.next()) {
				%>
				<tr bgcolor="#F5F5F4">
					<td><%=resultSet.getString("flight_id")%></td>
					<td><%=resultSet.getString("name")%></td>
					<td><%=resultSet.getString("source")%></td>
					<td><%=resultSet.getString("destination")%></td>
					<td><%=Search.date%></td>
					<td><%=resultSet.getString("ticket_price")%></td>
					<td>

						<form
							action="${pageContext.request.contextPath}/booking-details.jsp"
							method="post">

							<input type="hidden" id="name" name="name"
								value=" <%=resultSet.getString("name")%>"> <input
								type="hidden" id="ticket_price" name="ticket_price"
								value=" <%=resultSet.getString("ticket_price")%>"> <input
								type="hidden" id="flight_id" name="flight_id"
								value=" <%=resultSet.getString("flight_id")%>"> <input
								type="submit" class="btn btn-success" value="Book This Flight">
						</form>
					</td>
				</tr>
				<%
				}
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>
			</tbody>
		</table>
	
</body>
</html>