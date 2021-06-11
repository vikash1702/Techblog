package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.tech.blog.helpers.ConnectionProvider;


public class LikeDao {

	public boolean insertLike(int pid, int userid) {
		boolean f = false;
		try {
			Connection con = ConnectionProvider.getConnection();
			
			String q = "insert into liketable(pid,userid)values(?,?)";
			PreparedStatement p = con.prepareStatement(q);
			p.setInt(1, pid);
			p.setInt(2, userid);
			p.executeUpdate();
			f=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}

	public int countLike(int pid) {
		int count = 0;
		try {
			Connection con = ConnectionProvider.getConnection();
			
			String q = "select count(*) from liketable where pid = ?";
			
			PreparedStatement p = con.prepareStatement(q);
			p.setInt(1, pid);
			ResultSet set = p.executeQuery();
			if(set.next()) {
				count = set.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public boolean isLikedByUser(int pid,int userid) {
		boolean f = false;
		
		try {
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement p = con.prepareStatement("select * from liketable where pid = ? and userid = ?");
			p.setInt(1, pid);
			p.setInt(2, userid);
			ResultSet set = p.executeQuery();
			if(set.next()) {
				f = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean deleteLike(int pid,int userid) {
boolean f = false;
		
		try {
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement p = con.prepareStatement("delete from liketable where pid = ? and userid = ?");
			p.setInt(1, pid);
			p.setInt(2, userid);
			p.executeUpdate();
			f = true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
}
