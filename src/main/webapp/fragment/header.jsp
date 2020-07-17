<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/images/logo2.png" />
<!-- CSS文件載入 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<!-- js文件載入 -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>

<header class="container-fluid">
		<nav class="navbar navbar-expand-lg navbar-light bg-white">
			<a class="navbar-brand" href="index.html"> <img
				src="${pageContext.request.contextPath}/images/logo2.png" alt="logo2">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link"
						href="<c:url value='/' />">首頁</a></li>	

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown"> 會員系統 </a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="<c:url value='/register/add' />">會員註冊</a> <a
								class="dropdown-item" href="<c:url value='/members' />">查詢會員資料</a>
						</div></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown"> 產品商城 </a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="<c:url value='/shopping/allProducts' />">查詢所有產品資料</a>
							<a class="dropdown-item" href="<c:url value='/products/add' />">新增產品資料</a>
							<a class="dropdown-item" href="<c:url value='/shoppingCart' />">購物車</a>
							<a class="dropdown-item" href="<c:url value='/orderList/list' />">訂單資訊</a>
							<a class="dropdown-item" href="<c:url value='/shoppingChange1' />">全部分類</a>
							<a class="dropdown-item" href="<c:url value='/shoppingChange' />">大項Ajax分類</a>
						</div></li>


					<li class="nav-item"><a class="nav-link" href="<c:url value='/activity/index' />">活動資訊</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="<c:url value='rearend/allSalary' />">圖表分析</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="contact.html">連絡我們</a>
					</li>
	

				</ul>
				<div class="ml-auto">
				<span><c:if
							test="${memberBean.memberId != null}">
							<img height='40' width='25'
								src="<c:url value='/getPicture/${memberBean.memberId}' />" />
						</c:if>${memberBean.memberNumber}</span>
					<a href="<c:url value='/login' />"
						class="btn btn-outline-secondary text-secondary my-2 my-sm-0">登入</a> <a
						href="<c:url value='/loginout' />"
						class="btn btn-outline-secondary text-secondary my-2 my-sm-0">登出</a> <a
						href="<c:url value='/register/add' />"
						class="btn btn-outline-secondary text-secondary my-2 my-sm-0">註冊</a>
				</div>
			</div>
		</nav>
	</header>