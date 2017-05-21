package pers.student.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;

import pers.student.admin.po.SecurityUser;
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
	
	/**
	 * 模糊查找 学生
	 * @param username
	 * @param response
	 */
	@RequestMapping("/findStudent")
	public void findStudentInfo(String token,HttpServletResponse response){
	
		response.setCharacterEncoding("UTF-8");  
		PrintWriter out=null;
		
		ArrayList<SecurityUser> list=(ArrayList<SecurityUser>) userService.selectUserByToken(token);
		String json = JSON.toJSONString(list, true);
		System.out.println(json);
		response.setContentType("application/json");
		try {
			out=response.getWriter();
			out.write(json);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			out.close();
		}
	    
	}
}
