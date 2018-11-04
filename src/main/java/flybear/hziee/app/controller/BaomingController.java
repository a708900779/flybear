package flybear.hziee.app.controller;

import java.io.*;

import java.util.*;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import flybear.hziee.app.service.ActivityService;
import flybear.hziee.app.service.BaomingService;
import flybear.hziee.app.service.StudentService;
import flybear.hziee.app.util.UIUtils;
import flybear.hziee.app.model.Baoming;
import flybear.hziee.core.base.BaseController;
import flybear.hziee.app.util.StringUtil;
import flybear.hziee.app.util.UIUtils;
import flybear.hziee.app.util.FormatDate;
import flybear.hziee.core.sql.Row;
import flybear.hziee.core.util.UploadUtils;

/**
*控制器
*
*/
@Controller
@RequestMapping("baoming")
public class BaomingController extends BaseController{

	@Autowired
	private BaomingService baomingService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private ActivityService activityService;

	@RequestMapping(value={"add"})
	public String add(Model model,HttpServletRequest request,HttpServletResponse response,Baoming Baoming) throws Exception {
		if (request.getMethod().equals("POST")) {
			int flag = baomingService.save(Baoming);
			System.out.println();
			if (flag == 1) {
				return ajaxReturn(response, null, "添加成功", 1);
			} else {
				return ajaxReturn(response, null, "添加失败", 0);
			}
		} else {
			return "baoming/add";
		}
	}	

	@RequestMapping(value={"edit"})
	public String edit(Model model,HttpServletRequest request,HttpServletResponse response,Baoming Baoming) throws Exception {
		if (request.getMethod().equals("POST")) {
			if(Baoming != null){
				baomingService.update(Baoming);
				return ajaxReturn(response, null, "修改成功", 1);
			}else{
				return ajaxReturn(response, null, "修改失败", 0);
			}
		}else{
			String id = request.getParameter("id");
			Baoming entity = baomingService.findById(Integer.valueOf(id));
			model.addAttribute("list", entity);
			return "baoming/edit";
		}
		
	}
	

	@RequestMapping(value={"list"})
	public String list(Model model,HttpServletRequest request,HttpServletResponse response) {
		if(request.getMethod().equals("POST")){			
			Map<String, Object>	list = baomingService.getUIGridData(null,UIUtils.getPageParams(request));
			return ajaxReturn(response,list);
		}
		else{
			return "baoming/list";
		}
	}

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String delete(HttpServletRequest request,HttpServletResponse response,Integer id) throws Exception {
		int flag = baomingService.delete(id);
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
			return ajaxReturn(response, baomingService.findUIGridData(key,UIUtils.getPageParams(request)));
		}else {
			return "baoming/list";
		}
	}
	
	/*
	 * 实现报名功能，首先从session中获得学生姓名，然后根据学生姓名得到学生id。
	 * 然后从隐藏的input表单中获得activity_id和活动最大人数，最后调用时间戳的类获得当前时间的时间戳。
	 * 然后查询 baoming表，如果已报名人数<最大人数，则报名成功。如果已报名，则报名失败。
	 */
	@RequestMapping(value={"bm"})
	public String bm(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception {
		if (request.getMethod().equals("POST")) {
			int acid = Integer.valueOf(request.getParameter("acid"));
			int maxNum = Integer.valueOf(request.getParameter("maxnum"));
			String nickname =  (String) request.getSession().getAttribute("nickname");
			int stuid = studentService.getByNickname(nickname);
			int num = baomingService.getAcNum(acid);
			
			if(baomingService.IsExist(acid, stuid))
			{
				if(num<maxNum){
					Baoming b = new Baoming();
					b.setActivityId(acid);
					b.setStudentId(stuid);
					b.setTime(new FormatDate().getDateNowBySeconds());
					baomingService.save(b);
					return ajaxReturn(response, null, "报名成功", 0);
				}else{
					return ajaxReturn(response, null, "该活动报名人数已满", 1);
				}
	
			}else{
				return ajaxReturn(response, null, "你已经报名了！", 2);
			}
	
		
		} else {
			return "activity/index2";
		}
	}
	@RequestMapping(value={"myac"})
	public String myac(Model model,HttpServletRequest request,HttpServletResponse response) {
			String nickname =  (String) request.getSession().getAttribute("nickname");
			int stuid = studentService.getByNickname(nickname);
			model.addAttribute("ac",baomingService.getAcByStuid(stuid));
			model.addAttribute("ac2",activityService.getAcByName(nickname) );		
		//	System.out.println(activityService.getAcByName(nickname));		
			return "activity/myac";
		
	}
	
	
	
}

