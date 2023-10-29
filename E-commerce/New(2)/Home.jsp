<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="javaapplication.controller.JWAView" %>

<!DOCTYPE html>
<html lang="en">
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
            <%if(userSession==null) {%>
                <a href="<%= JWAView.SignUpCTL %>"><span>SignUp</span></a>
                <a href="<%= JWAView.LoginCTL %>"><span>Login</span></a>
             <%}else{ %>
             	<a href="<%=JWAView.UserListCTL%>"><span>User List</span></a>
                <a href=<%= JWAView.LoginCTL+"?operation=logout" %>><span>Log Out</span></a>
                <%=session.getAttribute("fullname") %>
             <%} %>
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <span><i class="fa-regular fa-bell fa-lg"></i></span>
                <span><i class="fa-solid fa-cart-shopping fa-lg"></i></span>
            </div>
        </div>

        <!-------------- MAIN CONTAINER -------------->

        <div class="main">

            <!------chota nav--------->
            <div class="chota-nav">
                <a href="../Medicine page/index.html">Medicine</a>
                <a>Lab tests</a>
                <a>Offers</a>
                <a>PLUS</a>
                <a>Health Blogs</a>
            </div>

            <!-------Search bar------->
                <div class="container">
                    <form>
                        <i class="fa-solid fa-magnifying-glass fa-lg"></i>
                        <input type="text" placeholder="What are you looking for ?">
                        <button type="submit">Search</button> 
                    </form>
                </div>
    
                <!--------banner------->
                <!-- <div class="banner-wrapper">
                    <div class="next-arrow"></div>
                    <div class="prev-arrow"></div>
                    <label></label>
                    <div class="banner-box">
                        <img src="">
                    </div>
                </div> -->
        </div>
<%if(userSession!=null){ %>
<h4 style="color: green; text-align: center">Welcome User! Login Successful</h4>
 <%}%> 
  <!---shop categories start-->
      <div class="shop-categories container-0">
        <h1 class="title">Shop by categories</h1>
        <div>
          <div>
            <img
              src="https://cdn01.pharmeasy.in/dam/discovery/categoryImages/6d462f424a43372ea8b7b6f8ca13e052.png?f=png?dim=256x0"
              alt=""
            />
            <h4>Covid essentials</h4>
          </div>
          <div>
            <img
              src="https://cdn01.pharmeasy.in/dam/discovery/categoryImages/b4a3a67a59783e0ca738884c9acc8e7b.png?f=png?dim=256x0"
              alt=""
            />
            <h4>Personal care</h4>
          </div>
          <div>
            <img
              src="https://cdn01.pharmeasy.in/dam/discovery/categoryImages/62e6d7551ecf3a5da1d2336c41cc0549.png?f=png?dim=256x0"
              alt=""
            />
            <h4>Health food and drinks</h4>
          </div>

          <div>
            <img
              src="https://cdn01.pharmeasy.in/dam/discovery/categoryImages/ff5aaa03881e3016bf409f85b4e328aa.png?f=png?dim=256x0"
              alt=""
            />
            <h4>Skin Care</h4>
          </div>
          <div>
            <img
              src="https://cdn01.pharmeasy.in/dam/discovery/categoryImages/68ae87e29f4a3abbb8ed69fe7ecf057c.png?f=png?dim=256x0"
              alt=""
            />
            <h4>Home care</h4>
          </div>
          <div>
            <img
              src="https://cdn01.pharmeasy.in/dam/discovery/categoryImages/4209e1d247cd30fca1f619786fa3e9c1.png?f=png?dim=256x0"
              alt=""
            />
            <h4>Ayurvedic</h4>
          </div>
        </div>
      </div>
      <!---shop categories end-->
	  <!-- Products Starts Here -->
      <div class="deals-of-the-day container-0">
        <h1 class="title">
          Deals of the Day
          <span class="timer"><i class="fa-regular fa-clock"></i> 06:00 HOURS LEFT, HURRY!</span>
          <!--<span class="view-all">View All</span>-->
        </h1>
        <div class="product-cards">
          <div>
            <img
              src="https://cdn01.pharmeasy.in/dam/products_otc/I48459/sirona-feminine-cramp-relief-patch-packet-of-5-s-2-1641788205.jpg?dim=320x320&amp;dpr=1&amp;q=100"
            />
            <div>
              <h4 class="name">
                Sirona Feminine Cramp Relief Patch Packet Of 5 'S
              </h4>
              <p>MRP <span>₹240</span></p>
              <h4>₹216.00<span>10% OFF</span></h4>
            </div>
          </div>

          <div>
            <img
              src="https://cdn01.pharmeasy.in/dam/products_otc/J51815/liveasy-wellness-apple-cider-vinegar-with-mother-improves-metabolism-500ml-bottle-2-1654165611.jpg?dim=320x320&amp;dpr=1&amp;q=100"
            />
            <div>
              <h4 class="name">
                Liveasy Wellness Apple Cider Vinegar With Mother -Improves
                Metabolism- 500ml Bottle
              </h4>
              <p>MRP <span>₹640</span></p>
              <h4>₹224.00<span>65% OFF</span></h4>
            </div>
          </div>

          <div>
            <img
              src="https://cdn01.pharmeasy.in/dam/products_otc/I00596/revital-h-women-multivitamin-with-calcium-zinc-ginseng-for-immunity-strong-bones-energy-30-tablets-1-1654168794.jpg?dim=320x320&amp;dpr=1&amp;q=100"
            />
            <div>
              <h4 class="name">
                Revital H Women Multivitamin With Calcium, Zinc, Ginseng For
                Immunity, Strong Bones &amp; Energy 30 Tablets
              </h4>
              <p>MRP <span>₹345</span></p>
              <h4>₹293.25<span>15% OFF</span></h4>
            </div>
          </div>

          <div>
            <img
              src="https://cdn01.pharmeasy.in/dam/products_otc/183157/volini-pain-relief-gel-tube-of-75-g-1-1654078754.jpg?dim=320x320&amp;dpr=1&amp;q=100"
            />
            <div>
              <h4 class="name">Volini Pain Relief Gel Tube Of 75 G</h4>
              <p>MRP <span>₹245</span></p>
              <h4>₹208.25<span>15% OFF</span></h4>
            </div>
          </div>

          <div>
            <img
              src="https://cdn01.pharmeasy.in/dam/products_otc/071710/evion-400mg-strip-of-10-capsules-2-1656662057.jpg?dim=1024x0"
            />
            <div>
              <h4 class="name">Evion 400mg Strip of 10 Capsules</h4>
              <p>MRP <span>₹35</span></p>
              <h4>₹31.50<span>10% OFF</span></h4>
            </div>
          </div>

          <div>
            <img
              src="https://cdn01.pharmeasy.in/dam/products_otc/I32380/livogen-z-captab-15s-2-1656662098.jpg?dim=320x320&amp;dpr=1&amp;q=100"
            />
            <div>
              <h4 class="name">Livogen Z Captab 15'S</h4>
              <p>MRP <span>₹70.4</span></p>
              <h4>₹63.36<span>10% OFF</span></h4>
            </div>
          </div>
          
        </div>
      </div>
      <!-- Products Ends Here -->
        <!---------------- FOOTER ------------------>

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
    </div>
    <script src="script.js"></script>
</body>
</html>
    
