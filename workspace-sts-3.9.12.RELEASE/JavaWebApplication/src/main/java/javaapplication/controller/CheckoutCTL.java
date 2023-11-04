package javaapplication.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javawebapplication.bean.CartBean;
import javawebapplication.bean.OrderBean;
import javawebapplication.model.OrderModel;
import javawebapplication.utility.JDBCDataSource;

/**
 * Servlet implementation class CheckOutCTL
 */
public class CheckoutCTL extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try(PrintWriter out = response.getWriter()){
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
			ArrayList<CartBean> cart_list = (ArrayList<CartBean>) request.getSession().getAttribute("cart-list");
			Long userSession2 = (Long)request.getSession().getAttribute("id");
			if(cart_list != null && userSession2!=null) {
				for(CartBean c:cart_list) {
					OrderBean order = new OrderBean();
					order.setId(c.getId());
					order.setUid(userSession2);
					order.setQunatity(c.getQuantity());
					order.setDate(formatter.format(date));
					
					OrderModel oDao = new OrderModel(JDBCDataSource.getConnection());
					boolean result = oDao.insertOrder(order);
					if(!result) break;
				}
				cart_list.clear();
				response.sendRedirect("/JavaWebApplication/jsp/Order.jsp");
			}else {
				if(userSession2==null) {
					response.sendRedirect("/JavaWebApplication/jsp/Login.jsp");
					
				}
				response.sendRedirect("/JavaWebApplication/jsp/cart.jsp");
			}
		} catch (ClassNotFoundException|SQLException e) {
			
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
