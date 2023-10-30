<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="javaapplication.controller.JWAView" %>
<%@ page import="javawebapplication.bean.ProductBean" %>
<%@ page import="javawebapplication.model.ProductModel" %>
<%@ page import="javaapplication.controller.JWAView" %>
<%@ page import="java.util.List" %>
<%@ page import="javawebapplication.utility.JDBCDataSource" %>

<% ProductModel pd = new ProductModel(JDBCDataSource.getConnection());%>
<% List<ProductBean> products = pd.getAllProducts(); %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MED 24x7</title>
    <link rel="stylesheet" href="/JavaWebApplication/css/style.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
      integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
      media="screen"
    />
    <link
      href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css"
      rel="stylesheet"
    />

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
             
               <a> <span><i class="fa-regular fa-user fa-lg"></i></span> </a>
               <a> <span><i class="fa-regular fa-bell fa-lg"></i></span> </a>
               <a href="/JavaWebApplication/jsp/cart.jsp"> <span><i class="fa-solid fa-cart-shopping fa-lg"></i></span> </a>
            </div>
        </div>

        <!-------------- MAIN CONTAINER -------------->

        <div class="main">

            <!------chota nav--------->
            <div class="chota-nav">
                <a href="/JavaWebApplication/jsp/Medicine.jsp">Medicine</a>
                <a href="#">Lab tests</a>
                <a href="#">Offers</a>
                <a href="#">PLUS</a>
                <a href="#">Health Blogs</a>
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
        
        	<% if(!products.isEmpty()){
        		for(ProductBean p:products){ %>
           		<div>
                    <img
                      src="<%=p.getImage()%>"
                    />
                    <div>
                      <h4 class="name">
                        <%=p.getName() %>
                      </h4>
                      <p>MRP <span>$240</span></p>
                      <h4>$<%=p.getPrice()%> <span> 10% OFF</span></h4>
            		  
            		  <a href="AddToCartCTL?id=<%=p.getId() %>" class="add-to-cart-button btn-cart" onclick="alert('Product Added Succesfully')">Add to Cart</a>
            		  
                    </div>
                  </div>
           	<%}}%>
           		  
       
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
    