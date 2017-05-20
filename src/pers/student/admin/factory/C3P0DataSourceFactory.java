package pers.student.admin.factory;

import org.apache.ibatis.datasource.unpooled.UnpooledDataSourceFactory;

import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * Mybatis 使用  c3p0数据源
 * @author mingshan
 *
 */
public class C3P0DataSourceFactory extends UnpooledDataSourceFactory{

	public C3P0DataSourceFactory(){
		this.dataSource=new ComboPooledDataSource();
	}
}
