package pers.student.admin.dao;

import java.util.List;

/**
 * 通用  mapper
 * @author mingshan
 *
 */
public interface BaseMapper<T> {
	
	//根据主键删除
	int deleteByPrimaryKey(Integer id);

	//插入
	int insert(T model);

	//插入 不会忽略default
	int insertSelective(T model);
    
	//根据主键查询
	T selectByPrimaryKey(Integer id);

	//根据其他唯一字段查询,传入为pojo，便于简化sql
	T selectByUniqueFiled(T t);
	
	//更新
	int updateByPrimaryKeySelective(T model);
	
    //查询全部
	List<T> selectAll();

	
}
