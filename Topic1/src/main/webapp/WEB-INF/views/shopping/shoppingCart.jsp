<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type='text/javascript'
	src='${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js'></script>
<title></title>
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
	<div align='center'>
		<h1>購物車</h1>
		<a href="<c:url value='/'/> ">回前頁</a>
		<hr>
		<h2>員工帳號:${memberBean.memberNumber} 員工姓名:${memberBean.memberName}</h2>
	</div>

	<hr>
	<form method='GET'>
		<input type='hidden' name='_method' value='update'>
	</form>

	<table border='1' cellpadding="3" cellspacing="1">
		<tr>
			<th width='20'>清單編號ID</th>
			<th width='20'>訂單編號</th>
			<th width='20'>下單時間</th>
			<th width='20'>商品ID</th>
			<th width='180'>商品名稱</th>
			<th width='180'>商品敘述</th>
			<th width='30'>商品價格</th>
			<th width='30'>商品折扣</th>
			<th width='30'>商品數量</th>
			<th width='100'>商品總金額</th>
			<th colspan='2' width='72'>資料維護</th>
		</tr>
		<c:forEach varStatus="vs" var='ShoppingCart'
			items='${ShoppingCart.content}'>
			<tr>

				<td>${ShoppingCart.value.orderItemsId}</td>
				<td>${ShoppingCart.value.orderId}</td>
				<td>${ShoppingCart.value.orderDate}</td>
				<td>${ShoppingCart.value.shoppingId}</td>
				<td>${ShoppingCart.value.shoppingProductName}</td>
				<td>${ShoppingCart.value.productrelatio}</td>
				<td>${ShoppingCart.value.shoppingProductPrice}</td>
				<td>${ShoppingCart.value.shoppingProductDiscount}</td>

				<td style="text-align: right;"><Input id="newQty${vs.index}"
					style="width: 28px; text-align: right" name="newQty" type="text"
					value="<fmt:formatNumber value="${ShoppingCart.value.orderItemsNumber}" />"
					name="qty" onkeypress="return isNumberKey(event)" />
				<td style="text-align: right;"><fmt:formatNumber
						value="${ShoppingCart.value.shoppingProductPrice * ShoppingCart.value.shoppingProductDiscount * ShoppingCart.value.orderItemsNumber}"
						pattern="#,###,###" />元</td>

				<td><Input type="button" name="update" value="修改"
					onclick="modify(${ShoppingCart.value.shoppingId}, ${ShoppingCart.value.orderItemsNumber}, ${vs.index})"></td>

				<td><a
					href="${pageContext.request.contextPath}/shoppingCart/delete/${ShoppingCart.value.shoppingId}">刪除</a></td>
			</tr>
		</c:forEach>
	</table>

	<hr>
	<div>
		<table border='1'>

			<tr height='16'>
				<td colspan='5' align='right'>合計金額：</td>
				<td align='right'><fmt:formatNumber value="${subtotal}"
						pattern="#,###,###" />元</td>
				<td width="265" align='center'><a
					href="<c:url value='OrderConfirm' />"
					onClick="return Checkout(${subtotal});">結帳</a></td>

			</tr>
		</table>
	</div>
</body>
</html>