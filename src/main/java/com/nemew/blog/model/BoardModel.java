package com.nemew.blog.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("boardModel")
public class BoardModel {
	private int id;
	private String title;
	private String content;
	private String phone;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	
	
	
	
}