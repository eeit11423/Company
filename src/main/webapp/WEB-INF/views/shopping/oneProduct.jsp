<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>shopping</title>
</head>
<body>
<h1>${{memberBean.memberName}}</h1>
<form action='addToCart' method='POST'>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h2>shopping詳細資料</h2>
			</div>
		</div>
	</section>
		<section class="container">
		<div class="row">
			<div class="col-md-5">
               
				<p>購物ID:${shoppingBean.shoppingId}</p>
				<p>照片名稱:${shoppingBean.shoppingfileName}</p>
				<p>
					照片<img width='300' height='300'
						src='picture/${shoppingBean.shoppingId}' />
				</p>
				<p>員工編號:${shoppingBean.memberNumber}</p>
				<p>商品名稱:${shoppingBean.shoppingname}</p>
				<p>商品編號:${shoppingBean.shoppingItemId}</p>
				<p>商品總數:${shoppingBean.shoppingProductTotal}</p>
				<p>商品價格:${shoppingBean.shoppingProductPrice}</p>
				<p>商品種類:${shoppingBean.shoppingType}</p>		
				<p>商品敘述:${shoppingBean.productrelation}</p>		
				
				
				

				<p>折扣:${shoppingBean.shoppingProductDiscount}</p>
				<p>上傳時間:${shoppingBean.shoppingDate}</p>
				  <label>購買數量</label> <input type='text'  name='orderItemsNumber' >
				<div>
					<a href="<spring:url value='/shopping/allProducts' />"
						class="btn btn-default"> <span
						class="glyphicon-hand-left glyphicon"></span>返回
					</a>
<%-- 					 <a href='oneProduct/join?shoppingId=${shoppingBean.shoppingId}' --%>
<!-- 						class='btn btn-warning btn-large'> <span -->
<!-- 						class='glyphicon-shopping-cart glyphicon'></span>加入購物車 -->
<!-- 					</a> -->
                <input type='hidden'  name='shoppingId' value='${shoppingBean.shoppingId}'> 
             
				<input type='hidden'  name='page' value='secondPage'>
					<input class='btn btn-warning btn-large' type='submit' value='加入購物車' >
				</div>
			</div>
		</div>
        
	</section>
	</form>
</body>
</html>
