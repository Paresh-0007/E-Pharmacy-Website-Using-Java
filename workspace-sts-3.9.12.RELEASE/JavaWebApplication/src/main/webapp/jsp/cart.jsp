<%@ page import="javaapplication.controller.JWAView" %>
<%@ page import="javawebapplication.bean.*" %>
<%@ page import="javawebapplication.model.ProductModel" %>
<%@ page import="javaapplication.controller.JWAView" %>
<%@ page import="java.util.*" %>
<%@ page import="javawebapplication.utility.JDBCDataSource" %>
<%@ page import="javawebapplication.bean.CartBean" %>
<%@page isELIgnored="false"%>

<!-- Session Creation -->

<%
String userSession = (String)request.getSession().getAttribute("fullname");
Long userSession2 = (Long)request.getSession().getAttribute("id");
ArrayList<CartBean> cart_list = (ArrayList<CartBean>) session.getAttribute("cart-list");
List<CartBean> cartProduct = null;
if (cart_list != null) {
	ProductModel pDao = new ProductModel(JDBCDataSource.getConnection());	
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cart Page</title>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/JavaWebApplication/css/style.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" 
          integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" 
          crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" 
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" 
          crossorigin="anonymous" referrerpolicy="no-referrer" media="screen" />
    <style>
        .flex-center {
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="header nav">
        <div class="logo">
            <a href="/JavaWebApplication/index.jsp">
                <img class="logo-img" src="/JavaWebApplication/image/logo.png" alt="MED24x7" />
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
        <li><a href="/JavaWebApplication/jsp/Order.jsp"><span>Your Orders</span></a></li>
        <li>
        <a href=<%= JWAView.LoginCTL+"?operation=logout" %>><span>Log Out</span></a>
        <%=session.getAttribute("fullname") %>
        </li>
        <%}%>
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

    <div class="bg-white w-full">
        <div class="main h-screen flex">
            <div class="main-section flex-1 p-6 bg-white">
                <h1 class="text-gray-400 text-3xl font-bold mb-6 select-none">Shopping Cart</h1>
                <table class="w-full">
                    <thead>
                        <tr>
                            <th class="text-left select-none">Product Details</th>
                            <th class="w-48 select-none">Quantity</th>
                            <th class="w-48 select-none">Cost per Unit</th>
                            <th class="w-10"></th>
			           </tr>
                    </thead>
                    <tbody>
                        <!-- Products in cart in for loop if user is logged in -->
   <%
   if(cart_list!=null){
	   for(CartBean c : cartProduct){%>
		   <tr class="cart-item">
		    <td class="text-left">
		        <div class="flex items-center">
		            <div class="cart-item-image w-40 h-24 bg-white p-4 rounded-lg select-none">
		                <img class="w-full h-full object-contain" src="<%=c.getImage()%>" alt="#" />
		            </div>
		            <div class="cart-item-detials flex-grow ml-4">
		                <div class="cart-item-title font-bold text-sm text-gray-600"><%=c.getName() %></div>
		                <div class="cart-item-brand text-sm text-gray-500"></div>
		            </div>
		        </div>
		    </td>
		    <td class="w-48 flex-center">
		        <form action="order-now" method="post" class="form-inline">
		            <input type="hidden" name="id" value="<%=c.getId() %>" class="form-input">
		            <a class="btn btn-sm btn-incre" href="/JavaWebApplication/quan-incre-decre?action=incre&id=<%=c.getId() %>"><i class="fas fa-plus-square"></i></a>
		            <input type="text" name="quantity" class="form-control" value="<%=c.getQuantity() %>" readonly style="width: 15px;">
		            <a class="btn btn-sm btn-decre" href="/JavaWebApplication/quan-incre-decre?action=decre&id=<%=c.getId() %>"><i class="fas fa-minus-square"></i></a>
		        </form>
		    </td>
		    <td class="w-48 font-bold text-gray-400 text-center">$<%=c.getPrice() %></td>
		    <td class="w-10 font-bold text-gray-300 cursor-pointer hover-text-gray-400 text-center">
		        <a href="/JavaWebApplication/remove?id=<%=c.getId() %>"><i class="fas fa-times"></i></a>
		    </td>
		</tr>
	  <% }
   }
   %>                     
                                                
                    </tbody>
                </table>
                <div class="complete-order flex justify-end mt-10">
                    <div class="total-cost mr-7">
                        <h1 class="text-gray-400 select-none">Total Cost</h1>
                        <div class="total-cost-number text-3xl text-gray-600 font-bold">
                       <!-- if cart iss empty it will print 0 else it will print total price of products in cart -->
                                          
         				<%if (cart_list != null) { %>
         				$ ${String.format("%.2f", total)}
            			<%} else {
               			out.print("$0");          			
         				}%>
                      
                        
</div>
                    </div>
                    <div class="complete-order-button w-56 flex-center bg-yellow-500 rounded text-white cursor-pointer hover-bg-yellow-600 select-none">
                        <a href="/JavaWebApplication/CheckoutCTL">Complete Order</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
