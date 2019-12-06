<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>分类列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/bootstrap.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/font-awesome.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/adminjsps/admin/css/style.css'/>"> 

  </head>
  <style>
  	.content-panel{
  		padding:20px;
  	}
  	.content-panel h4{
  		display:inline-block
  	}
  	.editparent{
  		float:right;
  		margin: 11px 20px;
  	}
  </style>
  <body>
  <h2 style="text-align: center;">分类列表</h2>
    	 <h4 align="center"><a href="<c:url value='/adminjsps/admin/category/add.jsp'/>">添加一级分类</a></h3> 
  
  	<c:forEach items="${parents }" var="parent"> 
  	<div class="mt"> 
          <div class="col-md-12">
            <div class="content-panel">
              <table class="table table-striped table-advance table-hover">
                <h4>${parent.cname }</h4>
                <div class="editparent">
                	<span>
                		<a href="<c:url value='/admin/AdminCategoryServlet?method=addChildPre&pid=${parent.cid }'/>">添加二级分类</a>
                	</span>
                	<a href="<c:url value='/admin/AdminCategoryServlet?method=editParentPre&cid=${parent.cid }'/>">
                		<button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                	</a>
                	<a onclick="return confirm('您是否真要删除该一级分类？')" href="<c:url value='/admin/AdminCategoryServlet?method=deleteParent&cid=${parent.cid }'/>">
                		<button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
                	</a>
                </div>
                <hr>
                <thead>
                  <tr>
                    <th><i class="fa fa-bullhorn"></i> 分类</th>
                    <th class="hidden-phone"><i class="fa fa-question-circle"></i> 描述</th> 
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${parent.children }" var="child">
                  <tr>
                    <td>
                      <a href="#">${child.cname }</a>
                    </td>
                    <td class="hidden-phone">${child.desc }</td>
                    <td>
                    	<a href="<c:url value='/admin/AdminCategoryServlet?method=editChildPre&cid=${child.cid }'/>">
                      		<button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                    	</a>
                    	<a onclick="return confirm('您是否真要删除该二级分类？')" href="<c:url value='/admin/AdminCategoryServlet?method=deleteChild&cid=${child.cid }'/>">                    	
                      		<button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
                    	</a>
                    </td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
		   </div>
          </div>
          </c:forEach>
       
  </body>
</html>
