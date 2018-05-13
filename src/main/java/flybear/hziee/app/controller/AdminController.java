package flybear.hziee.app.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import flybear.hziee.app.model.ActionNode;
import flybear.hziee.app.model.Role;
import flybear.hziee.app.model.RoleNode;
import flybear.hziee.app.service.ActionNodeService;
import flybear.hziee.app.service.RoleNodeService;
import flybear.hziee.app.service.RoleService;
import flybear.hziee.app.util.UIUtils;
import flybear.hziee.core.base.BaseController;
import flybear.hziee.core.util.Fn;

/**
 * 管理员控制器
 */
@Controller
@RequestMapping(value={"admin"})
public class AdminController extends BaseController{
	
	
	/*@Autowired
	private AdminService adminService;*/
	@Autowired
	private ActionNodeService actionNodeService;
	@Autowired
	private RoleService roleServcie;
	@Autowired
	private RoleNodeService roleNodeService;
	
	
	@RequestMapping(value={"/"})
	public String index(Model model,HttpServletRequest request,HttpServletResponse response) {
		return "admin/index";
	}
		
/*	@RequestMapping(value={"find_by_id"},method = RequestMethod.POST)
	public String findById(Integer id, HttpServletRequest request, HttpServletResponse response) {
		
		Admin admin = adminService.findById(id);	
		return ajaxReturn(response, admin);
	}*/
	
/*	@RequestMapping(value={"list"})
	public String list(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		Map<String, Object>	adminList = adminService.getUIGridData(null,UIUtils.getPageParams(request));
			
		model.addAttribute("adminList",adminList);
		if(request.getMethod().equals("POST")){
			return ajaxReturn(response, adminList);
		}else{
			return "admin/list";
		}
	}*/	
	
	
/*	@RequestMapping(value={"add"})
	public String add(Admin entity, HttpServletRequest request, HttpServletResponse response){
		if(request.getMethod().equals("POST")){
			 Integer count = null;
				try {
					entity.setLoginPass(DigestUtils.md5Hex(entity.getLoginPass()));
					count = adminService.save(entity);
				} catch (Exception e) {
					return ajaxReturn(response,null,e.getLocalizedMessage(),-1);
				}
			if(count==0)
				return ajaxReturn(response,null,"添加失败",0);
			else
				return ajaxReturn(response, null,"添加成功",1);
		}else{
			return "admin/add";
		}
 	}*/
	
	
	
	/*@RequestMapping(value={"edit"})
	public String edit(Model model, Admin entity, HttpServletRequest request, HttpServletResponse response) {
	
		if(request.getMethod().equals("POST")){
			Integer count = null;
			try {
				count = adminService.update(entity);
			} catch (Exception e) {
				return ajaxReturn(response,null,e.getLocalizedMessage(),-1);
			}
			if(count==0)
		    	return ajaxReturn(response,null,"更新失败",0);
		    else
		    	return ajaxReturn(response, null,"更新成功",1);
		}
        else
			model.addAttribute("admin", adminService.findById(entity.getId()));
        	return "admin/edit";
	}*/
	
/*	@RequestMapping(value={"delete"})
	public String delete(HttpServletRequest request, HttpServletResponse response,Integer id) {
		adminService.delete(id);
		return ajaxReturn(response, null,"删除成功",1);
	}*/
	
	/**
	 * 权限节点列表
	 * @param model
	 * @return
	 */
	@RequestMapping(value={"action_node"})
	public String actionNode(HttpServletRequest request, HttpServletResponse response) {
		
		if(request.getMethod().equals("POST")){
			if("combo".equals(request.getParameter("ui"))){
				List<Map<String, Object>> res = new ArrayList<Map<String, Object>>();
				Map<String, Object> node = new HashMap<String, Object>();
				node.put("id", 0);
				node.put("text", "--顶级节点--");
				res.add(node);
				res.addAll(actionNodeService.getUIComboData());
				return ajaxReturn(response, res);
			}else{
				return ajaxReturn(response, actionNodeService.getUIGridData());
			}
		}else{
			return "admin/action_node";
		}
	}
	
	/**
	 * 新增权限节点
	 * @param model
	 * @return
	 */
	@RequestMapping(value={"action_node_add"})
	public String actionNodeAdd(HttpServletRequest request, HttpServletResponse response,
			ActionNode actionNode) {
		if(request.getMethod().equals("POST")){
			actionNodeService.save(actionNode);
			return ajaxReturn(response, null,"添加成功",1);
		}else{
			return "admin/action_node_add";
		}
	}
	
