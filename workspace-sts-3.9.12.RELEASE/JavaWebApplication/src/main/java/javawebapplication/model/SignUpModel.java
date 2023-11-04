package javawebapplication.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javawebapplication.bean.SignUpBean;
import javawebapplication.utility.JDBCDataSource;

public class SignUpModel {
  
  public static long nextPk() {
    long pk = 0;
    Connection conn;
    try {
      conn = JDBCDataSource.getConnection();
      PreparedStatement stmt = conn.prepareStatement("select Max(id) from user");
      ResultSet rs = stmt.executeQuery();
      while(rs.next()){
        pk = rs.getLong(1);
      }
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return pk+1;
    
  }
  
  
  public static long addUser(SignUpBean user) {
    int i = 0;
    try {
      Connection conn = JDBCDataSource.getConnection();
      PreparedStatement stmt = conn.prepareStatement("insert into user values(?,?,?,?,?,?,?)");
      stmt.setLong(1, nextPk());
      stmt.setString(2 , user.getFullname() );
      stmt.setString(3 , user.getEmail() );
      stmt.setString(4 , user.getPassword() );
      stmt.setString(5 , user.getCpassword() );
      stmt.setString(6 , user.getMobileNo() );
      stmt.setString(7, user.getUsertype());
        i = 	stmt.executeUpdate();
      
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    
    
    return i;
  }

  
  public static SignUpBean UserLogin(String email,String password) {
	    Connection con;
	    SignUpBean user = null;
	    try {
	      con = JDBCDataSource.getConnection();
	      PreparedStatement stmt = con.prepareStatement("Select * from user where email=? and password = ?");
	      stmt.setString(1,email);
	      stmt.setString(2,password);
	      ResultSet rs = stmt.executeQuery();
	      if(rs.next()) {
	        user = new SignUpBean();
	        System.out.println("ID: "+rs.getLong("id"));
	        user.setId(rs.getLong("id"));
	        user.setFullname(rs.getString("fullname"));
	        user.setEmail(rs.getString("email"));
	        user.setPassword(rs.getString("password"));
	        user.setMobileNo(rs.getString("mobileNo"));
	        user.setUsertype(rs.getString("usertype"));
	      }
	      
	    } catch (Exception e) {
	      // TODO Auto-generated catch block
	      e.printStackTrace();
	    }
	    
	    return user;
	  }
  
  public static List list() {
	  ArrayList list=new ArrayList();
	  Connection conn=null;
	  try {
	     conn=JDBCDataSource.getConnection();
	    PreparedStatement pstmt=conn.prepareStatement("Select id,fullname,email,password,mobileno from user");
	    ResultSet rs= pstmt.executeQuery();
	    while (rs.next()) {
	    SignUpBean user=new SignUpBean();
	    user.setId(rs.getLong("id"));
	    user.setFullname(rs.getString("fullname"));
	    user.setEmail(rs.getString("email"));
	    user.setPassword(rs.getString("password"));
	    user.setMobileNo(rs.getString("mobileno"));
	    list.add(user);
	    }
	  } catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	  }finally {
	    JDBCDataSource.closeConnection(conn);
	  }
	  return list;
	}
  
}