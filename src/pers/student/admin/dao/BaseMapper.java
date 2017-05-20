package pers.student.admin.dao;

import java.util.List;

/**
 * 通用  mapper
 * @author mingshan
 *
 */
public interface BaseMapper<T> {
	
	int deleteByPrimaryKey(Integer id);

	int insert(T model);

	int insertSelective(T model);

	T selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(T model);
	
	List<T> selectAll();

	
}
