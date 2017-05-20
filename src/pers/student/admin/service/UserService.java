package pers.student.admin.service;

import java.util.Set;

import pers.student.admin.po.SecurityUser;

public interface UserService extends BaseService<SecurityUser>{

	/**根据userName获取角色**/
	Set<String> getRoles(String userName);
	
	/**获取权限**/
	Set<String> getPermissions(String userName);
}
