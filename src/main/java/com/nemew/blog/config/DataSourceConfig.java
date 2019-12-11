package com.nemew.blog.config;
/**
 * @FileName : DataSourceConfig.java
 * @Project : MavenTest
 * @Date : 2019. 12. 10. 
 * @작성자 : 송현주
 * @변경이력 :
 * @프로그램 설명 :
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