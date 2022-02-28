package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;

@Configuration
public class BeanConfig {
	/*
	@Bean
	public 게시물관리컨트롤러 게시물관리컨트롤러( ) {//@Controller
		return new 게시물관리컨트롤러( );
	}*/	
	
	@Bean
	public StandardServletMultipartResolver multipartResolver() {
	    return new StandardServletMultipartResolver();
	}
}
