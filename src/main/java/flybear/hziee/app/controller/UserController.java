package flybear.hziee.app.controller;

import java.util.List;
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

import flybear.hziee.app.service.UserRoleService;
import flybear.hziee.app.service.UserService;
import flybear.hziee.app.util.MD5String;
import flybear.hziee.app.util.UIUtils;
import flybear.hziee.app.model.User;
import flybear.hziee.app.model.UserRole;
import flybear.hziee.core.base.BaseController;
import flybear.hziee.core.sql.Row;
import flybear.hziee.core.util.UploadUtils;

@Controller
@RequestMapping("user")
public class UserController extends BaseController{

	@Autowired
	private UserService UserService;

	@Autowired
	private UserRoleService urService;
	
	@RequestMapping(value={"add"})
	public String add(Model model,HttpServletRequest request,HttpServletResponse response,User User) throws Exception {
		if (request.getMethod().equals("POST")) {
			String roleid = request.getParameter("roleid");
			User.setPassword(MD5String.getMD5Str(User.getPassword()));
			int flag = UserService.save(User);
			UserRole ur = new UserRole();
			ur.setRoleId(Integer.valueOf(roleid));
			ur.setUserId(flag);
			urService.save(ur);
			if (flag == 1) {
				return ajaxReturn(response, null, "添加成功", 1);
			} else {
				return ajaxReturn(response, null, "添加失败", 0);
			}
		} else {
			return "User/add";
		}
	}	
	
	@RequestMapping(value={"edit"})
	public String edit(Model model,HttpServletRequest request,HttpServletResponse response,User User) throws Exception {
		if("POST".equals(request.getMethod())){
			String roleid = request.getParameter("roleid");
			if(!"0".equals(roleid)){
				urService.updataRole(User.getId().toString(), roleid);
			}
			int i = UserService.update(User);
			if(i > 0)
				return ajaxReturn(response,null,"更新成功",1);
			else
				return ajaxReturn(response,null,"更新失败",0);
		}else{
			String id = request.getParameter("id");
			Row row = UserService.getInfoByid(id);
			model.addAttribute("list", row);
			return "User/edit";
		}
		
	}	
/*	
	@RequestMapping(value = "editsave")
	public String edit (Model model,HttpServletResponse response,HttpServletRequest request,
						MultipartHttpServletRequest mhsr,User entity) throws Exception{
			String filename = "";//保存名字
			MultipartFile file = mhsr.getFile("data");
			Map<String,Object> info = UploadUtils.saveMultipartFile(file);
			int status = Integer.valueOf(info.get("status").toString());
			if(status > 0){
				filename = UploadUtils.parseFileUrl(info.get("saveName").toString());
				String[] savename = filename.split("/");
				entity.setRealName(savename[savename.length-1]);
			}else{
				return ajaxReturn(response,null,info.get("errorMsg").toString(),0);
			}
			System.out.println("文件名称"+filename);
			int flag = UserService.update(entity);
			if (flag > 0) {
				return ajaxReturn(response,null,"添加成功",1);
			}else {
				return ajaxReturn(response,null,"添加失败",0);
			}
	}*/

	@RequestMapping(value={"list"})
	public String list(Model model,HttpServletRequest request,HttpServletResponse response) {
		if(request.getMethod().equals("POST")){			
			Map<String, Object>	list = UserService.getUIGridData(null,UIUtils.getPageParams(request));
			return ajaxReturn(response,list);
		}
		else{
			return "User/list";
		}
	}

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String delete(HttpServletRequest request,HttpServletResponse response,Integer id) throws Exception {
		urService.deleteByuserid(id+"");
		int flag = UserService.delete(id);
		if (flag == 1) {
			return ajaxReturn(response, null, "删除成功", 1);
		} else {
			return ajaxReturn(response, null, "删除失败", 0);
		}
	}

/*	@RequestMapping(value = "save")
	public String save (Model model,HttpServletResponse response,HttpServletRequest request,
						MultipartHttpServletRequest mhsr,User entity){
		String filename = "";//保存名字
		MultipartFile file = mhsr.getFile("data");
		Map<String,Object> info = UploadUtils.saveMultipartFile(file);
		int status = Integer.valueOf(info.get("status").toString());
		if(status > 0){
			filename = UploadUtils.parseFileUrl(info.get("saveName").toString());
			String[] savename = filename.split("/");
			entity.setRealName(savename[savename.length-1]);
		}else{
			return ajaxReturn(response,null,info.get("errorMsg").toString(),0);
		}
		System.out.println("文件名称:"+filename);
		System.out.println("保存名称:"+entity.getRealName());
		int flag = UserService.save(entity);
		if (flag > 0) {
			return ajaxReturn(response,null,"添加成功",1);
		}else {
			return ajaxReturn(response,null,"添加失败",0);
		}
	}*/

}

