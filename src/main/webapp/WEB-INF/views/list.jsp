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

    <title>列表</title>

    <!-- Bootstrap core CSS -->
    <link href="${APP_PATH }/asserts/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${APP_PATH }/asserts/css/dashboard.css" rel="stylesheet">
    
    <!-- jquery.js -->
    <script type="text/javascript" src="${APP_PATH }/jquery/jquery-3.3.1.min.js"></script>

  </head>

  <body>
    <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
      <a class="navbar-brand col-sm-3 col-md-2 mr-0" href=""><%=session.getAttribute("loginUser") %></a>
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
            <h1 class="h2">商品列表</h1>
          </div>
			<h2>
				<a class="btn btn-sm btn-success" href="${APP_PATH }/product">商品添加</a>
			</h2>
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<thead>
						<tr>
							<th>ID</th>
							<th>productName</th>
							<th>productPrice</th>
							<th>productDescription</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pageInfo.list }" var="product">
							<tr>
								<th>${product.productId }</th>
								<th>${product.productName }</th>
								<th>${product.productPrice }</th>
								<th>${product.productDescription }</th>
								<th>
									<a class="btn btn-primary btn-sm" href="${APP_PATH }/product/${product.productId}">
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
										编辑
									</a>
									<button del_uri="${APP_PATH }/product/${product.productId}" class="btn btn-danger btn-sm deleteBtn">
										<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
										删除
									</button>
								</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<!-- 显示分页信息 -->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
					<!--分页文字信息  -->
					<div class="col-md-6">当前第${pageInfo.pageNum }页,总${pageInfo.pages }页,总${pageInfo.total }条记录</div>

					<!-- 分页条信息 -->
					<div class="col-md-6">
						<nav aria-label="Page navigation">
							<ul class="pagination">
								<li class="page-item"><a href="${APP_PATH }/list?pn=1" class="page-link">首页</a></li>
								<c:if test="${pageInfo.hasPreviousPage }">
									<li class="page-item"><a href="${APP_PATH }/list?pn=${pageInfo.pageNum-1}" class="page-link"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>
								<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
									<c:if test="${page_Num == pageInfo.pageNum }">
										<li class="active page-item"><a href="#" class="page-link">${page_Num }</a></li>
									</c:if>
									<c:if test="${page_Num != pageInfo.pageNum }">
										<li class="page-item"><a href="${APP_PATH }/list?pn=${page_Num }" class="page-link">${page_Num }</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${pageInfo.hasNextPage }">
									<li class="page-item"><a href="${APP_PATH }/list?pn=${pageInfo.pageNum+1 }" class="page-link"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:if>
								<li class="page-item"><a href="${APP_PATH }/list?pn=${pageInfo.pages}" class="page-link">末页</a></li>
							</ul>
						</nav>
					</div>
				</div>

			</div>
			</main>
			<form id="deleteProductForm" method="post">
				<input type="hidden" name="_method" value="delete" />
			</form>
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
	
	<!-- 删除一个商品信息 -->
	<script>
		$(".deleteBtn").click(function(){
			$("#deleteProductForm").attr("action",$(this).attr("del_uri")).submit();
			return false;
		});
	</script>

  </body>
</html>