	/**
	 * 修改权限节点
	 * @param model
	 * @return
	 */
	@RequestMapping(value={"action_node_edit"})
	public String actionNodeEdit(Model model,HttpServletRequest request, HttpServletResponse response,
			ActionNode actionNode) {
		
		if(request.getMethod().equals("POST")){
			actionNodeService.update(actionNode);
			return ajaxReturn(response, null,"修改成功",1);
		}else{
			model.addAttribute("actionNode",actionNodeService.findById(actionNode.getId()));
			return "admin/action_node_edit";
		}
	}
	
	/**
	 * 删除权限节点
	 * @param model
	 * @return
	 */
	/*@RequestMapping(value={"action_node_delete"},method=RequestMethod.POST)
	public String actionNodeDelete(HttpServletResponse response,Integer id) {
		actionNodeService.delete(id);
		return ajaxReturn(response, null,"删除成功",1);
	}*/
	@RequestMapping(value={"action_node_delete"},method=RequestMethod.POST)
	public String actionNodeDelete(HttpServletResponse response,Integer id) {
		int flag = actionNodeService.deleteCascade(id);
		if(flag == 1)
			return ajaxReturn(response, null,"删除成功",1);
		else{
			return ajaxReturn(response, null,"删除失败",0);
		}
	}
	
	/**
     * 角色管理
     * @param model
     * @return
     */
	@RequestMapping(value={"role"})
	public String role(Model model, HttpServletRequest request, HttpServletResponse response) {
		if(request.getMethod().equals("POST")){
			Map<String, Object> where = new HashMap<String, Object>();
			return ajaxReturn(response, roleServcie.getUIGridData(where,UIUtils.getPageParams(request)));
		}else{
			return "admin/role";
		}
	}

	/**
     * 角色添加
     * @param model
     * @return
     * @throws Exception 
     */
    @RequestMapping(value={"role_add"})
    public String roleAdd(Model model,HttpServletRequest request, HttpServletResponse response
    		,Role entity) throws Exception {
    	if(request.getMethod().equals("POST")){
    		int flag = roleServcie.save(entity);
    		if(flag == 1){
				return ajaxReturn(response, null,"添加成功",1);
			}else {
				return ajaxReturn(response, null,"发生错误，请重试！",0);
			}
    	}
    	return "admin/role_add";
    }

    /**
     * 角色编辑
     * @param model
     * @return
     * @throws Exception 
     */
    @RequestMapping(value={"role_edit"})
    public String roleEdit(Model model,HttpServletRequest request, HttpServletResponse response
    		,Role entity) throws Exception {
    	
    		if(entity.getId() != null){
    			model.addAttribute("role",roleServcie.findById(entity.getId()));
    		}
    	
    		if(request.getMethod().equals("POST")){
    			System.out.println(entity.getId()+" "+entity.getName()+" "+entity.getStatus()+" "+entity.getRemark());
    		int flag = roleServcie.update(entity);
    		if(flag == 1){
				return ajaxReturn(response, null,"添加成功",1);
			}else {
				return ajaxReturn(response, null,"发生错误，请重试！",0);
			}
    	}
        return "admin/role_edit";
    }
    
    @RequestMapping(value={"role_delete"})
	public String roleDel(HttpServletRequest request,HttpServletResponse response,Integer id) {
//		if(request.getMethod().equals("POST")){
			System.out.println(id);
			roleServcie.delete(id);
			return ajaxReturn(response, null,"删除成功",1);
    }
    
    /**
     * 设置角色权限
     * @param model
     * @return
     * @throws Exception 
     */
    @RequestMapping(value={"role_access"})
	public String roleAccess(Model model,HttpServletRequest request,HttpServletResponse response
			,Integer id) throws Exception {
//    	System.out.println("test===="+id);4
		if(request.getMethod().equals("POST")){
			String[] nodeIds= request.getParameterValues("nodeId");
			roleNodeService.deleteByRoleId(id);
			if (nodeIds!=null) {
				for (String nodeId : nodeIds) {
					RoleNode roleNode = new RoleNode();
					roleNode.setRoleId(id);
					roleNode.setNodeId(Integer.valueOf(nodeId));
					roleNode.setAddTime(Fn.time());
					roleNodeService.save(roleNode);
				}
			}
			return ajaxReturn(response, null,"授权成功",1);
		}else {
			List<Map<String, Object>> node = actionNodeService.getNodeList(id);
			System.out.println(node.toString());
			model.addAttribute("node", node);
			return "admin/role_access";
		}

	}
	
}
