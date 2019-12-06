<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>top</title>
    <base target="body">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/bootstrap.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/adminjsps/admin/css/style.css'/>">

  </head>
 <body>

    <header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
      <a class="logo"><b>网上图书商城 <span>后台管理</span></b></a>
      <div class="nav notify-row" id="top_menu">
      	<ul class="nav top-menu">
      		<li style="color:#fff !important;padding:5px 20px 5px;">管理员：${sessionScope.admin.adminname }</li>
      		<li><a href="<c:url value='/admin/AdminCategoryServlet?method=findAll'/>">分类管理</a></li>
			<li><a href="<c:url value='/admin/AdminOrderServlet?method=findAll'/>">订单管理</a></li>
			<li><a href="<c:url value='/admin/AdminBookServlet?method=addPre'/>">添加图书</a></li>
			
      	</ul>
      </div>
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <li><a class="logout" href="<c:url value='/adminjsps/login.jsp'/>">退出</a></li>
        </ul>
      </div>
    </header>

  <aside>
      <div id="sidebar" class="nav-collapse ">
        <ul class="sidebar-menu" id="nav-accordion">
         <p class="centered"><img src="/bookshop/images/apple-touch-icon.png" class="img-circle" width="80"></p>
          <h5 class="centered">图书管理</h5>
          <c:forEach items="${parents}" var="parent">
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-desktop"></i>
              <span>${parent.cname}</span>
              </a>
            <ul class="sub">
            <c:forEach items="${parent.children}" var="child">	
              <li><a href="/bookshop/admin/AdminBookServlet?method=findByCategory&cid=${child.cid}">${child.cname}</a></li>
			</c:forEach>
            </ul>
          </li>
          </c:forEach>
        </ul>
      </div>
    </aside>
  
<!-- <body style="background: rgb(78,78,78);color: #fff;">
<h1 style="text-align: center; line-height: 30px;">网上书城系统后台管理</h1>
<div style="line-height: 10px;">
	<span>管理员：${sessionScope.admin.adminname }</span>
	<a target="_top" href="<c:url value='/adminjsps/login.jsp'/>">退出</a>
	<span style="padding-left:50px;">
		<a href="<c:url value='/admin/AdminCategoryServlet?method=findAll'/>">分类管理</a>
		<a href="<c:url value='/adminjsps/admin/book/main.jsp'/>">图书管理</a>
		<a href="<c:url value='/admin/AdminOrderServlet?method=findAll'/>">订单管理</a>
	</span>
</div> -->
<script type="text/javascript" src="<c:url value='/adminjsps/admin/js/jquery.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/adminjsps/admin/js/bootstrap.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/adminjsps/admin/js/jquery.dcjqaccordion.2.7.js'/>"></script>
<script type="text/javascript" src="<c:url value='/adminjsps/admin/js/jquery.scrollTo.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/adminjsps/admin/js/jquery.nicescroll.js'/>"></script>
<script type="text/javascript" src="<c:url value='/adminjsps/admin/js/common-scripts.js'/>"></script>
  </body>
</html>
