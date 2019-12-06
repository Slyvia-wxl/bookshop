<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/bootstrap.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/adminjsps/admin/css/style.css'/>"> 
	<!--<link rel="stylesheet" type="text/css" href="<c:url value='/adminjsps/admin/css/book/left.css'/>">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/menu/mymenu.js'/>"></script>
	<link rel="stylesheet" href="<c:url value='/menu/mymenu.css'/>" type="text/css" media="all">
	 <script language="javascript">

var bar = new Q6MenuBar("bar", "传智播客网上书城");
$(function() {
	bar.colorStyle = 2;
	bar.config.imgDir = "<c:url value='/menu/img/'/>";
	bar.config.radioButton=true;

<c:forEach items="${parents}" var="parent">
  <c:forEach items="${parent.children}" var="child">
	bar.add("${parent.cname}", "${child.cname}", "/bookshop/admin/AdminBookServlet?method=findByCategory&cid=${child.cid}", "body");
  </c:forEach>
</c:forEach>
	
	$("#menu").html(bar.toString());
});
</script>
  </head>
  
  <body onload="load()">
<div id="menu"></div>-->
<body>


    <aside>
      <div id="sidebar" class="nav-collapse ">
        <ul class="sidebar-menu" id="nav-accordion">

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

<script type="text/javascript" src="<c:url value='/adminjsps/admin/js/jquery.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/adminjsps/admin/js/bootstrap.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/adminjsps/admin/js/jquery.dcjqaccordion.2.7.js'/>"></script>
<script type="text/javascript" src="<c:url value='/adminjsps/admin/js/jquery.scrollTo.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/adminjsps/admin/js/jquery.nicescroll.js'/>"></script>
<script type="text/javascript" src="<c:url value='/adminjsps/admin/js/common-scripts.js'/>"></script> 
  </body>
</html>
