<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>主页</title>

<c:set var="CTP" value="${pageContext.request.contextPath}"></c:set>
<c:set var="CTP_ADMIN" value="${pageContext.request.contextPath}/resources/admin"></c:set>
<script type="text/javascript">
var CTPPATH="${pageContext.request.contextPath}";
var DEFAULT_EMAIL="${user.email}";
</script>
<link rel="stylesheet" href="${CTP_ADMIN}/css/indexheader.css" />
<link rel="stylesheet" href="${CTP_ADMIN}/css/index.css" />
<script type="text/javascript" src="${CTP}/resources/common/js/lib/jquery-1.10.2.min.js" ></script>
<script type="text/javascript" src="${CTP}/resources/common/js/extends/layer-2.4/layer.js"></script>
<script type="text/javascript" src="${CTP_ADMIN }/js/module/common.js"></script>

<script type="text/javascript" src="${CTP_ADMIN }/js/module/lookinfo.js"></script>

</head>
	<body>
		<!--S header  -->
		<jsp:include page="common/header.jsp"></jsp:include>
		<!--E header-->
	
<div class="content clearfix">
	
	<div class="search">
		
		<%-- 只有超级管理员 和老师   有权限 --%>
	    <shiro:hasAnyRoles name="superadmin,teacher">
		<input type="text" name="" class="searchinput" placeholder="请输入要搜索的关键字">
	    
		<!-- S SEARCH-RESULT -->	
					
		<div class="search-container"></div>
		<!-- E SEARCH-RESULT -->
	
	    </shiro:hasAnyRoles>
	
	<!-- 访客 -->
	<shiro:hasRole name="guest">
	<div class="guest-tip">
	<img alt="" src="${CTP_ADMIN}/image/tip.png"><br>
	<span>
	
	欢迎您访问后台管理系统，您目前的角色是游客，后台功能对您不可用，请联系超级管理员为您分配角色。
	</span>
	
	</div>
	</shiro:hasRole>
	
	</div>
	
</div>	
	

<jsp:include page="common/myinfo.jsp"></jsp:include>

	</body>
</html>

<script type="text/javascript">
$(function(){

    
    
    /***搜索提示***/
    
    $(document).on('input propertychange focus','.searchinput',function(){
		//获取当前输入框输入内容
		var search_input=$(this).val();
		var mythis=$(this);
		//判断输入内容是否为空
		if(search_input.replace(/(^\s*)|(\s*$)/g,"")==""){
			mythis.next().fadeOut('normal');
		}else{
			mythis.next().fadeIn("normal");;
			
			$.ajax({
				type:'post',
				dataType:'json',
				url:CTPPATH+'/admin/teacher/findStudent',
				data:{'token':search_input},
				beforeSend:function(){
					//显示正在加载
					//layer.load(2);
					mythis.next().html('<div class="spinner"><div class="bounce1"></div><div class="bounce2"></div><div class="bounce3"></div></div>');
				},
				success:function(data){

				  var inHtml="";
				  if(data.length!=0){
					   inHtml+="<div class='search-user' style='width:100%;min-height:50px;'><p>学生列表</p><div class='search-user-t'><table><tr> <th >学生名称</th><th >学生邮箱</th><th >学生状态</th><th>注册日期</th></tr>"; 
				  }
				  
					$.each(data,function(id,item){
						 if(item.length!=0){
						    inHtml+="<tr><td>"+item.userName+"</td><td>"+item.email+"</td>";
						    if(item.status ==1){
						    	inHtml+="<td>启用</td>"
						    }else{
						    	inHtml+="<td>禁用</td>";
						    }
						    inHtml+="<td>"+showLocale(item.addTime)+"</td></tr>";
						 }
					});
				
					if(data.length!=0){
						 inHtml+="</table></div></div>";
					}else{
						inHtml+="<div class='search-look-all-result'><a href='javascript:void(0);'>暂无搜索结果</a></div>";
					}
					 mythis.next().html(inHtml);
				
					  
				
					
					
				},
				error:function(){

					//关闭正在加载
					/*setTimeout(function(){
					  layer.closeAll('loading');
					}, 1000);*/
					
			    }
			});
		}
	});
    
    
	
});

</script>