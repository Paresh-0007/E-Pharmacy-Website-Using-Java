<%@page import="java.text.DecimalFormat"%>
<%@page import="javaapplication.controller.*"%>
<%@page import="javawebapplication.bean.*"%>
<%@page import="javawebapplication.model.*"%>
<%@page import="javawebapplication.utility.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	Long userSession2 = (Long)request.getSession().getAttribute("id");
	List<OrderBean> orders = null;
	if (userSession2 != null) {
	    request.setAttribute("person", userSession2);
	    OrderModel orderDao  = new OrderModel(JDBCDataSource.getConnection());
		orders = orderDao.userOrders(userSession2);
	}else{
		response.sendRedirect("login.jsp");
	}
	ArrayList<CartBean> cart_list = (ArrayList<CartBean>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
	%> 
<!DOCTYPE html>
<html>
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
    <style>
    	tbody td{
    		text-align: center;
    	}
    </style>    
    

<title>E-Commerce Cart</title>
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
            <i class="fa-regular fa-percent"></i>
            <p>Your Orders</p>
          </a>
        </li>
        
        <li id="open_login">
           <%=session.getAttribute("fullname") %>
          <a href="<%= JWAView.LoginCTL+"?operation=logout" %>">
            <i class="fa-regular fa-user"></i>
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
    
    
    
	
<!--  		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			
			
			<%
			if(orders != null){
				for(OrderBean o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						
						<td><%=o.getQunatity() %></td>
						<td><%=dcf.format(o.getPrice()) %></td>
						<td><a class="btn btn-sm btn-danger" href="/JavaWebApplication/cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
					</tr>
				<%}
			}
			%>
			</tbody>
		</table>
		
		-->
	<div class="container">
		<div style="padding-left: 20px; font-size: 30px; font-weight: bold;" class="card-header my-3">All Orders</div>	
		<table style="width:100%">
        <thead> 
          <tr>
            <th scope="col">Date</th>
              <th scope="col">Name</th>
              <th scope="col">Quantity</th>
              <th scope="col">Price</th>
              <th scope="col">Cancel</th>
          </tr>
        </thead>
        <tbody>

            <!-- Product will be displayed here. -->
			<%
			if(orders != null){
				for(OrderBean o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						
						<td><%=o.getQunatity() %></td>
						<td><%=dcf.format(o.getPrice()) %></td>
						<td><a class="btn btn-sm btn-danger" href="/JavaWebApplication/cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
					</tr>
				<%}
			}
			%>
         </tbody>
        </table>
        
        
	</div>
	
	
 <div style="position: absolute; bottom: 0;" class="footer">
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