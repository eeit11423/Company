<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/style.css' type="text/css" />
<script type="text/javascript">
function confirmDelete(n) {
	if (confirm("確定刪除此項商品 ? ") ) {
		document.forms[0].action="<c:url value='UpdateItem?cmd=DEL&bookId=" + n +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
	
	}
}
function modify(key, qty, index) {
	var x = "newQty" + index;
	var newQty = document.getElementById(x).value;
	if  (newQty < 0 ) {
		window.alert ('數量不能小於 0');
		return ; 
	}
	if  (newQty == 0 ) {
		window.alert ("請執行刪除功能來刪除此項商品");
		document.getElementById(x).value = qty;
		return ; 
	}
	if  (newQty == qty ) {
		window.alert ("新、舊數量相同，不必修改");
		return ; 
	}
	if (confirm("確定將此商品的數量由" + qty + " 改為 " + newQty + " ? ") ) {
		document.forms[0].action="<c:url value='UpdateItem/" + key + "/" + newQty +"' />";
		
		                          
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
		document.getElementById(x).value = qty;
	}
}
function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode
   if (charCode > 31 && (charCode < 48 || charCode > 57)){
      return false;
   }
   return true;
}
function Checkout(qty) {
	if (qty == 0)  {
		alert("無購買任何商品，不需結帳");
		return false;
	}
	if (confirm("再次確認訂單內容 ? ") ) {
		return true;
	} else {
		return false;
	}
}
function Abort() {
	if (confirm("確定放棄購物 ? ") ) {
		return true;
	} else {
		return false;
	}
}
</script>

</head>
<body>
	<jsp:include page="/fragment/header.jsp" />
	<form method='GET'>
		<input type='hidden' name='_method' value='update'>
	</form>
	<c:choose>
		<c:when test="${ShoppingCart.subtotal > 0}">
			<c:set var="subtotalMessage" value="金額小計:${ShoppingCart.subtotal} 元" />
			<c:set var="subtotal" value="${ShoppingCart.subtotal}" />
		</c:when>
		<c:otherwise>
			<c:set var="subtotalMessage" value="金額小計:  0 元" />
			<c:set var="subtotal" value="0" />
		</c:otherwise>
	</c:choose>

	<!-- 購物車/start -->
	<section class="page-content">
	<div class="container pt-5 pb-5">
		<div class="row">
			<!-- 產品清單/start -->
			<div class="col-12 mb-3">
				<h2 class="mb-3">購物車</h2>
				<div class="table-responsive-sm table-middle">
					<table class="table table-bordered">
						<thead class="text-white text-left" style='background:#646D73'>
							<tr>

								<th scope="col" class="product-thumbnail">圖片</th>
								<th scope="col" class="product-name">名稱</th>
								<th scope="col" class="product-price">價格</th>
								<th scope="col" class="product-quantity">數量</th>
								<th scope="col" class="product-subtotal">總計</th>
								<th scope="col" class="product-remove">&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach varStatus="vs" var='ShoppingCart'
								items='${ShoppingCart.content}'>
								<tr>

									<td class="product-thumbnail"><a href="product.html">
											<img width='150' height='150'
											src='shopping/picture/${ShoppingCart.value.shoppingId}'
											alt="" class="img-fluid">
									</a></td>
									<td class="product-name"><a
										href="<spring:url value='shopping/oneProduct?id=${ShoppingCart.value.shoppingId}' />">${ShoppingCart.value.shoppingProductName}</a>
									</td>
									<td class="product-price">NT$&nbsp;<fmt:formatNumber value="${ShoppingCart.value.shoppingProductPrice* ShoppingCart.value.shoppingProductDiscount }" pattern="#,###,###" /></td>
									<td class="product-quantity"><Input id="newQty${vs.index}"
										style="width: 80px; text-align: left" name="newQty"
										type="number"
										value="<fmt:formatNumber value="${ShoppingCart.value.orderItemsNumber}" />"
										name="qty" onkeypress="return isNumberKey(event)"  min="1" max="50" 
											onblur="modify(${ShoppingCart.value.shoppingId}, ${ShoppingCart.value.orderItemsNumber}, ${vs.index})"
										/>
