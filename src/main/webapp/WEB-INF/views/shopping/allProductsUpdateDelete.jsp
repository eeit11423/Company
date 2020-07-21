<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
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

<jsp:include page="/fragment/headerRearend.jsp" />

			
			<div>
			</div>
		<hr>
		<form method='POST'>
			<input type='hidden' name='_method' value='DELETE'>
		</form>

		<c:choose>
			<c:when test="${empty products}">
	    沒有任何商品資料<br>
			</c:when>
			<c:otherwise>
			<div class="row">
            <div class="col-md-10 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title mb-0">Top Products</p>
                  <div class="table-responsive">
                  
			<div class="container-fluid">
				<table class="table table-hover">
					<tr class="text-white text-left" style='background: #646D73'>
						<th width='50'>ID</th>
						<th width='180'>商品名稱</th>
					     <th width='150'>敘述</th>
						<th width='70'>類型</th>
						<th width='70'>價格</th>
						<th width='70'>折扣</th>
						<th width='70'>庫存</th>
						<th width='70'>照片名稱</th>
						<th>照片</th>
						<th width='100'>上傳日期</th>						
						<th colspan='2' width='150'>維護</th>
					</tr>
					
					<c:forEach var='product' items='${products}'>
						<tr  id="testshow">
							<td style="text-align: center"><a
								href="<spring:url value='oneProduct?id=${product.shoppingId}' />">${product.shoppingId}</a>
							<td>${product.shoppingname}</td>
							<td style="text-align: left">${product.productrelation}</td>
							<td style="text-align: left">${product.shoppingType}</td>
							<td style="text-align: right">${product.shoppingProductPrice}</td>
							<td style="text-align: center">${product.shoppingProductDiscount}</td>
							<td style="text-align: right">${product.shoppingProductTotal}</td>
							<td style="text-align: center">${product.shoppingfileName}</td>
							<td><img width='60' height='72'
								src='picture/${product.shoppingId}' /></td>
							<td style="text-align: center"><fmt:formatDate value="${product.shoppingDate}" pattern="yyyy-MM-dd"/></td>
							<td><a
								href="${pageContext.request.contextPath}/shopping/sh/${product.shoppingId}">編輯</a></td>
							<td><a class='deletelink'
								href="${pageContext.request.contextPath}/shopping/sh1/${product.shoppingId}">刪除</a></td>
						</tr>
					</c:forEach>
				</table>
				</div></div></div></div></div></div>
			</c:otherwise>
		</c:choose>
		<div class='container' align="center">
		<a class="btn btn-secondary btn-lg"
					href="<c:url value='/'/> ">回首頁</a>
	
		</div>
				
	
	
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