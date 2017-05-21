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
		
		<input type="text" name="" class="searchinput" placeholder="请输入要搜索的关键字">
		
		
		<!-- S SEARCH-RESULT -->	
					
		<div class="search-container"></div>
		<!-- E SEARCH-RESULT -->
	
	</div>
	
</div>	
	

<!--个人信息-->
<div class="modalDialog " >
	<div>
		<a href="javascript:void(0);" title="关闭" class="close info-close" >X</a>
		<span class="openModal-title">我的个人信息</span>
        <div class="openModal-login">
            
            <div class="login-content login-form">
                 <input type="hidden" class="uid" value="${user.id}"/>
                 <label>
				    <input type="text" name="username" class="l_username" value="${user.userName}" required  autocomplete="off">
				</label>
				
				<label>
				    <input type="text" name="email" class="l_email" value="${user.email}" required  autocomplete="off">
				</label>
				
				<label>
				    <input type="text" name="time" class="l_time" value="<fmt:formatDate value='${user.addTime}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly" required autocomplete="off">
				</label>
				
				<label>
				    <input type="password" name="old-password" class="l_old_password" required placeholder="Old Password" autocomplete="off">
				</label>
				
				<label>
				    <input type="password" name="new-password" class="l_new_password" required placeholder="New Password" autocomplete="off">
				</label>
				<label>
				    <input type="password" name="re-new-password" class="l_re_new_password" required placeholder="Repeat New Password" autocomplete="off">
				</label>
				
				<input type="submit" value="点击修改" >
			 
            </div> 
            
          
        </div>       
		
	</div>
</div>

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
					   inHtml+="<div class='search-user' style='width:100%;min-height:50px;'><p>学生列表</p><div class='search-user-t'><ul>"; 
				  }
				  
					$.each(data,function(id,item){
						 if(item.length!=0){
						    inHtml="<li style='list-style-type: none; line-heignt:20px;  '><a href='javascript:void(0);' style='color:#666666; text-decoration:none;display: inline-block;width: 485px;height: 30px;' data-userid='"+item.id+"'>"+item.userName+"</a></li>";
						 }
					});
				
					if(data.length!=0){
						 inHtml+="</ul></div></div>";
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