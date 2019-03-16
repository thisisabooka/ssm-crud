<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- <link rel="icon" href="../../../../favicon.ico"> -->

    <title>修改页</title>

    <!-- Bootstrap core CSS -->
    <link href="${APP_PATH }/asserts/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${APP_PATH }/asserts/css/dashboard.css" rel="stylesheet">

  </head>

  <body>
    <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
      <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#"><%=session.getAttribute("loginUser") %></a>
      <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
      <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
          <a class="nav-link" href="${APP_PATH }/login.jsp">退出登录</a>
        </li>
      </ul>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
            <ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link active" href="${APP_PATH }/list">
                  <span data-feather="home"></span>
                  	商品管理 <span class="sr-only">(current)</span>
                </a>
              </li>
            </ul>
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
            <h1 class="h2">修改商品信息</h1>
          </div>
          
          <!-- 发送PUT请求修改商品数据 -->
			<form action="${APP_PATH }/product" method="post">
				<input type="hidden" name="_method" value="put">
				<input type="hidden" name="productId" value="${product.productId }">
				<div class="form-group">
					<label>ProductName</label> <input name="productName" type="text" class="form-control" value="${product.productName }"
						placeholder="">
				</div>
				<div class="form-group">
					<label>ProductPrice</label> <input name="productPrice" type="text" class="form-control" value="${product.productPrice }"
						placeholder="">
				</div>
				<div class="form-group">
					<label>ProductDescription</label> <input name="productDescription" type="text" class="form-control" value="${product.productDescription }"
						placeholder="">
				</div>
				<button type="submit" class="btn btn-primary">修改</button>
			</form>


			</main>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="${APP_PATH }/js/jquery-3.2.1.slim.min.js"></script>
    <script type="text/javascript" src="${APP_PATH }/js/popper.min.js"></script>
    <script type="text/javascript" src="${APP_PATH }/js/bootstrap.min.js"></script>

    <!-- Icons -->
    <script src="${APP_PATH }/js/feather.min.js"></script>
    <script>
      feather.replace()
    </script>


  </body>
</html>