<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type='text/javascript'
	src='${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js'></script>
<title></title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/style.css' type="text/css" />
</head>
<body>
	<div align='center'>
		<h3>商品全部清單</h3>
		<a href="<c:url value='/'/> ">回前頁</a>
		<a href="<c:url value='../shoppingCart'/> ">購物車</a>
		<hr>
				<div align='center'>
				商品類型: <select id='Publish_shoppingType' onchange="memberChange()" >
					<c:forEach var="shoppingType1" items="${AllShoppingType}">
						<option value="${shoppingType1}">${shoppingType1}</option>
					</c:forEach>
				</select>
			</div>
				</div>
		
			
			
		<hr>
		<form method='POST'>
			<input type='hidden' name='_method' value='DELETE'>
		</form>

		<c:choose>
			<c:when test="${empty products}">
	    沒有任何會員資料<br>
			</c:when>
			<c:otherwise>
			<div class="row" id='testshow'>
				<table border='1' cellpadding="3" cellspacing="1">
					<tr>
						<th width='56'>購物ID</th>
						<th width='140'>員工編號</th>
						<th width='180'>商品名稱</th>
						<th width='130'>商品編號</th>
						<th width='64'>商品總數</th>
						<th width='56'>商品價格</th>
						<th width='180'>類型</th>
						<th width='180'>照片名稱</th>
						<th>照片</th>

						<th width='180'>折扣</th>
						<th width='180'>商品敘述</th>
						<th width='180'>上傳時間</th>
						<th colspan='2' width='72'>資料維護</th>
					</tr>
					
					<c:forEach var='product' items='${products}'>
						<tr  id="testshow">
							<td style="text-align: center"><a
								href="<spring:url value='oneProduct?id=${product.shoppingId}' />">${product.shoppingId}</a>
							</td>
							<td>${product.memberNumber}</td>
							<td>${product.shoppingname}</td>
							<td style="text-align: center">${product.shoppingItemId}</td>
							<td style="text-align: right">${product.shoppingProductTotal}</td>
							<td style="text-align: right">${product.shoppingProductPrice}</td>
							<td style="text-align: center">${product.shoppingType}</td>
							<td style="text-align: center">${product.shoppingfileName}</td>
							<td><img width='60' height='72'
								src='picture/${product.shoppingId}' /></td>
							<td style="text-align: center">${product.shoppingProductDiscount}</td>
							<td style="text-align: center">${product.productrelation}</td>
							<td style="text-align: center">${product.shoppingDate}</td>

							<td><a
								href="${pageContext.request.contextPath}/shopping/sh/${product.shoppingId}">編輯</a></td>
							<td><a class='deletelink'
								href="${pageContext.request.contextPath}/shopping/sh1/${product.shoppingId}">刪除</a></td>
						</tr>
					</c:forEach>
				</table>
				</div>
			</c:otherwise>
		</c:choose>
		<hr>
	
	<script type='text/javascript'>

    $(document).ready(function() {
        $('.deletelink').click(function() {
        	if (confirm('確定刪除此筆紀錄? ')) {
        		var href = $(this).attr('href');
                $('form').attr('action', href).submit();
        	} 
        	return false;
            
        });
    })

	</script>
</body>
</html>