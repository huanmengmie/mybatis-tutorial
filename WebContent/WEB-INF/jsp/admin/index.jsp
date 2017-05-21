<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>主页</title>

<c:set var="CTP" value="${pageContext.request.contextPath}"></c:set>
<c:set var="CTP_ADMIN" value="${pageContext.request.contextPath}/resources/admin"></c:set>

		<link rel="stylesheet" href="${CTP_ADMIN}/css/indexheader.css" />
		<link rel="stylesheet" href="${CTP_ADMIN}/css/index.css" />

	</head>
	<body>
		<!--S header-->
		<div class="header">

			<div class="page-menu-wrapper clearfix" >
				<ul class="menu-function">
					<li>
						<a href="__MODULE__/Index/index" title="" class="home" ><font  size="6">学生管理系统</font></a>                                    
					</li>
				
				</ul>
			
				
				
				<ul class="menu-share">
                
                <li><a href="__MODULE__/Topic/index">查看</a></li>
                
                
                  
               
                  </li>
                
                  
					<li class="myname_li">
						<a href="__MODULE__/Profile/index/u/<{$Think.session.uid}>" title="" class="mymainname">
						
						
						<span class="myname_header">明山</span>
						</a>
						<ul class="dropdown-menu follow">
							<li><a href="__MODULE__/Profile/index/u/<{$Think.session.uid}>" >我的主页</a></li>
						
							<li><a href="__MODULE__/Index/exitsys">退出</a></li>
							
						</ul>
					</li>
				

					
					
						
				 
					
				</ul>	
				
			</div>

</div>
		<!--E header-->
	
<div class="content clearfix">
	
	<div class="search">
		
		<input type="text" name="" class="searchinput" placeholder="请输入要搜索的关键字">
		
		<ul>
		
		<c:forEach items="${list}" var="list_l">
			<li>${list_l.userName}</li>
		</c:forEach>
		</ul>
	</div>
	
</div>	
	

	</body>
</html>
