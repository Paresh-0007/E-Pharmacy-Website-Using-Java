package javawebapplication.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javawebapplication.bean.*;

public class OrderModel {
	
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
    

	public OrderModel(Connection con) {
		super();
		this.con = con;
	}

	public boolean insertOrder(OrderBean model) {
        boolean result = false;
        try {
            query = "insert into orders (p_id, u_id, o_quantity, o_date) values(?,?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, model.getId());
            pst.setLong(2, model.getUid());
            pst.setInt(3, model.getQunatity());
            pst.setString(4, model.getDate());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }
	

    public List<OrderBean> userOrders(long id) {
        List<OrderBean> list = new ArrayList<>();
        try {
            query = "select * from orders where u_id=? order by orders.o_id desc";
            pst = this.con.prepareStatement(query);
            pst.setLong(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                OrderBean order = new OrderBean();
                ProductModel productDao = new ProductModel(this.con);
                int pId = rs.getInt("p_id");
                ProductBean product = productDao.getSingleProduct(pId);
                order.setOrderId(rs.getLong("o_id"));
                order.setId(pId);
                order.setName(product.getName());
                order.setCategory(product.getCategory());
                order.setPrice(product.getPrice()*rs.getInt("o_quantity"));
                order.setQunatity(rs.getInt("o_quantity"));
                order.setDate(rs.getString("o_date"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }

    public void cancelOrder(long l) {
        //boolean result = false;
        try {
            query = "delete from orders where o_id=?";
            pst = this.con.prepareStatement(query);
            pst.setLong(1, l);
            pst.execute();
            //result = true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        //return result;
    }
}