package javawebapplication.model;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
			row.setPrice(rs.getString("price"));
			row.setImage(rs.getString("image"));
			
			products.add(row);
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return products;
	}
}