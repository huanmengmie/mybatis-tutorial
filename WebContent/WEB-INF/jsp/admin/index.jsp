<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>

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
				

					
					
						<div class="menu-loginreg">
						
						    <button class="login-btn">登录</button>
						    <button class="reg-btn">注册</button>
			
						</div>
				 
					
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
	
		
		 <!--登录-->
<div class="modalDialog login-modalDialog">
	<div>
		<a href="javascript:void(0);" title="关闭" class="close login-close" >X</a>
		<span class="openModal-title">登录界面</span>
        <div class="openModal-login">
            
            <div class="login-content login-form">
            
                 <label>
				<input type="text" name="email" required placeholder="Email">
				</label>
				<label>
					<input type="password" name="password" required placeholder="Password">
				</label>
					<input type="submit" value="Login">
			  <span> <a href="">忘记密码？</a></span>
            </div> 
            
           
        </div>       
		
	</div>
</div>

<!--注册-->

<div class="modalDialog reg-modalDialog">
	
	<div>
		<a href="javascript:void(0);" title="关闭" class="close reg-close" >X</a>
		<span class="openModal-title">注册界面</span>
        <div class="openModal-login">
            
            <div class="login-content login-form">
                <label>
				     <input type="text" name="username" required placeholder="username">
				</label>
                <label>
				     <input type="text" name="email" required placeholder="Email">
				</label>
				<label>
					<input type="password" name="password" required placeholder="Password">
				</label>
				<label>
					<input type="password" name="re-password" required placeholder="re-password">
				</label>
					<input type="submit" value="register">
			  <span>已有账号？ &nbsp;  <a href="javascript:void(0);" class="link-login">登录</a></span>
            </div> 
            
           
        </div>       
		
	</div>
	
	
</div>

	</body>
</html>
<script type="text/javascript" src="${CTP}/resources/common/js/lib/jquery-1.10.2.min.js" ></script>
<script type="text/javascript" src="${CTP}/resources/common/js/extends/layer-2.4/layer.js"></script>
<script type="text/javascript">
	
	$(function(){
		
		$(".login-btn").bind("click",function(){
			
			$('.login-modalDialog').slideDown();
		    $('html').addClass('overHiden');
		});
		
		$('.login-close').bind('click',function(){
			$('.login-modalDialog').slideUp();
			$('html').removeClass('overHiden');
	    });
	    
	    
	    $(".reg-btn").bind("click",function(){
	    	
				    	
	    	$('.reg-modalDialog').slideDown();
		    $('html').addClass('overHiden');
	    });
	    
	    $('.reg-close').bind('click',function(){
			$('.reg-modalDialog').slideUp();
			$('html').removeClass('overHiden');
	    });
	    
	    $(".link-login").bind("click",function(){
	    	$('.reg-modalDialog').slideUp();
	    	$('.login-modalDialog').slideDown();
		  
	    });
	    
	    
	    function tog(v){return v?'addClass':'removeClass';}   
		  
		$(document).on('input', '.searchinput', function() {  
		    $(this)[tog(this.value)]('x');  
		}).on('mousemove', '.x', function(e) {  
		    $(this)[tog(this.offsetWidth-24 < e.clientX-this.getBoundingClientRect().left)]('onX');     
		}).on('click', '.onX', function(){  
		   // $(this).removeClass('x onX').val('').change(); 
		   
		}); 	  
		
		
		//校检用户名
		//检验不能为空和数字
	 function check(className,tips){
	 	    var filter=/^[a-zA-Z\u4e00-\u9fa5]{1}[a-zA-Z0-9_\u4e00-\u9fa5]{1,8}$/;
		    var str = $(className).val();
			str = str.replace(/\s/g , '');//输入空格时自动忽略，\s表示空格
	     	if( str ==""|| str==null ){
	   		    layer.tips("*"+tips+"不能为空", $(className));
			    $(className).focus();
				return false;
			}else{
				var filter=/^\d*$/;
				if(filter.test(str) || str.length >10){
					layer.tips("*"+tips+"不能为数字",$(className));
					return false;
				}else {
					
					return true;
				}
			}
	   }
	 
	 
		
	});
</script>