<!-- 										<Input type="button" name="update" value="修改" -->
<%-- 					onclick="modify(${ShoppingCart.value.shoppingId}, ${ShoppingCart.value.orderItemsNumber}, ${vs.index})"> --%>
										
									</td>
									<td class="product-subtotal"><fmt:formatNumber
											value="${ShoppingCart.value.shoppingProductPrice * ShoppingCart.value.shoppingProductDiscount * ShoppingCart.value.orderItemsNumber}"
											pattern="#,###,###" />元</td>
									<td class="product-remove"><a
										href="${pageContext.request.contextPath}/shoppingCart/delete/${ShoppingCart.value.shoppingId}">移除</a></td>
								</tr>
							</c:forEach>



						</tbody>
					</table>
				</div>
			</div>
			<!-- 產品清單/end -->
			<!-- 感興趣產品/start -->
			<div class="col-12 col-md-6 d-none d-md-block mb-5">
				<!-- 				<h2>您可能對此有興趣...</h2> -->
				<div class="row">
					<div class="col-6">
						<!-- 						<div class="card mb-3"> -->
						<!-- 							<img class="card-img-top" src="./images/product/eva_2.jpg" -->
						<!-- 								alt="TG-B-0001" class="img-fluid"> -->
						<!-- 							<div class="card-body"> -->
						<!-- 								<h4 class="card-title">TG-B-0001</h4> -->
						<!-- 								<p class="card-text">登山拐杖握把，EVA發泡材質</p> -->
						<!-- 								<h5 class="card-text text-danger">NT$&nbsp;500</h5> -->
						<%-- 								<a href="${pageContext.request.contextPath}/shopping/oneProduct?id=<fmt:formatNumber value='${Math.floor(Math.random()*30)}' /> " --%>
						<!-- 									class="btn btn-outline-secondary btn-block">查看商品</a> <a -->
						<!-- 									href="cart.html" class="btn btn-outline-primary btn-block">加入購物車</a> -->
						<!-- 							</div> -->
						<!-- 						</div> -->
						<!-- 					</div> -->
						<!-- 					<div class="col-6"> -->
						<!-- 						<div class="card mb-3"> -->
						<!-- 							<img class="card-img-top" src="./images/product/eva_2.jpg" -->
						<!-- 								alt="TG-B-0001" class="img-fluid"> -->
						<!-- 							<div class="card-body"> -->
						<!-- 								<h4 class="card-title">TG-B-0001</h4> -->
						<!-- 								<p class="card-text">登山拐杖握把，EVA發泡材質</p> -->
						<!-- 								<h5 class="card-text text-danger">NT$&nbsp;500</h5> -->
						<!-- 								<a href="product.html" -->
						<!-- 									class="btn btn-outline-secondary btn-block">查看商品</a> <a -->
						<!-- 									href="cart.html" class="btn btn-outline-primary btn-block">加入購物車</a> -->
						<!-- 							</div> -->
						<!-- 						</div> -->
					</div>
				</div>
			</div>
			<!-- 			<!-- 感興趣產品/end -->
			<!-- 			<!-- 產品統計/start -->
			<div class="col-12 col-md-6 mb-5">
				<h2>購物車總計</h2>
				<div class="table-responsive-sm">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td>小計</td>
								<td>NT$&nbsp;<fmt:formatNumber value="${subtotal}"
										pattern="#,###,###" /></td>
							</tr>
							<tr class="text-white text-left" style='background:#646D73'>
								<td>總計</td>
								<td>NT$&nbsp;<fmt:formatNumber value="${subtotal}"
										pattern="#,###,###" /></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2"><a href="<c:url value='OrderConfirm' />"
									class="btn btn-outline-secondary btn-lg float-right">前往結帳</a></td>
									
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
			<!-- 產品統計/end -->
		</div>
	</div>
	</section>
	<!-- 購物車/end -->
	<!-- 頁腳/start -->

	<!-- 頁腳/end -->
	<script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip({trigger: "click"});
        })
    </script>
</body>
</html>