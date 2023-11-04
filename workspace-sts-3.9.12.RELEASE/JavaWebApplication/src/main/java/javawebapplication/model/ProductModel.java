package javawebapplication.model;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javawebapplication.bean.*;

public class ProductModel {
	
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public ProductModel(Connection con) {
		super();
		this.con = con;
	}

	public List<ProductBean> getAllProducts(){
		List<ProductBean> products = new ArrayList<ProductBean>();
		
		try {
		query = "select * from products";
		pst = this.con.prepareStatement(query);
		rs = pst.executeQuery();
		
		while(rs.next()) {
			ProductBean row = new ProductBean();
			row.setId(rs.getInt("id"));
			row.setName(rs.getString("name"));
			row.setCategory(rs.getString("category"));
			row.setPrice(rs.getDouble("price"));
			row.setDprice(rs.getDouble("dprice"));
			row.setDescription(rs.getString("description"));
			row.setDiscount(rs.getString("discount"));
			row.setImage(rs.getString("image"));
			products.add(row);
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return products;
	}
	
	
	public List<CartBean> getCartProducts(ArrayList<CartBean> cartList) {
        List<CartBean> book = new ArrayList<>();
        try {
            if (cartList.size() > 0) {
                for (CartBean item : cartList) {
                    query = "select * from products where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        CartBean row = new CartBean();
                        row.setId(rs.getInt("id"));
                        row.setName(rs.getString("name"));
                        row.setImage(rs.getString("image"));
                        row.setCategory(rs.getString("category"));
                        row.setPrice(rs.getDouble("price"));
                        row.setQuantity(item.getQuantity());
                        book.add(row);
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }
	
	public double getTotalCartPrice(ArrayList<CartBean> cartList) {
        double sum = 0;
        try {
            if (cartList.size() > 0) {
                for (CartBean item : cartList) {
                    query = "select price from products where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        sum+=rs.getDouble("price")*item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }
	
	public ProductBean getSingleProduct(int id) {
		 ProductBean row = null;
	        try {
	            query = "select * from products where id=? ";

	            pst = this.con.prepareStatement(query);
	            pst.setInt(1, id);
	            ResultSet rs = pst.executeQuery();

	            while (rs.next()) {
	            	row = new ProductBean();
	                row.setId(rs.getInt("id"));
	                row.setName(rs.getString("name"));
	                row.setCategory(rs.getString("category"));
	                row.setPrice(rs.getDouble("price"));
	                row.setImage(rs.getString("image"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }

	        return row;
	    }
}