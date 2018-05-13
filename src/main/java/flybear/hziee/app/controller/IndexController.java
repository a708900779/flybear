package flybear.hziee.app.controller;

import java.util.List;
import flybear.hziee.app.service.ActionNodeService;
import flybear.hziee.app.util.Param2Bean;
import flybear.hziee.core.base.BaseController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 首页控制器
 */
@Controller
public class IndexController extends BaseController {
	
	@Autowired
	ActionNodeService actionNodeService;
	
	@RequestMapping(value={"/"})
	public String index(Model model,HttpServletRequest request,HttpServletResponse response) {
		String roleId = String.valueOf(request.getSession().getAttribute("roleId"));
		model.addAttribute("topMenuList",actionNodeService.getTopNodeList(roleId));
		return "index/index";
	}
	
	/**
	 * 左侧菜单
	 */
	@RequestMapping(value = "/left_menu/{topMenuId}")
	public String leftMenu(Model model,@PathVariable(value = "topMenuId") int topMenuId,HttpServletRequest request) {
		String roleId = String.valueOf(request.getSession().getAttribute("roleId"));
		model.addAttribute("leftMenuList",actionNodeService.getLeftNodeList(topMenuId,roleId));
		return "public/left_menu";
	}
	
}
