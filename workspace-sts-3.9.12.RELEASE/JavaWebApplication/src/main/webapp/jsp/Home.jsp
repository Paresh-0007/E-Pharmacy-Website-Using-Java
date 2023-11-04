<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="javaapplication.controller.JWAView" %>
<%@ page import="javawebapplication.bean.*" %>
<%@ page import="javawebapplication.model.ProductModel" %>
<%@ page import="java.util.*" %>
<%@ page import="javawebapplication.utility.JDBCDataSource" %>

<% ProductModel pd = new ProductModel(JDBCDataSource.getConnection());%>
<% List<ProductBean> products = pd.getAllProducts(); 

ArrayList<CartBean> cart_list = (ArrayList<CartBean>) session.getAttribute("cart-list");
List<CartBean> cartProduct = null;
if (cart_list != null) {
	//double total = pDao.getTotalCartPrice(cart_list);
	//request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}


%>


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
    
    <style type="text/css">
   @import url("https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap");

:root {
  --text-color: #30363c;
  --main-color: rgb(7, 161, 161);
  --shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
    rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
  --shadow-border: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px,
    rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  scroll-behavior: smooth;
  font-family: Inter, sans-serif;
  color: var(--text-color);
}

.search-bar form {
  background: #dadada;
  width: 600px;
  height: 50px;
  display: flex;
  border-radius: 15px;
}

.search-bar form input {
  background-color: #dadada;
  flex: 1;
  border: none;
  outline: none;
  border-radius: 15px;
}

.search-bar form button {
  background: #90d4c5;
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

.search-bar form .fa-magnifying-glass {
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
  background-image: url("./images/desktop-com/image-header.jpg");
  height: 90vh;
  min-height: 600px;
  background-position: center bottom;
  background-size: cover;
}

.header {
  background-color: #90d4c5;
  display: flex;
  justify-content: space-between;
  /*padding: 15px 0px 10px 0;*/
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


/* old nav

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
}

*/

.search-bar {
  margin-top: 15px;
}

.main {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.footer {
  background-color: #90d4c5;
  width: 100%;
  height: 40vh;
  display: flex;
  flex-direction: column;
  /* justify-content: center; */
  align-items: center;
}

.footer h1 {
  font-size: 40px;
  font-weight: bolder;
  color: #33796b;
  margin-top: 40px;
  margin-bottom: 35px;
}

.footer-nav {
  font-size: 20px;
  font-weight: bold;
  width: 25%;
  color: #4f9384;
  display: flex;
  justify-content: space-between;
  margin-bottom: 50px;
  /* cursor: pointer;
    transition: all 0.25s ease; */
}

.footer-nav span {
  cursor: pointer;
  transition: all 0.25s ease;
}

.footer-nav span:hover {
  color: #fdfefe;
}

.icons {
  width: 175px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  cursor: pointer;
}

/* NAVBAR NEW */
.nav > ul {
  margin: auto 20px;
  display: flex;
  text-decoration: none;
  list-style: none;
}

.nav > ul li,
.nav > ul li a {
  margin: 10px 12px;
  align-items: center;
  display: flex;
  cursor: pointer;
  text-decoration: none;
}

.nav ul li p {
  margin-left: 5px;
  font-size: 14px;
}

/* ends */

.nav,
.footer-nav {
  user-select: none;
}

.modal {
  display: none;
}

/*--shop categories--*/
.shop-categories > .title {
  margin-bottom: 40px;
}

.shop-categories > div {
  display: flex;
  text-align: center;
  gap: 25px;
}

.shop-categories > div > div {
  cursor: pointer;
}

.shop-categories img {
  width: 100%;
  border-radius: 10px 0;
  box-shadow: var(--shadow-border);
}

.shop-categories img:hover {
  box-shadow: var(--shadow);
}

.shop-categories h4 {
  font-weight: 500;
  font-size: 16px;
  margin: 10px 0;
}

.container-0 {
  width: 100%;
  padding: 40px 5%;
  margin: auto;
  box-sizing: border-box;
}

.container-0 > .title {
  font-weight: 600;
  font-size: 26px;
  align-items: center;
  display: flex;
  text-transform: capitalize;
}

.container-0 > .title > .view-all {
  margin-left: auto;
  font-size: 18px;
  color: var(--main-color);
  cursor: pointer;
}

.container-0 > .subtitle {
  font-size: 16px;
  font-weight: 400;
  margin: 8px 0 24px;
  align-items: center;
}

.container-0 > .subtitle > img {
  height: 18px;
}

/*---wellness essentizal--*/

.product-cards2::-webkit-scrollbar {
  display: none;
}

.product-cards2 {
  display: grid;
  gap: 25px;
  grid-template-columns: repeat(3, 1fr);
}

.product-cards2 > div {
  cursor: pointer;
  display: flex;
}

.product-cards2 > div > img {
  height: 150px;
  aspect-ratio: 1;
  object-fit: contain;
  border-radius: 8px;
  padding: 15px;
  box-sizing: border-box;
  box-shadow: var(--shadow-border);
  margin-bottom: 10px;
}

.product-cards2 > div > img:hover {
  box-shadow: var(--shadow);
}

.product-cards2 > div > div {
  padding: 0 10px 10px 20px;
  box-sizing: border-box;
  display: grid;
  align-content: space-between;
}

.product-cards2 > div .name {
  font-weight: 500;
  font-size: 15px;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  line-clamp: 2;
  -webkit-box-orient: vertical;
}

.product-cards2 > div p {
  margin: 10px 0;
  font-weight: 500;
  color: rgb(167, 167, 167);
}

.product-cards2 > div p > span {
  color: rgb(167, 167, 167);
  text-decoration: line-through;
}

.product-cards2 > div h4 {
  font-weight: 600;
}

.product-cards2 > div h4 > span {
  margin-left: 10px;
  color: rgb(250, 81, 81);
  font-size: 15px;
}

/*Add to cart button */
.button {
  background-color: #4caf50; /* Green */
  border: none;
  border-radius: 4px;
  color: white;
  padding: 2px 6px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 13px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}

.button:hover {
  background-color: #45a049; /* Darker Green */
}

/*-------deals-of-the-day----------*/

.deals-of-the-day > h1 {
  margin-bottom: 40px;
}

.deals-of-the-day > .title > .timer {
  margin-left: 30px;
  border-radius: 5px;
  color: white;
  font-size: 14px;
  padding: 6px 10px;
  background-color: rgb(252, 129, 47);
}

.deals-of-the-day > .title > .timer i {
  color: white;
}

/*---product cards--*/

.product-cards::-webkit-scrollbar {
  display: none;
}

.product-cards {
  display: flex;
  gap: 25px;
  overflow: auto;
  padding: 2px;
}

.product-cards > div {
  cursor: pointer;
  max-width: 175px;
  min-width: 175px;
}

.product-cards > div > img {
  width: 100%;
  aspect-ratio: 0.9;
  object-fit: contain;
  border-radius: 8px;
  padding: 15px;
  box-sizing: border-box;
  box-shadow: var(--shadow-border);
  margin-bottom: 10px;
}

.product-cards > div > img:hover {
  box-shadow: var(--shadow);
}

.product-cards > div .name {
  margin-bottom: 10px;
  font-weight: 500;
  font-size: 15px;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  line-clamp: 2;
  -webkit-box-orient: vertical;
}

.product-cards > div p {
  font-weight: 500;
  color: rgb(167, 162, 167);
}

.product-cards > div p > span {
  color: rgb(167, 162, 167);
  text-decoration: line-through;
}

.product-cards > div h4:last-child {
  font-weight: 600;
  margin-top: 10px;
}

.product-cards > div h4:last-child > span {
  margin-left: 10px;
  color: rgb(250, 81, 81);
  font-size: 15px;
}

/*ADD TO CART*/ 

/* Main cart section */

.main-section{
  width: 100%;
}

.complete-order-button{
  color: white;
  background-color: #4caf50;
  font-weight: 700;
}

.complete-order-button:hover{
  background-color: #45a049;
}

/*---order with prescription--*/

.order-with-prescription {
  display: flex;
  width: 90%;
  margin: 0 auto;
  margin-bottom: 25px;
  border-radius: 5px;
  box-shadow: var(--shadow-border);
}

.order-with-prescription p {
  font-size: 15px;
}

.order-with-prescription > div {
  padding: 20px;
  width: 100%;
  box-sizing: border-box;
}

.order-with-prescription > div:first-child {
  display: flex;
  align-items: center;
  line-height: 30px;
  background-color: rgb(221, 241, 255);
}

.order-with-prescription > div:first-child img {
  margin: 0 30px 0 20px;
  width: 90px;
}

.order-with-prescription > div:first-child button {
  padding: 10px 15px;
  margin-top: 10px;
  color: white;
  border: none;
  cursor: pointer;
  border-radius: 5px;
  font-size: 15px;
  font-weight: 500;
  background-color: var(--main-color);
}

.order-with-prescription > div:first-child button i {
  margin-right: 5px;
  color: white;
  font-size: 16px;
}

.order-with-prescription > div:last-child {
  padding: 25px;
}

.order-with-prescription > div:last-child > h4 {
  font-weight: 500;
  margin-bottom: 20px;
}

.order-with-prescription > div:last-child > div {
  grid-template-columns: repeat(2, 1fr);
  gap: 10px;
}

.order-with-prescription > div:last-child > div > div {
  display: flex;
  align-items: flex-start;
}

.order-with-prescription > div:last-child > div > div > h3 {
  padding: 5px 10px;
  background-color: rgb(235, 242, 255);
  border-radius: 5px;
  color: blue;
  margin-right: 10px;
}

       
/* admin */

.admin-page{
  position: absolute;
  top: 50px;
  bottom: 50px;
  left: 50px;
  right: 50px;
}

.menu > img{
  max-width: 75px;
  margin-bottom: 5px;
}
                     
.card-body{
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.card-body > h1{
  font-size: large;
}

.count{
  font-size: small;
}

.admin .card{
  border: 1px solid #45a049;
}

.admin .card:hover{
  background: #e2e2e2;
  cursor: pointer;
}

/*modal*/
.form-group{
  margin: 5px;
}
    
    </style>

</head>
<body>
<%String userSession = (String)session.getAttribute("fullname");%>
			  
					
	<!-------------NEW BANNER ---------------->
    <div class="header nav">
      <div class="logo">
        <a href="/JavaWebApplication/jsp/Home.jsp"><img class="logo-img" src="/JavaWebApplication/image/logo.png" alt="" /></a>
      </div>
 	<ul>
	<%if(userSession==null) {%>
	 
	 <li id="open_reg">
          <a href="<%= JWAView.SignUpCTL %>"><p>SignUp</p></a>
     </li>
     <li id="open_login">
          <a href="<%= JWAView.LoginCTL %>">
            <i class="fa-regular fa-user"></i>
            <p>Hello, Log In</p>
          </a>
     </li>
        
	 
	 <%}else{ %>
	  <li>
          <a href="/JavaWebApplication/jsp/Order.jsp">
            <p>Your Orders</p>
          </a>
        </li>
        
        <li id="open_login">
        <i class="fa-regular fa-user"></i>
           <%=session.getAttribute("fullname") %>
          <a href="<%= JWAView.LoginCTL+"?operation=logout" %>">
            <p>Log Out</p>
          </a>   
        </li>
	  <%} %>
        <li>
          <a href="/JavaWebApplication/jsp/Medicine.jsp">
            <i class="fa-regular fa-percent"></i>
            <p>Offers</p>
          </a>
        </li>
        
        <li>
          <a href="/JavaWebApplication/jsp/cart.jsp">
            <i class="fa-solid fa-cart-shopping"></i>
            <p>cart</p>
          </a>
       <span class="badge badge-danger">
	<!-- Condition to display no.s of products in cart -->				
	    <%
		if (cart_list != null) {
		out.print(cart_list.size());
		} else {
		out.print("0");
	    }
		%>
	  </span>
        </li>
        
        
      </ul>
    </div>
        <!-------------- MAIN CONTAINER -------------->

        <div class="main">

            <!-------Search bar------->
                <div class="search-bar">
        <form>
          <i class="fa-solid fa-magnifying-glass fa-lg"></i>
          <input type="text" placeholder="What are you looking for ?" />
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
                      <p>MRP <span>INR<%=p.getDprice() %></span></p>
                      <h4>$<%=p.getPrice()%> <span> 10% OFF</span></h4>
                    </div>
                    <a href="AddToCartCTL?id=<%=p.getId() %>"class="add-to-cart-button btn-cart" onclick="alert('Product Added Succesfully')"><div class="add-to-cart">
              <button class="button">Add to Cart</button>
            </div></a>
                  </div>
               
           	<%}}%>
           		  
       
        </div>
      </div>
      <!-- Products Ends Here -->
       <!---order with prescription start-->
    <div class="order-with-prescription">
      <div>
        <img
          src="https://assets.pharmeasy.in/apothecary/images/rx_upload.svg?dim=1024x0"
          alt=""
        />
        <div>
          <h3>Order with prescrion</h3>
          <p>Upload prescription and we will deliver your medicine</p>
          <button>
            <i class="fa-solid fa-paperclip"></i>
            Upload
          </button>
        </div>
      </div>
    </div>
    <!---order with prescription end-->
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
    