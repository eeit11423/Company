<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Product</title>
</head>
<body> 
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h2>產品資料</h2>
			</div>
		</div>
	</section>
	<section class="container">
		<div class="row">
			<div class="col-md-5">
			<img width='100' height='200'
                src="<c:url value='/getPicture/${product.trainingId}'/>"/>
				<h3>${product.trainingCourse}</h3>
				<p>課程介紹: ${product.elaborate}</p>				
				<p>學分: ${product.trainingCredit}</p>

				<p>課程來源: ${product.companyBean.name}</p>

				<p>
					<strong>課程編號: </strong> <span class='label label-warning'>
						${product.trainingId} </span>
				</p>
				<div>
					<figure>
						<iframe src="<c:url value='${product.URLUpload}'/>" 
							width=400 height=300 frameborder="0" allowfullscreen></iframe>			   
					</figure>
				</div>
				
				<p>
					<a href="<spring:url value='/products' />" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span>返回
					</a> 
					<a href='#' class='btn btn-warning btn-large'> 
					    <span class='glyphicon-shopping-cart glyphicon'></span>選課
					</a>
					
				</p>
				
                    
<%--                     <a class='deletelink' href="delete/${product.trainingId}">刪除</a> --%>
<%--                     <a class='updatelink' href="update/${product.trainingId}">修改</a> --%>
                    
			</div>
		</div>
	</section>
</body>
</html>
