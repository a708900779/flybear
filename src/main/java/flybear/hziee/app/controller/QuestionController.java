package flybear.hziee.app.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import flybear.hziee.app.service.QuestionService;
import flybear.hziee.app.util.UIUtils;
import flybear.hziee.app.model.Question;
import flybear.hziee.core.base.BaseController;
import flybear.hziee.core.sql.Row;
import flybear.hziee.core.util.UploadUtils;

@Controller
@RequestMapping("question")
public class QuestionController extends BaseController{

	@Autowired
	private QuestionService QuestionService;
	String con = null;
		@RequestMapping(value={"add"})
		public String add(Model model,HttpServletRequest request,HttpServletResponse response,Question Question) throws Exception {
			if (request.getMethod().equals("POST")) {
				con = request.getParameter("search");
				return ajaxReturn(response, null, "已完成查找", 1);
			} else {
				return "question/add";
			}
		}	

		@RequestMapping(value={"edit"})
		public String edit(Model model,HttpServletRequest request,HttpServletResponse response,Question Question) throws Exception {
			if (request.getMethod().equals("POST")) {
				if(Question != null){
					QuestionService.update(Question);
					return ajaxReturn(response, null, "修改成功", 1);
				}else{
					return ajaxReturn(response, null, "修改失败", 0);
				}
			}else{
				String id = request.getParameter("id");
				Question entity = QuestionService.findById(Integer.valueOf(id));
				model.addAttribute("list", entity);
				return "question/edit";
			}
			
		}
	
	@RequestMapping(value={"list"})
	public String list(Model model,HttpServletRequest request,HttpServletResponse response) {
		if(request.getMethod().equals("POST")){			
			Map<String, Object>	list = QuestionService.getUIGridData(null,UIUtils.getPageParams(request));
			return ajaxReturn(response,list);
		}
		else{
			return "question/list";
		}
	}

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String delete(HttpServletRequest request,HttpServletResponse response,Integer id) throws Exception {
		int flag = QuestionService.delete(id);
		if (flag == 1) {
			return ajaxReturn(response, null, "删除成功", 1);
		} else {
			return ajaxReturn(response, null, "删除失败", 0);
		}
	}
	
	@RequestMapping(value={"search_list"})
	public String search_list(Model model,HttpServletRequest request,HttpServletResponse response) {
		if(request.getMethod().equals("POST")){
			Map<String, Object>	list = QuestionService.getUIGridDataSearch(con,UIUtils.getPageParams(request));
			System.out.println(1);
			return ajaxReturn(response,list);
		}
		else{
			return "question/searchList";
		}
	}
	
}

