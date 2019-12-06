<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    
    <title>登录——注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/user/login-regist.css'/>">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.11.3.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jsps/js/user/login-regist.js'/>"></script>
	<script type="text/javascript">
	$(function(){
		var username = window.decodeURI("${cookie.username.value}");
		if("${requestScope.user.loginname}"){
			username = "${requestScope.user.loginname}" 
		} 
		${"#username"}.val(username);//在用户名文本框中显示cookie中保存的loginname
	});
</script>
	
  </head>
  
    <div class="jq22-container" style="padding-top:50px">
		<div class="login-wrap">
			<div class="login-html">
				<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">登 录</label>
				<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">注 册</label>
				
				 <div class="login-form"> 
				 <form action="<c:url value='/UserServlet'/>" method="post" id="loginForm">
				 	<input type="hidden" name="method" value="login"/>
					<div class="sign-in-htm">
						<div class="group">
							<input id="username" name="loginname" type="text" class="inputClass" placeholder="用户名" value="${user.loginname }" autocomplete="off">
							<label class="label errorClass" id="usernameError">${msg }</label>
						</div> 
						<div class="group">
							<input id="password" name="loginpass" type="password" class="inputClass" data-type="password" value="${user.loginpass }" placeholder="密码" autocomplete="off">
							<label class="label errorClass" id="passwordError"></label>
						</div>
						<div class="group">
							<input id="verifyCode" type="text" name="verifyCode" class="input inputClass" placeholder="验证码" autocomplete="off" value="${user.verifyCode }">
							<div id="divVerifyCode"><a href="javascript:_hyz()"><img id="imgVerifyCode" src="<c:url value='/VerifyCodeServlet'/>"/></a></div>
							<label class="label errorClass" id="verifyCodeError" id="verifyCodeError">${errors.verifyCode}</label>
						</div>
						<div class="group">
							<input id="check" type="checkbox" class="check" checked>
							<label for="check"><span class="icon"></span>记住我</label>
						</div>
						<div class="group">
							<input type="submit" class="button" value="登 录">
						</div>
						<div class="hr"></div>
						<div class="foot-lnk">
							<a href="#forgot">忘记密码?</a>
						</div>
					</div> 
				</form>
				
				
				<form action="<c:url value='/UserServlet'/>" method="post"  id="registForm" >
					<input type="hidden" name="method" value="regist"/>
					<div class="sign-up-htm">
						<div class="group">
							<input id="loginname" name="loginname" type="text" class="inputClass" placeholder="用户名" autocomplete="off" value="${form.loginname }">
							<label class="label errorClass" id="loginnameError">${errors.loginname}</label>
						</div>
						<div class="group">
						<input id="loginpass" name="loginpass" type="password" class="inputClass" data-type="password" placeholder="密码" autocomplete="off" value="${form.loginpass }" onBlur="CheckPw()">
							<label class="label errorClass" id="loginpassError">${errors.loginpass}</label>
						</div>
						<div class="group">
						<input id="reloginpass" name="reloginpass" type="password" class="inputClass" data-type="password" placeholder="确认密码" autocomplete="off" value="${form.reloginpass }" onBlur="CheckR_Pw()">
							<label class="label errorClass" id="reloginpassError">${errors.reloginpass}</label>
						</div>
						<div class="group">
							<input id="email" name="email" type="text" class="inputClass" placeholder="邮箱" autocomplete="off" value="${form.email }" onBlur="CheckEmail()">
							<label class="label errorClass" id="emailError">${errors.email}</label>
						</div>
						<div class="group">
							<input type="submit" class="button" value="注 册">
						</div>
						<div class="hr"></div>
						<div class="foot-lnk">
							<label for="tab-1">Already Member?</a>
						</div>
					</div>
				</form>	
				</div>
			</div>
		</div>
	</div>
	
  </body>
</html>
