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

<link rel="stylesheet" href="${CTP_ADMIN}/css/indexheader.css" />
<link rel="stylesheet" href="${CTP_ADMIN}/css/index.css" />
<script type="text/javascript" src="${CTP}/resources/common/js/lib/jquery-1.10.2.min.js" ></script>
<script type="text/javascript" src="${CTP}/resources/common/js/extends/layer-2.4/layer.js"></script>
<script type="text/javascript" src="${CTP_ADMIN }/js/module/common.js"></script>
<script type="text/javascript">
var CTPPATH="${pageContext.request.contextPath}";

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
	</head>
	<body>
		<!--S header-->
		<div class="header">

			<div class="page-menu-wrapper clearfix" >
				<ul class="menu-function">
					<li>
						<a href="${CTP}/admin/index" title="" class="home" ><font  size="6">学生管理系统</font></a>                                    
					</li>
				
				</ul>
			
				<ul class="menu-share">
                <li> <a href="">查看学生</a></li>
                
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
	
<div class="content clearfix">
	
	<div class="search">
		
		<input type="text" name="" class="searchinput" placeholder="请输入要搜索的关键字">
		
		
		<!-- S SEARCH-RESULT -->	
					
		<div class="search-container">
		
		</div>
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
	
	var ok_username=false;
	var ok_email=false;
	var ok_old_password=false;
	var ok_new_password=false;
    var ok_re_new_password=false;
	
	$(".look-myself-btn").bind("click",function(){
		
		$('.modalDialog').slideDown();
	    $('html').addClass('overHiden');
	  
	});
	
	$('.info-close').bind('click',function(){
		$('.modalDialog').slideUp();
		$('html').removeClass('overHiden');

    });
	
	

    /**
     * 对用户名校验
     */
    $(".l_username").bind("blur",function(){
    	
    	var mythis=$(this);
    	var filter=/^[a-zA-Z\u4e00-\u9fa5]{1}[a-zA-Z0-9_\u4e00-\u9fa5]{1,8}$/;
    	var str = mythis.val();
		str = str.replace(/\s/g , '');//输入空格时自动忽略，\s表示空格
		
    	if( str ==""|| str==null ){
    		layer.tips('*用户名不能为空', mythis);
    		mythis.focus();
    		ok_username=false;
		}else{
			
			if(filter.test( mythis.val() )){
				//调用ajax验证用户是否已被注册
				
				//start
				$.ajax({
					type:'post',
					dataType:'json',
					url:CTPPATH+"/admin/user/checkUser",
					data:{"userName":str},
				
					beforeSend:function(){
						//显示正在加载
						layer.load(2,{offset: 10,time:2000});
					},
					success:function(data){
	
						//关闭正在加载
						setTimeout(function(){
							  layer.closeAll('loading');
						}, 1000);
						
						//代表用户名可用
						if(data==1){
							layer.tips('恭喜！用户名可用', mythis);
							ok_username=true;
						}else if(data==0){
							//代表用户名不可用
							layer.tips('*抱歉，用户名已被使用', mythis);
							
							ok_username=false;
						}
					},
					error:function(){
	
						//关闭正在加载
						setTimeout(function(){
							  layer.closeAll('loading');
						}, 1000);
						layer.msg("出错了", {icon: 2,time:2000});
					}
				});
				
				//end
			}else{
				layer.tips('*用户名为2-9字符,首字不为数字,无特殊字符 !', mythis);
				mythis.focus();
				ok_username=false;
			}
		}
    });
    
    /**
     * 对邮箱校验
     */
    $(".l_email").bind("blur",function(){
    	var mythis=$(this);
    	var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    	var str = mythis.val();
		str = str.replace(/\s/g , '');//输入空格时自动忽略，\s表示空格
		if( mythis.val() == "" || mythis.val==null ){
			layer.tips('邮箱不能为空', $(this));
			mythis.focus();
    		ok_email=false;
		}else{
			if(filter.test( mythis.val() )){
				//ajax验证邮箱是否被使用
				//start
				$.ajax({
					type:'post',
					dataType:'json',
					url:CTPPATH+"/admin/user/checkEmail",
					data:{"email":str},
				
					beforeSend:function(){
						//显示正在加载
						layer.load(2,{offset: 10,time:2000});
					},
					success:function(data){
	
						//关闭正在加载
						setTimeout(function(){
							  layer.closeAll('loading');
						}, 1000);
						
						//代表用户名可用
						if(data==1){
							layer.tips('恭喜！邮箱可用', mythis);
							ok_email=true;
						}else if(data==0){
							//代表用户名不可用
							layer.tips('*抱歉，邮箱已被使用', mythis);
						
							ok_email=false;
						}
					},
					error:function(){
	
						//关闭正在加载
						setTimeout(function(){
							  layer.closeAll('loading');
						}, 1000);
						layer.msg("出错了", {icon: 2,time:2000});
					}
				});
				
				//end
			}else{
				layer.tips('*邮箱格式不正确', mythis);
				mythis.focus();
				ok_email=false;
			}
		}
    });
    
    /**
     * 对密码进行校验
     */
    
    $(".l_old_password").bind("blur",function(){
    	var filter=/^[a-zA-Z0-9_]{5,18}$/;
    	var str = $(this).val();
		str = str.replace(/\s/g , '');//输入空格时自动忽略，\s表示空格
		if( $(this).val() == "" || $(this).val==null ){
			layer.tips('*密码不能为空', $(this));
    		$(this).focus();
    		ok_old_password=false;
		}else{
			if(filter.test( $(this).val() )){
				layer.tips('密码格式正确', $(this));
				ok_old_password=true;
			}else{
				layer.tips('*密码5-18字符 ,不能有特殊字符!', $(this));
				$(this).focus();
				ok_old_password=false;
			}
		}
    });
    
    $(".l_new_password").bind("blur",function(){
    	var filter=/^[a-zA-Z0-9_]{5,18}$/;
    	var str = $(this).val();
		str = str.replace(/\s/g , '');//输入空格时自动忽略，\s表示空格
		if( $(this).val() == "" || $(this).val==null ){
			layer.tips('*密码不能为空', $(this));
    		$(this).focus();
    		ok_new_password=false;
		}else{
			if(filter.test( $(this).val() )){
				layer.tips('密码格式正确', $(this));
				ok_new_password=true;
			}else{
				layer.tips('*密码5-18字符 ,不能有特殊字符!', $(this));
				$(this).focus();
				ok_new_password=false;
			}
		}
    });
    
    /**
     * 对重复密码校验
     */
    $(".l_re_new_password").bind("blur",function(){
    	var filter=/^[a-zA-Z0-9_]{5,18}$/;
    	var str = $(this).val();
		str = str.replace(/\s/g , '');//输入空格时自动忽略，\s表示空格
		if( $(this).val() == "" || $(this).val==null ){
			layer.tips('*重复密码不能为空', $(this));
    		$(this).focus();
    		ok_re_new_password=false;
		}else{
			if(filter.test( $(this).val() )){
				 
				if($(this).val()!=$(".l_new_password").val()){
					layer.tips('*两次填写的密码不一致!', $(this));
					$(this).focus();
				}else{
					layer.tips('重复密码正确!', $(this));
					ok_re_new_password=true;
				}
			 
			}else{
				layer.tips('*重复密码5-18字符 ,不能有特殊字符!', $(this));
				$(this).focus();
				ok_re_new_password=false;
			}
		}
    	
    });
 

    //执行修改
    
    $("form").eq(0).bind("submit",function(e){
    	
    	//阻止自动提交
    	e.preventDefault();
    	
    	//xalert(ok_username +" - "+ok_email+" - "+ok_password+" - "+ok_re_password);
    	var uid=$(".uid").val();
    	var userName=$(".l_username").val();
    	var email=$(".l_email").val();
    	var old_password=$(".l_old_password").val();
        var new_password=$(".l_new_password").val();  
    	if(ok_username==true && ok_email ==true && ok_old_password ==true && ok_new_password==true && ok_re_new_password ==true){
    		
    		
    		 
    		//start
    		$.ajax({
				type:'post',
				dataType:'text',
				url:CTPPATH+"/admin/user/update",
				data:{"uid":uid,"userName":userName,"oldPassword":old_password,"newPassword":new_password},
			
				beforeSend:function(){
					//显示正在加载
					layer.msg('正在修改密码');
				},
				success:function(data){

					//关闭正在加载
					setTimeout(function(){
						  layer.closeAll('loading');
					}, 1000);
					
					//代表用户名可用
					if(data==1){
						layer.msg('恭喜！用户信息修改成功',{time:4000});
						
					}else if(data==0){
						//代表用户名不可用
						layer.msg('*抱歉，用户的原始密码输入错误，请核对后再输入！',{time:4000});
						
					}else{
						layer.msg('*抱歉，用户信息修改失败！',{time:4000});
					}
				},
				error:function(){

					//关闭正在加载
					setTimeout(function(){
						  layer.closeAll('loading');
					}, 1000);
					layer.msg("出错了", {icon: 2,time:2000});
				}
			});
    		
    	//end	
    	}else{
    		layer.msg("用户信息验证失败，请将信息填写正确后再提交！");
    	}
    	
    });
    
    
    
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
					   inHtml+="<div class='search-content'><p>学生列表</p><div class='search-content-t'><ul>"; 
				  }
				  
					$.each(data,function(id,item){
						 if(item.length!=0){
						    inHtml="<li><a href='javascript:void(0);' data-userid='"+item.id+"'>"+item.userName+"</a></li>";
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