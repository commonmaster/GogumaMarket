package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.stone.springmvc.presentation.게시물관리컨트롤러;
import com.stone.springmvc.service.게시물관리;
import com.stone.springmvc.dataservice.*;;

@Configuration
public class BeanConfig {
	@Bean
	public 게시물관리컨트롤러 게시물관리컨트롤러( ) {//@Controller
		return new 게시물관리컨트롤러( );
	}
	@Bean
	public 게시물관리 게시물관리( ) {//@Service
		return new 게시물관리( );
	}
	@Bean
	public 게시물DAO 게시물DAO( ) {//@Repository
		return new 게시물DAO( );
	}	
}
