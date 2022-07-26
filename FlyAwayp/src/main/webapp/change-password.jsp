<%@ page import="servlets.Login"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Change Password</title>
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
	background-color: #7f7fd5;
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
			<a href="/login.jsp" class="w3-bar-item w3-button"><i
				class="fa fa-gear"></i>Login</a>
		</div>
	</div>
	<div class="container">
		<h2 align="center">
			<b>New Password<b>
		</h2>
		<br> <br> <br>
		<%
		if (Login.isLoggedIn) {
		%>
		<form action="change-password" method="post">


			<div id="passwordHelp" class="form-group mx-sm-3 mb-2">
				<label for="inputPassword" style="color: white">New Password
					:</label> <br> <input type="password" name="passwordEntered"
					class="form-control" id="inputPassword"
					placeholder="Enter a new password"> <br> <small
					class="form-text text-muted">Current email : <%=Login.email%>
				</small><br> <small id="passwordHelp" class="form-text text-muted">
					Current Password :&nbsp;<%=Login.password%></small>


			</div>
			<button type="submit" class="btn btn-info mb-2">Change
				Password</button>
		</form>
		<%
		} else {
		out.print("You must Login first");
		}
		%>
	</div>
	
</body>
</html>
