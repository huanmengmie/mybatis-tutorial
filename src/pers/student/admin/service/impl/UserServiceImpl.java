package pers.student.admin.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.student.admin.dao.SecurityUserMapper;
import pers.student.admin.po.SecurityPermission;
import pers.student.admin.po.SecurityUser;
import pers.student.admin.service.UserService;

/**
 * 用户service
 * @author mingshan
 *
 */
@Service
public class UserServiceImpl extends BaseServiceImpl<SecurityUser> implements UserService{

	@Autowired
 	private SecurityUserMapper securityUserMapper;
	
	@Override
	public Set<String> getRoles(String userName) {
		// TODO Auto-generated method stub
		Set<String>  roles =new HashSet<String>();
		String roleCode=securityUserMapper.selectUserRole(userName);
		roles.add(roleCode);
		return roles;
	}

	@Override
	public Set<String> getPermissions(String userName) {
		// TODO Auto-generated method stub
		Set<String>  permissions =new HashSet<String>();
		SecurityUser user=securityUserMapper.selectUserPersmission(userName);
		ArrayList<SecurityPermission> list=(ArrayList<SecurityPermission>) user.getPermission(); 
		
		for(SecurityPermission l :list){
			permissions.add(l.getPermissionName());
		}
		return permissions;
	}

	@Override
	public List<SecurityUser> selectUserByToken(String username) {
		// TODO Auto-generated method stub
		List<SecurityUser> list=securityUserMapper.selectUserByToken(username);
		return list;
	}

}
