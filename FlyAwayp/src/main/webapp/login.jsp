<%@ page import="servlets.Login"%>
<% Login.isLoggedIn = false; %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin - Login FlyAway Airlines</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/global.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
        body, html {
            height: 100%;
            line-height: 1.8;
        }
        .bgimg-1 {
            background-position: center;
            background-size: cover;
            background-image: url("img/family.png");
            background: #00b4db;
            min-height: 100%;
        }
        .color{
        color:white;
        }
        .w3-bar .w3-button {
            padding: 16px;
        }
    </style>
</head>
<body >
<div class="w3-bar w3-black w3-card" id="myNavbar">
 <a href="index.jsp" class="w3-bar-item w3-button w3-wide">Fly<span style="color:blue; font-weight:600
             ">Away</span></a>
                 <div class="w3-right w3-hide-small">
        <a href="login.jsp" class="w3-bar-item w3-button"><i class="fa fa-gear"></i> Login</a>
    </div>
</div>
    <section class="container-fluid bg bgimg-1 ">
        <section class="row justify-content-center">
            <div class="row">
                <div class="col">
                    <h2 align="center" style="color:whitesmoke;"><b>Login</b></h2>
                    <br>
                </div>
            </div>
            <section class="col-sm-6 col-md-3">
                <form action="login" method="post" class="form-container">
                    <div class="form-group mb-2">
                        <label for="inputEmail" class="color" >Email address</label>
                        <input type="email" name="emailEntered" class="form-control" id="inputEmail" aria-describedby="emailHelp" placeholder="Enter email">
                        <br><small id="emailHelp" class="form-text text-muted">&nbsp;&nbsp;Email :<%=Login.email %></small>
                    </div>
                    <div class="form-group mx-sm-3 mb-2">
                        <label for="inputPassword" class="color">Password</label>
                        <input type="password" name="passwordEntered" class="form-control" id="inputPassword" placeholder="Password">
                        <br><small id="passwordHelp" class="form-text text-muted">&nbsp;&nbsp; Current Password :&nbsp;<%= Login.password %></small>
                    </div>
                    <button type="submit" class="btn btn-success btn-block" value="Submit">Login</button>
                </form>
                
            </section>
           
        </section>
    </section>
</div>
</body>
</html>
