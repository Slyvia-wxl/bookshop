<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>按图名查询</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/font-awesome.min.css'/>">
<style type="text/css">
	body,form{
		margin:0;
	}
	input {
		width: 200px;
		height: 42px;
		border-style:solid;
		margin:0px;
		border-color: #ededed;
		border-radius:50px;
		outline:none;
		padding:0 20px;
	}
	.fa-search{
		position:absolute;
		right:15%;
		top:25%;
		color:#000;
	}
</style>
  </head>
  
  <body>
   <form action="<c:url value='/BookServlet'/>" method="get" target="blank" id="form1">
    	<input type="hidden" name="method" value="findByBname"/>
    	<input type="text" name="bname"/>
    	<span>
    		<a href="javascript:document.getElementById('form1').submit();" >
    		<i class="fa fa-search fa-lg"></i>
    		</a>
    		<!-- <a href="<c:url value='/jsps/gj.jsp'/>" style="font-size: 10pt; color: #404040;" target="body">高级搜索</a> -->
    	</span>
    </form>
  </body>
</html>
