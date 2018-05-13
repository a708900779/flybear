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

import flybear.hziee.app.service.MailboxService;
import flybear.hziee.app.util.UIUtils;
import flybear.hziee.app.model.Mailbox;
import flybear.hziee.core.base.BaseController;
import flybear.hziee.app.util.StringUtil;
import flybear.hziee.app.util.UIUtils;
import flybear.hziee.core.sql.Row;
import flybear.hziee.core.util.UploadUtils;

/**
*控制器
*
*/
@Controller
@RequestMapping("mailbox")
public class MailboxController extends BaseController{

	@Autowired
	private MailboxService mailboxService;

	@RequestMapping(value={"add"})
	public String add(Model model,HttpServletRequest request,HttpServletResponse response,Mailbox Mailbox) throws Exception {
		if (request.getMethod().equals("POST")) {
			int flag = mailboxService.save(Mailbox);
			if (flag == 1) {
				return ajaxReturn(response, null, "添加成功", 1);
			} else {
				return ajaxReturn(response, null, "添加失败", 0);
			}
		} else {
			return "mailbox/add";
		}
	}	

	@RequestMapping(value={"edit"})
	public String edit(Model model,HttpServletRequest request,HttpServletResponse response,Mailbox Mailbox) throws Exception {
		if (request.getMethod().equals("POST")) {
			if(Mailbox != null){
				mailboxService.update(Mailbox);
				return ajaxReturn(response, null, "修改成功", 1);
			}else{
				return ajaxReturn(response, null, "修改失败", 0);
			}
		}else{
			String id = request.getParameter("id");
			Mailbox entity = mailboxService.findById(Integer.valueOf(id));
			model.addAttribute("list", entity);
			return "mailbox/edit";
		}
		
	}
	

	@RequestMapping(value={"list"})
	public String list(Model model,HttpServletRequest request,HttpServletResponse response) {
		if(request.getMethod().equals("POST")){			
			Map<String, Object>	list = mailboxService.getUIGridData(null,UIUtils.getPageParams(request));
			return ajaxReturn(response,list);
		}
		else{
			return "mailbox/list";
		}
	}

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String delete(HttpServletRequest request,HttpServletResponse response,Integer id) throws Exception {
		int flag = mailboxService.delete(id);
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
			return ajaxReturn(response, mailboxService.findUIGridData(key,UIUtils.getPageParams(request)));
		}else {
			return "mailbox/list";
		}
	}

}

