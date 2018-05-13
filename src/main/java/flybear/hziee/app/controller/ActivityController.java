package flybear.hziee.app.controller;

import java.io.*;


import java.text.ParseException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import flybear.hziee.app.service.ActivityService;
import flybear.hziee.app.util.UIUtils;
import flybear.hziee.app.model.Activity;
import flybear.hziee.core.base.BaseController;
import flybear.hziee.app.util.FileUtil;
import flybear.hziee.app.util.StringUtil;
import flybear.hziee.app.util.FormatDate;
import flybear.hziee.core.sql.Row;
import flybear.hziee.core.util.UploadUtils;

/**
*控制器
*
*/
@Controller
@RequestMapping("activity")
public class ActivityController extends BaseController{

	@Autowired
	private ActivityService activityService;

	@RequestMapping(value={"add"})
	public String add(Model model,HttpServletRequest request,HttpServletResponse response,Activity Activity) throws Exception {
		if (request.getMethod().equals("POST")) {
			int flag = activityService.save(Activity);
			if (flag == 1) {
				return ajaxReturn(response, null, "添加成功", 1);
			} else {
				return ajaxReturn(response, null, "添加失败", 0);
			}
		} else {
			return "activity/add";
		}
	}	

	@RequestMapping(value={"edit"})
	public String edit(Model model,HttpServletRequest request,HttpServletResponse response,Activity Activity) throws Exception {
		if (request.getMethod().equals("POST")) {
			if(Activity != null){
				activityService.update(Activity);
				return ajaxReturn(response, null, "修改成功", 1);
			}else{
				return ajaxReturn(response, null, "修改失败", 0);
			}
		}else{
			String id = request.getParameter("id");
			Activity entity = activityService.findById(Integer.valueOf(id));
			model.addAttribute("list", entity);
			return "activity/edit";
		}
		
	}
	

	@RequestMapping(value={"list"})
	public String list(Model model,HttpServletRequest request,HttpServletResponse response) {
		if(request.getMethod().equals("POST")){			
			Map<String, Object>	list = activityService.getUIGridData(null,UIUtils.getPageParams(request));
			return ajaxReturn(response,list);
		}
		else{
			return "activity/list";
		}
	}

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String delete(HttpServletRequest request,HttpServletResponse response,Integer id) throws Exception {
		int flag = activityService.delete(id);
		if (flag == 1) {
			return ajaxReturn(response, null, "删除成功", 1);
		} else {
			return ajaxReturn(response, null, "删除失败", 0);
		}
		
	}
	
	@RequestMapping(value={"find"})
	public String find(Model model,HttpServletRequest request,HttpServletResponse response
			,String key) throws UnsupportedEncodingException {
		if (!StringUtil.isEmpty(key)) {
			key = StringUtil.GBK(key);
		}
		if(request.getMethod().equals("POST")){
			return ajaxReturn(response, activityService.findUIGridData(key,UIUtils.getPageParams(request)));
		}else {
			return "activity/list";
		}
	}
	@RequestMapping(value={"index"})
	public String index(Model model,HttpServletRequest request,HttpServletResponse response) {
		String strPage = request.getParameter("page");
		int page = 1;
		int rows = 9;
		if(strPage!=null)
			page = Integer.parseInt(strPage);
		
		model.addAttribute("page",activityService.getList(page, rows));
		
		return "activity/index2";
	}
	@RequestMapping(value={"pp"})
	public String pp(Model model,HttpServletRequest request,HttpServletResponse response,String ac_id) {
			System.out.println("活动id："+ac_id);
			Activity a = activityService.findById(Integer.valueOf(ac_id));
			request.setAttribute("ac", a);
			
			return "activity/baoming";
	
	}
	
	
	
	
	@RequestMapping(value={"application"})
	public String application(Model model,HttpServletRequest request,HttpServletResponse response) {
		
			return "activity/application";
	
	}
	@RequestMapping(value={"applying"})
	public String applying(@RequestParam("file") MultipartFile file,Model model,HttpServletRequest request,HttpServletResponse response,Activity Activity) throws ParseException {
			String contentType = file.getContentType();
	        String fileName = file.getOriginalFilename();
	        String filePath = request.getSession().getServletContext().getRealPath("/");
	        try {
	            FileUtil.uploadFile(file.getBytes(), filePath, fileName);
	        } catch (Exception e) {
	            // TODO: handle exception
	        }
	        Activity.setPoster(fileName);  
	        FormatDate fd = new FormatDate();
	        int apptime = fd.getDateNowBySeconds(); 
	        Activity.setApplicationTime(apptime);
	        
	        FormatDate mj = new FormatDate();
	        int startdate = mj.getDateByString(request.getParameter("startdate"));
	        int enddate = mj.getDateByString(request.getParameter("enddate"));
	        Activity.setStartDate(startdate);
	        Activity.setEndDate(enddate);
	        
	        int flag = activityService.save(Activity);
	        if (flag == 1) {
				return ajaxReturn(response, null, "申请成功", 1);
			} else {
				return ajaxReturn(response, null, "申请失败", 0);
			}
	        
	
	}
	
	@RequestMapping(value={"upload"})
	public String upload(Model model,HttpServletRequest request,HttpServletResponse response) {
		
			return "upload/uploadimg";
	
	}
	
	@RequestMapping(value={"uploading"})
	public String uploading(@RequestParam("file") MultipartFile file,Model model,HttpServletRequest request,HttpServletResponse response) {
		
			String contentType = file.getContentType();
	        String fileName = file.getOriginalFilename();
	        
	        System.out.println("fileName-->" + fileName);
	        System.out.println("getContentType-->" + contentType);
	        
	        String filePath = request.getSession().getServletContext().getRealPath("imgupload/");
	        System.out.println(filePath);
	        try {
	            FileUtil.uploadFile(file.getBytes(), filePath, fileName);
	        } catch (Exception e) {
	            // TODO: handle exception
	        }
	        System.out.println(fileName);
	        //返回json
	        return "upload/success";
	
	}
	
	
	
	
	
	
}

