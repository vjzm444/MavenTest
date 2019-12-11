package com.nemew.blog.post.model;
/**
 * @FileName : BoardModel.java
 * @Project : MavenTest
 * @Date : 2019. 12. 10. 
 * @작성자 : 송현주
 * @변경이력 :
 * @프로그램 설명 :
 */
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("boardModel")
public class BoardModel {
	
	public int id;
	public String title;
	public String content;
	public String phone;
	public String reg_date;
	
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
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	
	
	
	
}