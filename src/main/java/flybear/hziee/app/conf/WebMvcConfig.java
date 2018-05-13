package flybear.hziee.app.conf;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import flybear.hziee.app.interceptor.CoreInterceptor;
import flybear.hziee.core.base.BaseInterceptor;

@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {
	
	@Value("${FILE_REPOSITORY}")
	private String FILE_REPOSITORY;
	
	@Value("${FILE_PATH_PATTERN}")
	private String FILE_PATH_PATTERN;
	
	public final static String SESSION_KEY = "user";
	
	@Bean
    public SecurityInterceptor getSecurityInterceptor() {
        return new SecurityInterceptor();
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
    	registry.addResourceHandler("/static/**").addResourceLocations("/static/");
       // String FILE_REPOSITORY = UploadUtils.getConfig("FILE_REPOSITORY");
        if(!FILE_REPOSITORY.endsWith(File.separator))
        	FILE_REPOSITORY += File.separator;
        registry.addResourceHandler(FILE_PATH_PATTERN+"/**").addResourceLocations("file:"+FILE_REPOSITORY);
        super.addResourceHandlers(registry);
    }
    
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new BaseInterceptor()).addPathPatterns("/**");  
        registry.addInterceptor(new CoreInterceptor()).addPathPatterns("/**").excludePathPatterns("/public","/static",FILE_PATH_PATTERN);
       // registry.addInterceptor(getSecurityInterceptor()).addPathPatterns("/**");  
        super.addInterceptors(registry);
    }
    
    private class SecurityInterceptor extends HandlerInterceptorAdapter {

        @Override
        public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
                throws Exception {
            HttpSession session = request.getSession();
            if (session.getAttribute(SESSION_KEY) != null)
                return true;

            // 跳转登录
            String url = "/login";
            response.sendRedirect(url);
            return false;
        }
    }
}
