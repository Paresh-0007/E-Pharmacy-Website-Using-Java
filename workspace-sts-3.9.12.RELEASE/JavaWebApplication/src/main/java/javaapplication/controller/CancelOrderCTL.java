package javaapplication.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javawebapplication.model.OrderModel;
import javawebapplication.utility.JDBCDataSource;

public class CancelOrderCTL extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()) {
			String id = request.getParameter("id");
			if(id != null) {
				OrderModel orderDao = new OrderModel(JDBCDataSource.getConnection());
				orderDao.cancelOrder(Long.parseLong(id));
			}
			response.sendRedirect("/JavaWebApplication/jsp/Order.jsp");
		} catch (ClassNotFoundException|SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}

}
