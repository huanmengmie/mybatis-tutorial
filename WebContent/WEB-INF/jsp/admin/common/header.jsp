<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
     
<script type="text/javascript">
$(function(){
	//退出系统处理
	$('.logout').bind('click',function(){
		layer.confirm('是否退出后台管理？', {
			  btn: ['退出','取消'] 
			}, function(){
				window.location.href="${pageContext.request.contextPath}/admin/user/logout";
			}, function(){
			  
			});
	});
	

});

</script>
<!--S header-->
		<div class="header">

			<div class="page-menu-wrapper clearfix" >
				<ul class="menu-function">
					<li>
						<a href="${pageContext.request.contextPath}/admin/index" title="" class="home" ><font  size="6">学生管理系统</font></a>                                    
					</li>
				
				</ul>
			
				<ul class="menu-share">
				
				<shiro:hasAnyRoles name="superadmin">
				    <li><a href="${pageContext.request.contextPath}/admin/authority/roleList">权限管理</a></li>
				</shiro:hasAnyRoles>
				<%-- 只有超级管理员 和老师   有权限 --%>
				<shiro:hasAnyRoles name="superadmin,teacher">
                <li> <a href="${pageContext.request.contextPath}/admin/teacher/findStudentList?p=1">查看学生</a></li>
                </shiro:hasAnyRoles>
                
                
                <li><a href="javascript:void(0);">${sessionScope.role}</a></li>
                       
				<li class="myname_li">
						<a href="javascript:void(0);" title="" class="mymainname look-myself-btn">
						
						
						<span class="myname_header"><shiro:principal/></span>
						</a>
						<ul class="dropdown-menu follow">
							<li><a href="javascript:void(0);" class="look-myself-btn" >我的信息</a></li>
						
							<li><a href="javascript:void(0);" class="logout">退出</a></li>
							
						</ul>
				</li>
			
				</ul>	
				
			</div>

</div>
		<!--E header-->