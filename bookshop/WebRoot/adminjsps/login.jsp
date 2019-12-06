<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>管理员登录页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/bootstrap.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/font-awesome.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/adminjsps/admin/css/style.css'/>">
	
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<style type="text/css">
	body{
		background:url(/bookshop/images/login-bg.jpg);
		background-size:100%;
	}
	form{
		width:30%;
		margin:80px auto;
	}
	.form-login-heading{
		color:#fff;
		text-align:center;
	}
	.form-control{
		border-radius:20px;
		margin:20px 0 10px 0;
		padding:10px;
		letter-spacing:1px;
		text-align:center;
	}
	.btn-block{
		border-radius:20px;
		background-color:#3083eb;
		color:#fff;
	}
	</style>
	<script type="text/javascript">
		function checkForm() {
			if(!$("#adminname").val()) {
				alert("管理员名称不能为空！");
				return false;
			}
			if(!$("#adminpwd").val()) {
				alert("管理员密码不能为空！");
				return false;
			}
			return true;
		}
	</script>
  </head>
  
  <body>
  <div id="login-page">
    <div class="container">
      <form action="<c:url value='/AdminServlet'/>" method="post" onsubmit="return checkForm()" target="_top">
      <input type="hidden" name="method" value="login"/>
        <h2 class="form-login-heading">管 理 员 登 录</h2>
        <div class="login-wrap">
          <input type="text" class="form-control" name="adminname"  id="adminname" placeholder="User ID" autofocus autocomplete="off">
          <input type="password" class="form-control" name="adminpwd" id="adminpwd" placeholder="Password" autocomplete="off">
          <br>
          <button class="btn btn-theme btn-block" type="submit"><i class="fa fa-lock"></i>&nbsp;&nbsp;后 台 登 录 </button>
          <hr>

        </div>

      </form>
    </div>
  </div>

  </body>
</html>
