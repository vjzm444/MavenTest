package com.nemew.blog.post.model;
/**
 * @FileName : Search.java
 * @Project : MavenTest
 * @Date : 2019. 12. 24. 
 * @작성자 : song
 * @변경이력 : 20191231 송현주: 현재는 안씀...근데 나중에 검색기능 추가할때는 써야지...
 * @프로그램 설명 : 검색용 bean용으로 만들어 놓음
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
