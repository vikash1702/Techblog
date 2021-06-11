package com.tech.blog.dao;

import java.sql.*;

import com.tech.blog.entities.User;
import com.tech.blog.helpers.ConnectionProvider;
public class UserDao {
  

  public static String saveUser(User user) {
  try {
	   Connection conn = ConnectionProvider.getConnection();
	  
	  String query = "insert into user_(name,email,password,gender,about) values(?,?,?,?,?)";
	  PreparedStatement ps = conn.prepareStatement(query);
	  ps.setString(1,user.getName());
	  ps.setString(2,user.getEmail());
	  ps.setString(3,user.getPassword());
	  ps.setString(4,user.getGender());
	  ps.setString(5,user.getAbout());
	  ps.executeUpdate();
	 
	  
  }catch(Exception e) {
	  e.printStackTrace();
  }
  return "done";
  }
  
  public static int updateUser(User user) {
	  
	  
	  int reffect =0;
	  try {
		  Connection conn = ConnectionProvider.getConnection();
		  
		  String query = "update user_ set name=?,email=?,password=?,gender=?,about=?,picture=? where userid=?";
		  PreparedStatement ps = conn.prepareStatement(query);
		  ps.setString(1,user.getName());
		  ps.setString(2,user.getEmail());
		  ps.setString(3,user.getPassword());
		  ps.setString(4,user.getGender());
		  ps.setString(5,user.getAbout());
		  ps.setString(6,user.getPicture());
		  ps.setInt(7,user.getId());
		 reffect =  ps.executeUpdate();
		 
		  
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  return reffect;
  }
  
  public User getUserbyEmail(String email,String password) {
	  User user = null;
	  try {
		   Connection conn = ConnectionProvider.getConnection();
		  
		  String query = "select * from user_ where email=? and password=?";
		  PreparedStatement ps = conn.prepareStatement(query);
		  ps.setString(1,email);
		  ps.setString(2,password);
		 ResultSet rs= ps.executeQuery();
		 if(rs.next()) {
			 user = new User();
			 user.setId(rs.getInt("userid"));
			 user.setName(rs.getString("name"));
			 user.setEmail(rs.getString("email"));
			 user.setPassword(rs.getString("password"));
			 user.setGender(rs.getString("gender"));
			 user.setPicture(rs.getString("picture"));
			 user.setAbout(rs.getString("about"));
			 user.setDate(rs.getTimestamp("register_date"));
		 }
		  
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  return user;
  }
  
  public User getUserbyUserId(int userid) {
	  User user = null;
	  try {
		   Connection conn = ConnectionProvider.getConnection();
		  
		  String query = "select * from user_ where userid = ?";
		  PreparedStatement ps = conn.prepareStatement(query);
		  ps.setInt(1,userid);
		  
		 ResultSet rs= ps.executeQuery();
		 if(rs.next()) {
			 user = new User();
			 user.setId(rs.getInt("userid"));
			 user.setName(rs.getString("name"));
			 user.setEmail(rs.getString("email"));
			 user.setPassword(rs.getString("password"));
			 user.setGender(rs.getString("gender"));
			 user.setPicture(rs.getString("picture"));
			 user.setAbout(rs.getString("about"));
			 user.setDate(rs.getTimestamp("register_date"));
		 }
		  
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  return user;
  }
  }
  

