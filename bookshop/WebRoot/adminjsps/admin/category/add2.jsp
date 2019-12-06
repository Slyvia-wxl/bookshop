<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加分类</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/bootstrap.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/adminjsps/admin/css/style.css'/>"> 
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript">
		function checkForm() {
			if(!$("#cname").val()) {
				alert("分类名不能为空！");
				return false;
			}
			if(!$("#pid").val()) {
				alert("一级分类不能为空！");
				return false;
			}
			if(!$("#desc").val()) {
				alert("分类描述不能为空！");
				return false;
			}
			return true;
		}
	</script>

  </head>
  
  <body>
  
  <div class="row mt">
          <div class="col-lg-12">
            <h4 align="center"><i class="fa fa-angle-right"></i>${parent.cname } 分类修改</h4>
            <div class="form-panel">
              <div class=" form"> 
                <form class="cmxform form-horizontal style-form" onsubmit="return checkForm()" method="post" action="<c:url value='/admin/AdminCategoryServlet'/>">
    				<input type="hidden" name="method" value='addChild'/>
                  <div class="form-group ">
                    <label for="cname" class="control-label col-lg-2">分类名称</label>
                    <div class="col-lg-10">
                    	<input class=" form-control" type="text" name="cname" id="cname"/> 
                    </div>
                  </div>
                  <div class="form-group ">
                  	<div class="col-lg-10">一级分类
						<select name="pid" id="pid">
							<option value="">===选择1级分类===</option>
							<c:forEach items="${parents }" var="parent">
    							<option value="${parent.cid }" <c:if test="${parent.cid eq pid }">selected="selected"</c:if> >${parent.cname }</option>
							</c:forEach>
    					</select>
    			 	 </div>
    			  </div>
                  <div class="form-group ">
                    <label for="ccomment" class="control-label col-lg-2">分类描述</label>
                    <div class="col-lg-10">
                    	<textarea class="form-control " id="desc" name="desc">${child.desc}</textarea>
                    </div>
                  </div>
                  <div class="form-group">
                  	<div class="col-lg-10">
                  		${msg }
                  	</div>
                  </div>
                  <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                    	<input class="btn btn-theme" type="submit" value="添加二级分类"/>
                    	<input class="btn btn-theme04" type="button" value="返回" onclick="history.go(-1)"/>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
 
        </div>

  </body>
</html>
