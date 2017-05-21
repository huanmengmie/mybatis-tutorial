package pers.student.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import pers.student.admin.po.SecurityUser;
import pers.student.admin.service.UserService;

/**
 * 主页控制器
 * @author mingshan
 *
 */

@Controller
@RequestMapping("/admin")
public class IndexController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/index")
	public String goIndex(ModelMap map){
		
		List<SecurityUser> list=(List<SecurityUser>) userService.findAll();
		System.out.println(list);
		
		map.put("list", list);
		return "admin/index";
	}
}
