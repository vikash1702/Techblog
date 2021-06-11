package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Posts;
import com.tech.blog.helpers.ConnectionProvider;

public class PostDao {

	public static ArrayList<Category> getAllCategories(){
		ArrayList<Category> list = new ArrayList<>();
		
		Connection con = ConnectionProvider.getConnection();
		try {
			String q = "select * from categories";
			PreparedStatement ps = con.prepareStatement(q);
			 ResultSet rs= ps.executeQuery();
			 while(rs.next()) {
				 int cid = rs.getInt("cid");
				 String name = rs.getString("name");
				 String description = rs.getString("description");
				 Category c = new Category(cid,name,description);
				 list.add(c);
			 }
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}


	public static boolean savePost(Posts p) {
		boolean f = false;
		
		try {
		Connection con = ConnectionProvider.getConnection();
		
		String q = "insert into posts(ptitle,pcontent,pcode,ppic,catid,userid) values(?,?,?,?,?,?)";
		
		PreparedStatement ps= con.prepareStatement(q);
		
		ps.setString(1,p.getpTitle());
		ps.setString(2,p.getpContent());
		ps.setString(3,p.getpCode());
		ps.setString(4,p.getpPic());
		ps.setInt(5,p.getCatid());
		ps.setInt(6,p.getUserid());
		
		ps.executeUpdate();
		 f=true;
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return f;
	}

	public List<Posts> getAllPost(){
		List<Posts> list = new ArrayList<>();
		
		try {
			Connection con = ConnectionProvider.getConnection();
			String q = "select * from posts";
			PreparedStatement ps = con.prepareStatement(q);
			 ResultSet rs= ps.executeQuery();
			 while(rs.next()) {
				 int pid = rs.getInt("pid");
				 String ptitle = rs.getString("ptitle");
				 String pcontent = rs.getString("pcontent");
				 String pcode = rs.getString("pcode");
				 String ppic = rs.getString("ppic");
				 Date pdate = rs.getDate("pdate");
				 int catid = rs.getInt("catid");
				 int userid = rs.getInt("userid");
				 Posts post = new Posts(pid,ptitle,pcontent,pcode,ppic,pdate,catid,userid);
				 list.add(post);
			 }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	public List<Posts> getPostByCid(int cid){
		List<Posts> list = new ArrayList<>();
		
		try {
			Connection con = ConnectionProvider.getConnection();
			String q = "select * from posts where CatId=?";
			PreparedStatement ps = con.prepareStatement(q);
			ps.setInt(1, cid);
			 ResultSet rs= ps.executeQuery();
			 while(rs.next()) {
				 int pid = rs.getInt("pid");
				 String ptitle = rs.getString("ptitle");
				 String pcontent = rs.getString("pcontent");
				 String pcode = rs.getString("pcode");
				 String ppic = rs.getString("ppic");
				 Date pdate = rs.getDate("pdate");
				
				 int userid = rs.getInt("userid");
				 Posts post = new Posts(pid,ptitle,pcontent,pcode,ppic,pdate,userid);
				 list.add(post);
			 }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}



	public Posts getPostByPid(int pid) {
		Posts post = null;
		
		try {
			Connection con = ConnectionProvider.getConnection();
			String q = "select * from posts where Pid=?";
			PreparedStatement ps = con.prepareStatement(q);
			ps.setInt(1, pid);
			 ResultSet rs= ps.executeQuery();
			 while(rs.next()) {
				 int Postid = rs.getInt("pid");
				 String ptitle = rs.getString("ptitle");
				 String pcontent = rs.getString("pcontent");
				 String pcode = rs.getString("pcode");
				 String ppic = rs.getString("ppic");
				 Date pdate = rs.getDate("pdate");
				int cid = rs.getInt("catid");
				 int userid = rs.getInt("userid");
				 post = new Posts(Postid,ptitle,pcontent,pcode,ppic,pdate,cid,userid);
			 }
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return post;
	}
}