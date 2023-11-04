<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javawebapplication.bean.*" %>
<%@ page import="javawebapplication.model.ProductModel" %>
<%@ page import="javaapplication.controller.JWAView" %>
<%@ page import="java.util.*" %>
<%@ page import="javawebapplication.utility.JDBCDataSource" %>


<% ProductModel pd = new ProductModel(JDBCDataSource.getConnection());%>
<% List<ProductBean> products = pd.getAllProducts(); 

ArrayList<CartBean> cart_list = (ArrayList<CartBean>) session.getAttribute("cart-list");
List<CartBean> cartProduct = null;
if (cart_list != null) {
	ProductModel pDao = new ProductModel(JDBCDataSource.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	//double total = pDao.getTotalCartPrice(cart_list);
	//request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}


%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medicines</title>
    <link rel="stylesheet" href="/JavaWebApplication/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossOrigin="anonymous" referrerPolicy="no-referrer" media="screen"/>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">

<style type="text/css">
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
    
    </style>
</head>
<body>
<%String userSession = (String)session.getAttribute("fullname");%>
    <!---------Navbar--------->
    <div class="header nav">
      <div class="logo">
        <a href="./index.html">
          <img class="logo-img" src="./image/logo.png" alt="" />
        </a>
      </div>

      <ul>
      <%if(userSession==null) {%>
        <li id="open_login">
          <a href="<%= JWAView.LoginCTL %>">
            <i class="fa-regular fa-user"></i>
            <p>Hello, Log In</p>
          </a>
        </li>
        <%}else{%>
        <li>
        <a href=<%= JWAView.LoginCTL+"?operation=logout" %>><span>Log Out</span></a>
        <%=session.getAttribute("fullname") %>
        </li>
        <%} %>
        
        <li>
          <a href="#">
            <i class="fa-regular fa-percent"></i>
            <p>Offers</p>
          </a>
        </li>
        <li>
           <a href="/JavaWebApplication/jsp/cart.jsp"> 
   				<span>
      				<i class="fa-solid fa-cart-shopping fa-lg"></i>
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
   				</span>
			  </a>
        </li>
        
      </ul>
    </div>
<%if(userSession!=null){ %>
<h4 style="color: green; text-align: center">Welcome User! Login Successful</h4>
 <%}%> 
    <!-----welnes essential start-->
    <div class="wellness-essentials container-0">
        <div class="title">Medicines</div>
        <h3 class="subtitle">New wellness range just for you !</h3>
        <div class="product-cards2">
          
          <% if(!products.isEmpty()){
        		for(ProductBean p:products){ %>
          
          <div>
            <img
              src="<%=p.getImage()%>"
            />
            <div>
              <h4 class="name"><%=p.getName()%></h4>
              <p>MRP <span>$<%=p.getDprice() %></span></p>
              <h4>$<%=p.getPrice()%><span><%=p.getDiscount()%></span></h4>
              <div class="add-to-cart">
                <a href="/JavaWebApplication/AddToCartCTL?id=<%=p.getId() %>" ><button class="button" onclick="alert('Product Added Succesfully')">Add to Cart</button></a>
              </div>
            </div>
          </div>

         <%}}%>
        
        </div>
      </div>
      <!-----wellness essential end-->
       <!---order with prescription start-->
    <div class="order-with-prescription">
      <div>
        <img
          src="https://assets.pharmeasy.in/apothecary/images/rx_upload.svg?dim=1024x0"
          alt=""
        />
        <div>
          <h3>Order with prescription</h3>
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
</body>
</html>