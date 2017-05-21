package pers.student.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pers.student.admin.po.SecurityUser;
import pers.student.admin.service.UserService;

/**
 * 用户控制器
 * @author mingshan
 *
 */
@Controller
@RequestMapping("/admin/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	
	/**
	 * 显示登录注册界面
	 * @return
	 */
	@RequestMapping("/login")
	public String showLogin(){
		return "admin/user/login";
	}
	
	/**
	 * 认证未通过或者权限不足
	 * @return
	 */
	public String unauthorized(){
		return "admin/user/unauthorized";
	}
	
	//执行登录
	@RequestMapping("dealLogin")
	public void dealLogin(String userName,String password,HttpServletRequest request,HttpServletResponse response){
		Subject currentUser = SecurityUtils.getSubject();
		
		response.setCharacterEncoding("UTF-8");  
		response.setContentType("application/json");
		PrintWriter out=null;
		String flag="1";
		
		if (!currentUser.isAuthenticated()) {
        	// 把用户名和密码封装为 UsernamePasswordToken 对象
            UsernamePasswordToken token = new UsernamePasswordToken(userName, password);
            // rememberme
            //token.setRememberMe(true);
            try {
            	System.out.println("1. " + token.hashCode());
            	// 执行登录. 
                currentUser.login(token);
               
        		Set<String> role= userService.getRoles(userName);
        		SecurityUser user=new SecurityUser();
        	    user.setUserName(userName);
        		user=(SecurityUser) userService.selectByUniqueFiled(user);
        		//获取uid
        		int uid=user.getId();
        		HttpSession session =request.getSession();
        		//将用户信息保存到session 中
                session.setAttribute("role", role);
                session.setAttribute("uid", uid);
            } 
            // 所有认证时异常的父类. 
            catch (AuthenticationException ae) {
                //unexpected condition?  error?
            	System.out.println("登录失败: " + ae.getMessage());
            	request.setAttribute("error", "用户名或密码错误");
            	flag="0";
            }
        }
		

		try {
			out=response.getWriter();
			out.write(flag);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			out.close();
		}
	}
}
