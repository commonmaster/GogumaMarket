package config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import env.로그인확인자;

@Import(value={MyBatisConfig.class})
@Configuration
@EnableWebMvc
@ComponentScan(basePackages="com.stone")
public class MvcConfig implements WebMvcConfigurer {

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/views/",".jsp");
	
	}
	
	@Override 
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		/* '/js/**'로 호출하는 자원은 '/js/' 폴더 아래에서 찾는다. */ 
        registry.addResourceHandler("/js/**").addResourceLocations("/js/");
		/* '/css/**'로 호출하는 자원은 '/css/' 폴더 아래에서 찾는다. */ 
        registry.addResourceHandler("/css/**").addResourceLocations("/css/");
		/* '/img/**'로 호출하는 자원은 '/img/' 폴더 아래에서 찾는다. */ 
        registry.addResourceHandler("/img/**").addResourceLocations("/img/");
		/* '/font/**'로 호출하는 자원은 '/font/' 폴더 아래에서 찾는다. */ 
        registry.addResourceHandler("/font/**").addResourceLocations("/font/"); 
        
        registry.addResourceHandler("/assets/**").addResourceLocations("/assets/"); 
        
        registry.addResourceHandler("/board_detail/assets/**").addResourceLocations("/assets/"); 
        
        registry.addResourceHandler("/products/assets/**").addResourceLocations("/assets/");
        
        registry.addResourceHandler("/product_detail/assets/**").addResourceLocations("/assets/");
        
        registry.addResourceHandler("/mproduct_detail/assets/**").addResourceLocations("/assets/");
        
        
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(new 로그인확인자())
				.addPathPatterns("/**")
				.excludePathPatterns("/main")				
				.excludePathPatterns("/login")
				.excludePathPatterns("/logout")
				.excludePathPatterns("/join")
				.excludePathPatterns("/duplication")
				.excludePathPatterns("/boards")
				.excludePathPatterns("/board_detail/**")
				.excludePathPatterns("/products")
				.excludePathPatterns("/product_detail/**")
				.excludePathPatterns("/img/**")
				.excludePathPatterns("/css/**")
				.excludePathPatterns("/assets/**")
				.excludePathPatterns("/board_detail/assets/**")
				.excludePathPatterns("/product_detail/assets/**")
				.excludePathPatterns("/mproduct_detail/assets/**")
				.excludePathPatterns("/profile/**")						
				.excludePathPatterns("/picture/**");
				
	}
	
}
