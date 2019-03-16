<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>登陆页面</title>
		
		
		<style type="text/css">    
     		body{    
        		background-image: url(./img/1.jpg);    
        		background-size:cover;  
     		}    
 		</style> 
		
		<!-- Bootstrap core CSS -->
    	<link href="${APP_PATH }/asserts/css/bootstrap.min.css" rel="stylesheet">
    	
		<!-- Custom styles for this template -->
		<link href="${APP_PATH }/asserts/css/signin.css" rel="stylesheet">
		
	</head>

	<body class="text-center">
	
		<form class="form-signin" action="${APP_PATH }/login" method="get">
			<img class="mb-4" src="${APP_PATH }/asserts/img/bootstrap-solid.svg" alt="" width="72" height="72">
			<h1 class="h3 mb-3 font-weight-normal">请登陆</h1>
			
			<label class="sr-only">用户名</label>
			<input type="text" name="username" class="form-control" placeholder="用户名" required="" autofocus=""/>
			
			<label class="sr-only">密码</label>
			<input type="password" name="password" class="form-control" placeholder="密码" required="">
			
			<button class="btn btn-lg btn-primary btn-block" type="submit">登陆</button><br><br>
			
			<a href="${APP_PATH }/registry.jsp" class="btn btn-lg btn-link">没有账号，注册一个吧</a>
			
			
			<p class="mt-5 mb-3 text-muted">© 2018-12-17</p>

		</form>

	</body>
</html>