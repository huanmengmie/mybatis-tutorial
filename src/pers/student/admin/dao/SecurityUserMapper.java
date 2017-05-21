package pers.student.admin.dao;


import java.util.List;
import java.util.Map;

import pers.student.admin.po.SecurityUser;

/**
 * UserMapper
 * @author mingshan
 *
 */
public interface SecurityUserMapper extends BaseMapper<SecurityUser>{


	//根据用户名查找角色
	String selectUserRole(String username);
	
	//获取用户的权限
	SecurityUser selectUserPersmission(String username);
	
	//模糊查询用户
	List<SecurityUser> selectUserByToken(String username);
	
	//查询所有的学生 -分页
	List<SecurityUser> selectStudent(Map map);
	
	//查询所有的学生 数量   -分页
	int findStudentCount();
}
