<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <title>注册页面</title>
  <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
  <link href="${APP_PATH }/asserts/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
     padding-top: 100px;
     padding-bottom: 100px;
     background-color: #eee;
     background-image: url(./img/2.jpg);    
     background-size:cover; 
    }

    .form-signin {
     max-width: 330px;
     padding: 15px;
     margin: 0 auto;
    }
  </style>
</head>
<body>
	<div class="container">
		<form class="form-signin" action="${APP_PATH }/user" method="post">
			<h2 class="form-signin-heading">请注册</h2>
			
			<label for="forUsername" class="sr-only">用户名</label> <br>
			<input type="text" name="username" id="forUsername" class="form-control"
				placeholder="请输入用户名" required autofocus> <br> 
				
			<label for="forTruename" class="sr-only">真实姓名</label> 
			<input type="text" name="truename" id="forTruename"
				class="form-control" placeholder="请输入真实姓名" required> <br>
			
			<label for="forAge" class="sr-only">年龄</label> 
			<input type="text" name="age" id="forAge"
				class="form-control" placeholder="请输入年龄" required> <br>

			<div class="radio">
				性别&nbsp;&nbsp;&nbsp;
				<label> <input type="radio" name="sex"
					id="sex" value="0" checked> 女
				</label>
				<label> <input type="radio" name="sex"
					id="sex" value="1"> 男
				</label> 
			</div>
				
				<label for="forPassword" class="sr-only">密码</label> 
				<input type="password" name="password" id="forPassword"
					class="form-control" placeholder="请输入密码" required> <br>

				<button type="submit" class="btn btn-lg btn-primary btn-block">注册</button><br><br>
				
				<a href="${APP_PATH }/login.jsp" class="btn btn-lg btn-link">已有账号，快去登录吧</a>
			
		</form>
	</div>
</body>
</html>