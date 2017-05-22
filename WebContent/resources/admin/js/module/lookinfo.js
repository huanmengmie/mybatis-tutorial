$(function(){
	
	var ok_username=false;
	var ok_email=false;
	var ok_old_password=false;
	var ok_new_password=false;
    var ok_re_new_password=false;
    var DEFAULT_EMAIL="";
	$(".look-myself-btn").bind("click",function(){
		
		
		//获取用户信息
		$.ajax({
			type:'post',
			dataType:'json',
			url:CTPPATH+"/admin/user/findUserInfo",
			data:{"userName":DEFAULT_USERNAME},
		
			beforeSend:function(){
				//显示正在加载
				layer.load(2);
			},
			success:function(data){

				//关闭正在加载
				setTimeout(function(){
					  layer.closeAll('loading');
				}, 1000);
			   //获取信息
				$(".uid").val(data.id);
			    $(".l_username").val(data.userName);
			    $(".l_email").val(data.email);
			    $(".l_time").val(showLocale(data.addTime));
			    DEFAULT_USERNAME=data.userName;
			    DEFAULT_EMAIL=data.email;
				
			},
			error:function(){

				//关闭正在加载
				setTimeout(function(){
					  layer.closeAll('loading');
				}, 1000);
				layer.msg("出错了", {icon: 2,time:2000});
			}
		});
			
		
		
		$('.modalDialog').slideDown();
	    $('html').addClass('overHiden');
	  
	});
	
	$('.info-close').bind('click',function(){
		$('.modalDialog').slideUp();
		$('html').removeClass('overHiden');

    });
	
	
	if($(".l_username").val == DEFAULT_USERNAME){
		ok_username=true;
	}

	if($(".l_email").val() == DEFAULT_EMAIL){
		ok_username=true;
	}
	
    /**
     * 对用户名校验
     */
    $(".l_username").bind("blur",function(){
    	
    	if($(this).val() !=DEFAULT_USERNAME){
    	
    	
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
    	
      }
    });
    
    /**
     * 对邮箱校验
     */
    $(".l_email").bind("blur",function(){
    	
    	if($(this).val() != DEFAULT_EMAIL){
    		
    	
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
    	}
    });
    
    /**
     * 对密码进行校验
     */
    
    
    //如果都为空，则不进行验证，有一个不为空，需要全部验证通过
    
    if($(".l_old_password").val() ==""  && $(".l_new_password").val()=="" && $(".l_re_new_password").val() ==""){
    	ok_old_password=true;
    	ok_new_password=true;
    	ok_re_new_password=true;
    }
    
    if($(".l_old_password").val() !=""  ||  $(".l_new_password").val()!="" || $(".l_re_new_password").val() !=""){
    	ok_old_password=false;
    	ok_new_password=false;
    	ok_re_new_password=false;
    }
    
    $(".l_old_password").bind("blur",function(){
    	var filter=/^[a-zA-Z0-9_]{5,18}$/;
    	var str = $(this).val();
		str = str.replace(/\s/g , '');//输入空格时自动忽略，\s表示空格
		if($(".l_old_password").val() !=""  ||  $(".l_new_password").val()!="" || $(".l_re_new_password").val() !=""){
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
		if($(".l_old_password").val() !=""  ||  $(".l_new_password").val()!="" || $(".l_re_new_password").val() !=""){
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
		if($(".l_old_password").val() !=""  ||  $(".l_new_password").val()!="" || $(".l_re_new_password").val() !=""){
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
				data:{"uid":uid,"userName":userName,"email":email,"oldPassword":old_password,"newPassword":new_password},
			
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
});