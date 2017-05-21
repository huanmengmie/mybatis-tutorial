package pers.student.admin.po;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 用户
 * @author mingshan
 *
 */
public class SecurityUser {

	
	private int id;
	
	private String userName;
	

	private String password;
	
	//加点盐
	private String salt;
	
	//用户状态
	private int status;
	
	//用户邮箱
	private String email;
	
	
	//注册时间
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date addTime;
	
	//过期时间
	private Long outDate;
	
	//验证
	private String validataCode;

	//用户权限	
	List<SecurityPermission> permission;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public Long getOutDate() {
		return outDate;
	}

	public void setOutDate(Long outDate) {
		this.outDate = outDate;
	}

	public String getValidataCode() {
		return validataCode;
	}

	public void setValidataCode(String validataCode) {
		this.validataCode = validataCode;
	}

	public List<SecurityPermission> getPermission() {
		return permission;
	}

	public void setPermission(List<SecurityPermission> permission) {
		this.permission = permission;
	}

	
	
	

	

	
	
}
