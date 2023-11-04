<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javaapplication.controller.JWAView" %>
<%@ page import="javawebapplication.utility.ServletUtility" %>
<%@ page import="javawebapplication.bean.SignUpBean" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MED 24x7</title>
    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
        integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
        crossOrigin="anonymous"
        referrerPolicy="no-referrer"
        media="screen">

    <style>
    	tbody td{
    		text-align: center;
    	}
    
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            scroll-behavior: smooth;
            font-family: sans-serif;
        }

        .container {
            margin-top: 15px;
        }

        a {
            text-decoration: none;
        }

        form {
            background: #dadada;
            width: 600px;
            height: 50px;
            display: flex;
            border-radius: 15px;
        }

        form input {
            background-color: #dadada;
            flex: 1;
            border: none;
            outline: none;
            border-radius: 15px;
        }

        form button {
            background: #90D4C5;
            font-weight: bold;
            padding: 10px 32px;
            border: none;
            outline: none;
            color: black;
            letter-spacing: 1px;
            cursor: pointer;
            border-top-right-radius: 15px;
            border-bottom-right-radius: 15px;
        }

        form .fa-magnifying-glass {
            align-self: center;
            padding: 10px 20px;
            color: black;
        }

        img {
            user-select: none;
        }

        .logo-img {
            width: 120px;
        }

        .icons i {
            size: 50px;
            color: #2c7566;
        }

        .button {
            cursor: pointer;
        }

        .banner {
            background-image: url('./images/desktop-com/image-header.jpg');
            height: 90vh;
            min-height: 600px;
            background-position: center bottom;
            background-size: cover;
        }

        .header {
            background-color: #90D4C5;
            display: flex;
            justify-content: space-between;
            padding: 15px 0px 10px 0;
        }

        .logo {
            margin-left: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .mobile-nav {
            display: none;
        }

        .nav {
            color: #000000;
            cursor: pointer;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .nav span {
            margin-right: 30px;
            margin-left: 10px;
            color: black;
        }

        .contact {
            color: black;
            background-color: white;
            border-radius: 25px;
            font-weight: bolder;
            padding: 13px;
            font-size: 16px;
            transition: all 0.2s ease;
        }

        .contact:hover {
            background-color: #335399;
            color: white;
        }

        .main {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .title {
            color: black;
            font-weight: bold;
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
            font-size: 50px;
            letter-spacing: 6px;
            -webkit-transform: scale(0);
            transform: scale(0);
            -webkit-animation: scaleIn 1s 0.1s 1 forwards;
            animation: scaleIn 1s 0.1s 1 forwards;
        }

        .footer {
            background-color: #90D4C5;
            width: 100%;
            height: 35vh;
            display: flex;
            flex-direction: column;
            position: absolute;
            top: 100%;
            align-items: center;
        }

        .footer h1 {
            font-size: 40px;
            font-weight: bolder;
            color: #33796B;
            margin-top: 40px;
            margin-bottom: 35px;
        }

        .footer-nav {
            font-size: 20px;
            font-weight: bold;
            width: 25%;
            color: #4F9384;
            display: flex;
            justify-content: space-between;
            margin-bottom: 50px;
        }

        .footer-nav span {
            cursor: pointer;
            transition: all 0.25s ease;
        }

        .footer-nav span:hover {
            color: #FDFEFE;
        }

        .icons {
            width: 175px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
        }

        .nav, .footer-nav {
            user-select: none;
        }

        .modal {
            display: none;
        }

        .chota-nav {
            height: 40px;
            width: 100%;
            border-bottom: 0.5px dotted grey;
            display: flex;
            justify-content: center;
            font-size: 15px;
            font-weight: 300px;
            align-items: center;
            padding: 0 30px;
        }

        .chota-nav a {
            margin: 0 30px;
            color: black;
        }

        .chota-nav a:hover {
            text-decoration: black underline solid;
            cursor: pointer;
        }
     
		th, td {
  		background-color: #90D4C5;
		}
    </style>
</head>
<body>
<%String userSession = (String)session.getAttribute("fullname");%>
   <!------------- BANNER ---------------->
        <div class="header">
            <div class="logo">
                <img class="logo-img" src="./image/logo.png" alt="">
            </div>
            <div class="nav">
                <a href=<%= JWAView.LoginCTL+"?operation=logout" %>><span>Log Out</span></a>
       			<a href="<%=JWAView.HomeCTL %>"><span>Home</span></a>
       			<span><i class="fa-regular fa-user fa-lg"></i></span>
                <%=session.getAttribute("fullname") %>
            </div>
        </div>
        
        <div>
        	<h1 style="background: #90D4C5; ">
        		Registered Users
        	</h1>
        </div>
        
        
        
        
<!-- User List Table -->
<table style="width:100%">
<thead> 
  <tr>
    <th scope="col">Id</th>
      <th scope="col">Full Name</th>
      <th scope="col">Email</th>
      <th scope="col">Password</th>
      <th scope="col">MobileNo</th>
  </tr>
</thead>
<tbody>
<%
  		int index=1;
  		List list=ServletUtility.getList(request);
  		Iterator it=list.iterator();
  		while(it.hasNext()){
  		SignUpBean user=(SignUpBean)it.next();
  %>

  <tr>
   <th scope="row"><%=user.getId() %></th>
      <td><%=user.getFullname() %></td>
      <td><%=user.getEmail() %></td>
      <td><%=user.getPassword() %></td>
      <td><%=user.getMobileNo() %></td>
    </tr>
<%}%>
 </tbody>
</table>
<!----------------------- Footer --------------------------->
 <div class="footer">
            <h1>Med 24x7</h1>
            <div class="footer-nav">
                <span>About</span>
                <span>Policy Info</span>
                <span>Need Help</span>
            </div>
            <div class="icons">
                <i class="fa-brands fa-pinterest fa-lg"></i>
                <i class="fa-brands fa-facebook fa-lg"></i>
                <i class="fa-brands fa-instagram fa-lg"></i>
                <i class="fa-brands fa-twitter fa-lg"></i>           
             </div>
        </div>
    <script src="script.js"></script>
</body>
</html>