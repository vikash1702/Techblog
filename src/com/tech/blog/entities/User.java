package com.tech.blog.entities;

import java.sql.Timestamp;

public class User {
	private int id;
       
	private String name;
       private String email;
       private String password;
       private String gender;
       private String picture;
       private String about;
       private Timestamp date;
       
       
       
	public User(int id,String name, String email, String password, String gender, String picture,String about,Timestamp date) {
		super();
		this.id= id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.picture = picture;
		this.about = about;
		this.date = date;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}


	public User(String name, String email, String password, String gender,String about) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
	}

	public User(int id,String name, String email, String password, String gender,String about,String picture) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
		this.picture = picture;
	}

	public String getPicture() {
		return picture;
	}


	public void setPicture(String picture) {
		this.picture = picture;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}
    
       
       
}
