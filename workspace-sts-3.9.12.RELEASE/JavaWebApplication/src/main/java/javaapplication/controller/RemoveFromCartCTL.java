package javaapplication.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javawebapplication.bean.CartBean;

/**
 * Servlet implementation class RemoveFromCartCTL
 */
public class RemoveFromCartCTL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String bookId = request.getParameter("id");
			if (bookId != null) {
				ArrayList<CartBean> cart_list = (ArrayList<CartBean>) request.getSession().getAttribute("cart-list");
				if (cart_list != null) {
					for (CartBean c : cart_list) {
						if (c.getId() == Integer.parseInt(bookId)) {
							cart_list.remove(cart_list.indexOf(c));
							break;
						}
					}
				}
				response.sendRedirect("/JavaWebApplication/jsp/cart.jsp");

			} else {
				response.sendRedirect("/JavaWebApplication/jsp/cart.jsp");
			}

		}
	}

}
