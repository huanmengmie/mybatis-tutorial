<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!--个人信息-->
<div class="modalDialog " >
	<div>
		<a href="javascript:void(0);" title="关闭" class="close info-close" >X</a>
		<span class="openModal-title">我的个人信息</span>
        <div class="openModal-login">
            
            <div class="login-content login-form">
            <form action="">
                 <input type="hidden" class="uid" value=""/>
                 <label>
				    <input type="text" name="username" class="l_username" value="" required  autocomplete="off">
				</label>
				
				<label>
				    <input type="text" name="email" class="l_email" value="" required  autocomplete="off">
				</label>
				
				<label>
				    <input type="text" name="time" class="l_time" value="" readonly="readonly" required autocomplete="off">
				</label>
				
				<label>
				    <input type="password" name="old-password" class="l_old_password"  placeholder="Old Password" autocomplete="off">
				</label>
				
				<label>
				    <input type="password" name="new-password" class="l_new_password" placeholder="New Password" autocomplete="off">
				</label>
				<label>
				    <input type="password" name="re-new-password" class="l_re_new_password"  placeholder="Repeat New Password" autocomplete="off">
				</label>
				
				<input type="submit" value="点击修改" >
		       </form>	 
            </div> 
            
          
        </div>       
		
	</div>
</div>