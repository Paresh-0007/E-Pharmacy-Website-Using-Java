package javaapplication.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javawebapplication.bean.CartBean;

/**
 * Servlet implementation class Quantity_Incre_DecreCTL
 */
public class Quantity_Incre_DecreCTL extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String action = request.getParameter("action");
			int id = Integer.parseInt(request.getParameter("id"));
			ArrayList<CartBean> cart_list = (ArrayList<CartBean>) request.getSession().getAttribute("cart-list");

			if (action != null && id >= 1) {
				if (action.equals("incre")) {
					for (CartBean c : cart_list) {
						if (c.getId() == id) {
							int quantity = c.getQuantity();
							quantity++;
							c.setQuantity(quantity);
							response.sendRedirect("/JavaWebApplication/jsp/cart.jsp");
						}
					}
				}

				if (action.equals("decre")) {
					for (CartBean c : cart_list) {
						if (c.getId() == id && c.getQuantity() > 1) {
							int quantity = c.getQuantity();
							quantity--;
							c.setQuantity(quantity);
							break;
						}
					}
					response.sendRedirect("/JavaWebApplication/jsp/cart.jsp");
				}
			} else {
				response.sendRedirect("/JavaWebApplication/jsp/cart.jsp");
			}
	}

}
}