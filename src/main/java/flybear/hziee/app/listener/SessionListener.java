package flybear.hziee.app.listener;

import java.util.ArrayList;  
import java.util.HashSet;  
import javax.servlet.ServletContext;  
import javax.servlet.annotation.WebListener;  
import javax.servlet.http.HttpSession;  
import javax.servlet.http.HttpSessionEvent;  
import javax.servlet.http.HttpSessionListener;  
@WebListener  
public class SessionListener implements HttpSessionListener {  
    public void sessionCreated(HttpSessionEvent event) {  
         HttpSession session=event.getSession();  
         ServletContext context=session.getServletContext();  
        //用set集合来存储session对象  
         HashSet<HttpSession> sessionSet=(HashSet<HttpSession>) context.getAttribute("sessionSet");  
         if(sessionSet==null){  
             sessionSet=new HashSet<HttpSession>();  
             context.setAttribute("sessionSet", sessionSet);  
         }  
        //这里主要是为了检验用户是否登录，登录的话强制移除该session，加入新session  
         for(HttpSession s : sessionSet){  
             if(session.getAttribute("nickname")==s.getAttribute("nickname")){  
                 sessionSet.remove(s);  
             }  
         }  
         sessionSet.add(session);  
        //存储在线人数，利用了set集合不重复的特性，避免了重复登录  
         context.setAttribute("lineCount", sessionSet.size());  
           
    }  
  
    //session的销毁监听  
  public void sessionDestroyed(HttpSessionEvent event) {  
         ServletContext context = event.getSession().getServletContext();  
         if (context.getAttribute("lineCount") == null) {  
             context.setAttribute("lineCount", 0);  
         } else {  
             int lineCount = (Integer) context.getAttribute("lineCount");  
             if (lineCount < 1) {  
                 lineCount = 1;  
             }  
             context.setAttribute("lineCount", lineCount - 1);  
         }  
         HttpSession session = event.getSession();  
         HashSet<HttpSession> sessionSet = (HashSet<HttpSession>)context.getAttribute("sessionSet");  
         if(sessionSet!=null){  
             sessionSet.remove(session);  
         }  
    }  
}  