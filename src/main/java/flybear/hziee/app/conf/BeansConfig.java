package flybear.hziee.app.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import flybear.hziee.core.base.ExceptionHandler;
import flybear.hziee.core.base.MyMultipartResolver;
import flybear.hziee.core.util.SpringContextUtil;

@Configuration
public class BeansConfig {

	@Bean
	public SpringContextUtil springContextUtil(){
		System.out.println("springContextUtil....");
		return new SpringContextUtil();
	}
	
	@Bean
	public ExceptionHandler exceptionHandler(){
		System.out.println("ExceptionHandler.....");
		return new ExceptionHandler();
	}
}
