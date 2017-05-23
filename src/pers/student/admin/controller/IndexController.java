package pers.student.admin.controller;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
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

	
	@RequestMapping("/index")
	public String goIndex(ModelMap map){
	
		return "admin/index";
	}
}
