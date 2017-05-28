package pers.student.admin.service;

/**
 * 分页导航
 * @author mingshan
 *
 */
public interface PageHelperService {
	/**
	 * 
	* @Title: createToolBar
	* @Description: TODO  
	* @param @param total  记录总数
	* @param @param pageSize  每页显示记录数量
	* @param @param url  该页url
	* @param @param index  当前页
	* @param @return    设定文件
	* @return String    返回类型
	* @throws
	 */
	public String createToolBar(int total, int pageSize, String url,int index);
	
}
