<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>24小时不打烊书店</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">

	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/main.css'/>">
  </head>
  
  <body>
<div class="top">
			<iframe frameborder="0" src="<c:url value='/CategoryServlet?method=findAll'/>" name="top"></iframe>
		</div>

	<!-- 	<div class="content">
			<iframe frameborder="0" src="<c:url value='/jsps/body.jsp'/>" name="body"></iframe>
		</div> -->

  </body>
</html>
