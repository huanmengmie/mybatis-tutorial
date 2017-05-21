package pers.student.admin.service.impl;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import pers.student.admin.dao.BaseMapper;
import pers.student.admin.dao.SecurityResourcesMapper;
import pers.student.admin.dao.SecurityUserMapper;
import pers.student.admin.service.BaseService;


public class BaseServiceImpl<T> implements BaseService<T>{

	protected Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	 @SuppressWarnings("rawtypes")
	 private Class clazz=null;
	
    
    private BaseMapper<T> baseMapper;
 	public void setBaseMapper(BaseMapper<T> baseMapper) {
 		this.baseMapper = baseMapper;
 	}
	
 	@Autowired
 	private SecurityUserMapper securityUserMapper;
 	
 	@Autowired
 	private SecurityResourcesMapper securityResourcesMapper;
 	
 	
    public  BaseServiceImpl(){
    	 //通过反射机制获取子类传递过来的实体类型信息
    	 ParameterizedType type=(ParameterizedType) this.getClass().getGenericSuperclass();
    	 clazz=(Class) type.getActualTypeArguments()[0];
     }
     
 	@PostConstruct
	public void init() throws Exception
	{
		
		// 根据相应的clazz,获取对应的mapper
		// 1: 获取当前clazz的类型,然后获取相应的类名称
		String clazzName = clazz.getSimpleName();
	
		// 2:SecurityUser  -> SecurityUserMapper
		String clazzDaoName = clazzName.substring(0,1).toLowerCase() + clazzName.substring(1) + "Mapper";//toLowerCase首字母小写
		
		// 3: 通过clazzDaoName获取相应 Field字段    this.getClass().getSuperclass():获取到相应BaseServiceImpl
		Field daoNameField = this.getClass().getSuperclass().getDeclaredField(clazzDaoName);
		
		Object object = daoNameField.get(this);
	
		// 4: 获取baseDao 字段
		Field baseDaoNameField = this.getClass().getSuperclass().getDeclaredField("baseMapper");
		baseDaoNameField.set(this, object);
		
	}	
     
	@Override
	public T findById(int id) {
		// TODO Auto-generated method stub
		return baseMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<T> findAll() {
		// TODO Auto-generated method stub
		return baseMapper.selectAll();
	}

	@Override
	public int insert(T model) {
		// TODO Auto-generated method stub
		return baseMapper.insert(model);
	}

	@Override
	public int insertSelective(T model) {
		// TODO Auto-generated method stub
		return baseMapper.insertSelective(model);
	}

	@Override
	public int update(T model) {
		// TODO Auto-generated method stub
		return baseMapper.updateByPrimaryKeySelective(model);
	}

	@Override
	public int del(Integer id) {
		// TODO Auto-generated method stub
		return baseMapper.deleteByPrimaryKey(id);
	}

	@Override
	public T selectByUniqueFiled(T t) {
		// TODO Auto-generated method stub
		return baseMapper.selectByUniqueFiled(t);
	}

}
