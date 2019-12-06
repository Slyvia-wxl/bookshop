<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <head>
    
    <title>注册成功</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
  
  <body>
 <div class="block" style="padding-top:50px;text-align:center">
            <span>注册成功！<span id="code">3</span>秒后跳转到登录页面</span>
       </div>
       <script type="text/javascript">
        function count(){
            obj=document.getElementById('code');
            s=3;
            setInterval(function(){
               obj.innerHTML=s--;
               if(s==0){
                  window.location.href='/bookshop/jsps/user/login-regist.jsp';
               }
            },1000);
        }
    count();
</script>
  </body>
</html>
