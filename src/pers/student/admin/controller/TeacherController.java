package pers.student.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;

import pers.student.admin.config.PageSizeConfig;
import pers.student.admin.po.SecurityUser;
import pers.student.admin.service.PageHelperService;
import pers.student.admin.service.UserService;

/**
 * 
 * 教师控制器
 * @author mingshan
 *
 */

@Controller
@RequestMapping("/admin/teacher")
public class TeacherController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private PageHelperService pageHelperService;
	
	
	private int pageSize=PageSizeConfig.ADMIN_PAGE_SIZE;
	/**
	 * 模糊查找 学生
	 * @param username
	 * @param response
	 */
	@RequestMapping("/findStudent")
	public void findStudentInfo(String token,HttpServletResponse response){
	
		response.setCharacterEncoding("UTF-8");  
		PrintWriter out = null;
		
		ArrayList<SecurityUser> list = (ArrayList<SecurityUser>) userService.selectUserByToken(token);
		String json = JSON.toJSONString(list, true);
		System.out.println(json);
		response.setContentType("application/json");
		try {
			out = response.getWriter();
			out.write(json);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			out.close();
		}
	    
	}
	
	/**
	 * 查询学生  -分页
	 */
	@RequestMapping("/findStudentList")
	public String  findStudentList(int p,ModelMap map){
	   String sp = p + "";
	   if(sp.equals("")){
			p = 1;
	   }
	   //当前的url
	   String url = "./findStudentList?p=";
		
	   //获取总记录量
	   int count = userService.findStudentCount();
	   //计算偏移量
	   int position = (p-1)*pageSize;
	 
	   HashMap<String,Object> uMap = new HashMap<String,Object>();
	   uMap.put("position", position);
	   uMap.put("pageSize",pageSize);
	   ArrayList<SecurityUser> list = (ArrayList<SecurityUser>) userService.selectStudent(uMap);
	   
	   //分页工具
	   String toolBar = pageHelperService.createToolBar(count, pageSize, url, p);
	   
	   //个人信息	
	   Subject currentUser = SecurityUtils.getSubject();
	   String  userName = (String) currentUser.getPrincipal();
	   SecurityUser user = new SecurityUser();
	   user.setUserName(userName);
	   user=userService.selectByUniqueFiled(user);
		
		
	   map.put("user", user);
	   
	   map.put("list", list);
	   map.put("toolBar", toolBar);
	   return "admin/stulist";
	}
}
