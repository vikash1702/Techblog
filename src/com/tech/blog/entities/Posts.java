package com.tech.blog.entities;

import java.util.Date;

public class Posts {

	private int pid;
	private String pTitle;
	private String pContent;
	private String pCode;
	private String pPic;
	private Date date;
	private int catid;
	private int userid;
	
	
	public Posts() {
		super();
	}


	public Posts(int pid, String pTitle, String pContent, String pCode, String pPic, Date date, int catid, int userid) {
		super();
		this.pid = pid;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.date = date;
		this.catid = catid;
		this.userid = userid;
	}
	
	public Posts(int pid, String pTitle, String pContent, String pCode, String pPic, Date date, int userid) {
		super();
		this.pid = pid;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.date = date;
		
		this.userid = userid;
	}


	public Posts(String pTitle, String pContent, String pCode, String pPic, Date date, int catid, int userid) {
		super();
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.date = date;
		this.catid = catid;
		this.userid = userid;
	}


	public int getUserid() {
		return userid;
	}


	public void setUserid(int userid) {
		this.userid = userid;
	}


	public int getPid() {
		return pid;
	}


	public void setPid(int pid) {
		this.pid = pid;
	}


	public String getpTitle() {
		return pTitle;
	}


	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}


	public String getpContent() {
		return pContent;
	}


	public void setpContent(String pContent) {
		this.pContent = pContent;
	}


	public String getpCode() {
		return pCode;
	}


	public void setpCode(String pCode) {
		this.pCode = pCode;
	}


	public String getpPic() {
		return pPic;
	}


	public void setpPic(String pPic) {
		this.pPic = pPic;
	}


	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}


	public int getCatid() {
		return catid;
	}


	public void setCatid(int catid) {
		this.catid = catid;
	}
	
	
	
}
