package flybear.hziee.app.interceptor;


import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


/**
 * 核心拦截器，配置request的一些初始值
 * @author Simon
 *
 */
public class CoreInterceptor implements HandlerInterceptor{
	
	/**
	 * 拦截器白名单列表
	 */
//	public String[] exclude; 
//	
//	public void setExclude(String[] exclude) {
//		this.exclude = exclude;
//	}
	
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
//		System.out.println("exclude:"+exclude.toString());
//		//白名单放行
//		if(exclude!=null && exclude.length!=0){
//			String uri = request.getRequestURI().substring(request.getContextPath().length());
//			for(String one:exclude){
//				if(uri.startsWith(one)){
//					return true;
//				}
//			}
//		}
		//解析url验证是否显示左侧
		String path = request.getServletPath();  
        //String[] str = path.split("/");
         //拦截地址清单, 如果请求中是以以下路径开头，则进行拦截
        String[] urls = {
       //		"/user","/dict","/admin"
        };
        
        System.out.println("拦截器:"+path);
        
		return true;
		
		
	}

	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}


}
