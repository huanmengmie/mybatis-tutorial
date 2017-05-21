package pers.student.admin.dao;


import java.util.List;

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
	
}
