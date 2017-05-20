package pers.student.admin.service;

import java.util.List;

/**
 * BaseService
 * 
 * @author mingshan
 *
 * @param <T>
 */
public interface BaseService<T> {
	T findById(int id);

	List<T> findAll();

	int insert(T model);
	
	int insertSelective(T model);
	
	T selectByUniqueFiled(T t);
	
	int update(T model);
	
	int del(Integer id);	
}
