package com.nemew.blog.post.model;
/**
 * @FileName : Search.java
 * @Project : MavenTest
 * @Date : 2019. 12. 10. 
 * @작성자 : 송현주
 * @변경이력 :
 * @프로그램 설명 :
 */
import org.apache.ibatis.type.Alias;

@Alias("search")
public class Search {
	
	private String searchType;
	private String keyword;	//조회 할 키워드

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}	
	
	

}
