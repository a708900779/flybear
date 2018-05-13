package flybear.hziee.app.controller;

import java.util.ArrayList;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;

import flybear.hziee.app.model.User;
import flybear.hziee.app.service.RoleService;
import flybear.hziee.app.service.UserService;
import flybear.hziee.app.util.MD5String;
import flybear.hziee.core.base.BaseController;
import flybear.hziee.core.sql.Row;
import flybear.hziee.core.util.UploadUtils;

/**
 * 公共控制器
 */
@Controller
@RequestMapping(value = { "public" })
public class PublicController extends BaseController {

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String upload(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("imgFile") MultipartFile picWebFile) {
		System.out.println("upload");
		Map<String, Object> data = new HashMap<String, Object>();
		String picWeb = ""; // 图片保存名
		System.out.println("aaa");
		Map<String, Object> picWebInfo = UploadUtils
				.saveMultipartFile(picWebFile);
		System.out.println("bbb");
		if ((Integer) picWebInfo.get("status") > 0) { // 上传完成
			picWeb = UploadUtils.parseFileUrl(picWebInfo.get("saveName")
					.toString());
		} else { // 上传出错
			return ajaxReturn(response, null, picWebInfo.get("errorMsg")
					.toString(), 0);
		}
		data.put("url", picWeb);
		data.put("alt", "");
		return ajaxReturn(response, data, null, 1);
	}

	/**
	 * 登录
	 */
	@RequestMapping(value = { "login" })
	public String login(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		if (request.getMethod().equals("POST")) {
			String loginName = request.getParameter("loginName");
			String loginPwd = request.getParameter("loginPass");
			if (userService.checkLogin(loginName, MD5String.getMD5Str(loginPwd))) {
				Row user = userService.Userinfo(loginName, MD5String.getMD5Str(loginPwd));
				int roleId = user.getInt("roleId");
				request.getSession().setAttribute("userinfo", user);
				request.getSession().setAttribute("loginName", loginName);// 登录成功放入session的内容，供前端页面访问
				request.getSession().setAttribute("roleId",roleId);
				request.getSession().setAttribute("roleName",roleService.findById(roleId).getName());
				
				//实现在线人数的统计
				 HttpSession session = request.getSession();     
	            session.setAttribute("nickname", loginName);  //将用户名存入session  
	             ServletContext context = session.getServletContext();  
	             //打印在线人数  
	             System.out.println("在线人数："+context.getAttribute("lineCount")); 
				
				
				
				
				return ajaxReturn(response, null, "登录成功", 1);
			} else
				return ajaxReturn(response, null, "账号或密码错误", 0);
		} else {
			return "public/login";
		}
	}


	@RequestMapping(value = { "logout" })
	public String logout(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		Enumeration<String> em = request.getSession().getAttributeNames();
		// System.out.println(request.getSession().getAttributeNames());
		while (em.hasMoreElements()) {
			request.getSession().removeAttribute(em.nextElement());
		}
		request.getSession().invalidate();
		return "redirect:/public/login";
	}
	
	
	
	
	
	
	
	
	
/*	@RequestMapping(value={"department_list"})
	public String departmentList(Model model,HttpServletRequest request,HttpServletResponse response,Integer areaId) {
		if(request.getMethod().equals("POST")){
			List<Row> list = new ArrayList<Row>();
			if(areaId!=null){
			    Map<String,Object> where =  new HashMap<String,Object>();
			    where.put("area_id", areaId);
			    list = departmentService.getDepartmentList(where);
			}
			if("combo".equals(request.getParameter("ui"))){
				Row row = new Row();
				row.put("id", null);
				row.put("text", "--不限--");
				list.add(0,row);
			}
			return ajaxReturn(response, list);
		}
		else   return "public/department_list";
	}*/
	
	
	/*@RequestMapping(value={"duties_list"})
	public String dutiesList(Model model,HttpServletRequest request,HttpServletResponse response) {
		if(request.getMethod().equals("POST")){
			List<Row> list = new ArrayList<Row>();
			list = dutiesService.getDutiesList(null);
			if("query".equals(request.getParameter("ui"))){
				Row row = new Row();
				row.put("id", null);
				row.put("text", "--不限--");
				list.add(0,row);
			}
			return ajaxReturn(response, list);
		}
		else   return "public/duties_list";
	}*/
	
	@RequestMapping(value = { "role_list" })
	public String rolelists(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		if(request.getMethod().equals("POST")){
			List<Row> list = new ArrayList<Row>();
			list = roleService.getRoleLists(null);
			if("query".equals(request.getParameter("ui"))){
				Row row = new Row();
				row.put("id", null);
				row.put("text", "--不限--");
				list.add(0,row);
			}
			return ajaxReturn(response, list);
		}
		else   return "public/role_list";
	}
}
