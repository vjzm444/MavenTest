package com.nemew.blog.config;
/**
 * @FileName : DataSourceConfig.java
 * @Project : MavenTest
 * @Date : 2019. 12. 24. 
 * @작성자 : song
 * @변경이력 : 
 * @프로그램 설명 : 이건 뭔지...그냥 스프링부트의 기본설정인거같음
 */
import javax.sql.DataSource;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DataSourceConfig {

	@ConfigurationProperties(prefix="spring.datasource")
	public DataSource dataSource(){
    	return DataSourceBuilder.create().build();
	}
}