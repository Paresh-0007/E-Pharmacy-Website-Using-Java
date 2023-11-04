package javaapplication.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javawebapplication.bean.*;;


@WebServlet(name= "AddToCartCTL", urlPatterns = {"/AddToCartCTL"})
public class AddToCartCTL extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
//        	out.print("add to cart servlet");

            ArrayList<CartBean> cartList = new ArrayList<>();
            int id = Integer.parseInt(request.getParameter("id"));
            CartBean cm = new CartBean();
            cm.setId(id);
            cm.setQuantity(1);
            HttpSession session = request.getSession();
            ArrayList<CartBean> cart_list = (ArrayList<CartBean>) session.getAttribute("cart-list");
            if (cart_list == null) {
                cartList.add(cm);
                session.setAttribute("cart-list", cartList);
                response.sendRedirect("index.jsp");
                
            } else {
                cartList = cart_list;
                boolean exist = false;

                for (CartBean c : cart_list) {
                    if (c.getId() == id) {
                        exist = true;
                        out.println("<h3 style='color:crimson; text-align: center'>Item Already in Cart. <a href='/JavaWebApplication/jsp/cart.jsp'>Go to Cart Page</a></h3>");
                    }
                }
                if (!exist) {
                    cartList.add(cm);
                    response.sendRedirect("index.jsp");
                }
            }
        }
	}
}