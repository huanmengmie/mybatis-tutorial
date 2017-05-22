package pers.student.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.student.admin.dao.SecurityRoleMapper;
import pers.student.admin.po.SecurityRole;
import pers.student.admin.service.RoleService;

/**
 * 角色
 * @author mingshan
 *
 */
@Service
public class RoleServiceImpl extends BaseServiceImpl<SecurityRole> implements RoleService{

	@Autowired
	private SecurityRoleMapper securityRoleMapper;

	@Override
	public int deleteBatch(SecurityRole securityRole) {
		// TODO Auto-generated method stub
		return securityRoleMapper.deleteBatch(securityRole);
	}

	@Override
	public List<SecurityRole> selectRoleByToken(String token) {
		// TODO Auto-generated method stub
		return securityRoleMapper.selectRoleByToken(token);
	}

	
	
}
