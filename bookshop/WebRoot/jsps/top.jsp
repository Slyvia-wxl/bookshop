<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>top</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">

	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/bootstrap.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/main_styles.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/top.css'/>"> 
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/font-awesome.min.css'/>">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
  </head>  
  <body>
 <div style="font-size: 10pt; line-height: 40px;background:#000;height:40px">
	<div style="float:right;padding:0 20px">
		<c:choose>
			<c:when test="${empty sessionScope.sessionUser }">
		  			<a href="<c:url value='/jsps/user/login-regist.jsp'/>" target="_parent">登录</a> |&nbsp; 
		  			<a href="<c:url value='/jsps/user/login-regist.jsp'/>" target="_parent">注册</a>
			</c:when>
			<c:otherwise>
		    	 	 会员：${sessionScope.sessionUser.loginname }&nbsp;&nbsp;|&nbsp;&nbsp;
		  			<a href="<c:url value='/CartItemServlet?method=myCart'/>" target="blank">我的购物车</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		  			<a href="<c:url value='/OrderServlet?method=myOrders'/>" target="body">我的订单</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		  			<a href="<c:url value='/UserServlet?method=quit'/>" target="_parent">退出</a>	
			</c:otherwise>
		</c:choose>
	</div>
</div>

<header class="header" style="position:relative">
		<div class="header_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="header_content d-flex flex-row align-items-center justify-content-start">
							<div class="logo"><a href="#">24小时不打烊书店.</a></div>
							   <nav class="main_nav">
								<ul>					
									<c:forEach items="${parents}" var="parent">
										<li class="hassubs">
											<a>${parent.cname}</a>
											<ul>
 												<c:forEach items="${parent.children}" var="child">							
 													<li><a href="/bookshop/BookServlet?method=findByCategory&cid=${child.cid}" target="blank">${child.cname}</a></li>
  												</c:forEach>
  											</ul>
  										</li>
									</c:forEach>
								</ul>
							</nav>
						
							<div class="search">
									<iframe frameborder="0" src="<c:url value='/jsps/search.jsp'/>" name="search"></iframe>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		 <div class="banner">
			<ul>
      			<li><img src="<c:url value='/images/banner3.png'/>"/><div class="button button_light home_button"><a href="#">Shop Now</a></div></li>
      			<li><img src="<c:url value='/images/banner4.png'/>"/><div class="button button_light home_button"><a href="#">Shop Now</a></div></li>
    		</ul>
    		<div class="con"></div>
    
		</div>
	<script type="text/javascript" src="<c:url value='/js/banner.js'/>"></script>
</header>	
  </body>
</html>
