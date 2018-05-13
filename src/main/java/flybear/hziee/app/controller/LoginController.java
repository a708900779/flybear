package flybear.hziee.app.controller;

import java.io.*;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import flybear.hziee.app.service.ActivityService;
import flybear.hziee.app.service.StudentService;
import flybear.hziee.app.util.UIUtils;
import flybear.hziee.app.model.Activity;
import flybear.hziee.app.model.Student;
import flybear.hziee.core.base.BaseController;
import flybear.hziee.app.util.FileUtil;
import flybear.hziee.app.util.MD5String;
import flybear.hziee.app.util.StringUtil;
import flybear.hziee.app.util.UIUtils;
import flybear.hziee.core.sql.Row;
import flybear.hziee.core.util.UploadUtils;

/**
*控制器
*
*/
@Controller
@RequestMapping("login")
public class LoginController extends BaseController{

	@Autowired
	private StudentService studentService;

	@RequestMapping(value={"logining"})
	public String logining(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception {
		if (request.getMethod().equals("POST")) {
			String loginName = request.getParameter("student_id");
			String loginPwd = request.getParameter("password");
			if (studentService.checkLogin(loginName, loginPwd)) {
				//实现在线人数的统计
				 HttpSession session = request.getSession(); 
	             session.setAttribute("nickname", studentService.getByStudentId(Integer.valueOf(loginName)));  //将用户名存入session  
	             ServletContext context = session.getServletContext();  
	             //将在线人数存入session  
	             request.getSession().setAttribute("onnum", context.getAttribute("lineCount"));
	             System.out.println("在线人数："+context.getAttribute("lineCount")); 
				
				
				
				
				return ajaxReturn(response, null, "登录成功", 1);
			} else
				return ajaxReturn(response, null, "账号或密码错误", 0);
		} else {
			return "public/login";
		}
	}	


	@RequestMapping(value={"/"})
	public String login(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception {
		
			return "login/login";
		
	}	
	
	
}

