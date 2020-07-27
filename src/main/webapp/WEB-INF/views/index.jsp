<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>付酬者有限公司員工內部網</title>
</head>
<body>
	<jsp:include page="/fragment/header.jsp" />

	<section class="container-fluid">
		<div class="row">
			<div id="carouselBanner" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
				<c:forEach var='indexBean' items='${indexBean}' varStatus="vs">
					<li data-target="#carouselBanner" data-slide-to="${vs.index}" ></li>
			
					</c:forEach>
				</ol>
				<div class="carousel-inner">

				<c:forEach var='indexBean' items='${indexBean}' varStatus="vs">
						<c:choose>
							<c:when test="${vs.index eq 0}" >
								<div class="carousel-item active">
							</c:when>
							<c:otherwise>
								<div class="carousel-item">
							</c:otherwise>
						</c:choose>
						<img class="d-block w-100"
							src='${pageContext.request.contextPath}/index/picture/${indexBean.indexId}'
							alt="First slide">
						<div class="carousel-caption d-none d-md-block text-light">
                            <h2>${indexBean.indexH2}</h2>
                            <p style="font-size: 18pt">${indexBean.indexP}</p>

						</div>
				</div>
				</c:forEach>
			</div>
			<a class="carousel-control-prev" href="#carouselBanner" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselBanner"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		</div>
	</section>

	<!-- 頁腳/start -->
	<footer class="bg-dark">
		<div class="container pt-3 pb-3">
			<div class="row">
				<!-- 版權所有/start -->
				<div class="col-12 mt-3">
					<p class="text-white text-center" style="font-size: 20pt">©
						Copyright 2020 付酬者有限公司</p>
				</div>
				<!-- 版權所有/end -->
			</div>
		</div>
	</footer>
</body>
</html>