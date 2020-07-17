<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <c:if test="${empty LoginOK}"> --%>
<%-- 	<c:redirect url="/_02_login/login.jsp" /> --%>
<%-- </c:if> --%>
<title>個人訂單明細</title>
<style type="text/css">
#main {
	position: absolute;
	top: 110px;
	left: 210px;
}

#borderA {
	border: 1px solid black;
}
</style>
</head>
<body style="background: #EBFFEB;">

	<p />
	<TABLE style="margin-left: auto; margin-right: auto; background: #F0E4F4; border: 1px blue solid;">
		<tr id='borderA' height='50'>
			<th id='borderA' align="center" colspan="9"><h3>${memberBean.memberNumber}: ${memberBean.memberName}的訂單明細</h3></th>
		</tr>
		<tr id='borderA' height='36'>
			<td colspan="9">
				<table>
					<tr id='borderA'>
						<td align="Left" width="350px">
							<b>出貨地址：</b>${OrderBean.orderAddress}
							                
						</td>
						<td align="center" width="300px">
							<b>訂購日期：</b>${OrderBean.orderDate}
						</td>
						<td align="center" width="280px">
							<b>訂單編號：</b>${OrderBean.orderNo}
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr id='borderA' height='36'>
			<th id='borderA' width="100px" align="center">清單編號ID</th>
			<th id='borderA' width="100px" align="center">商品編號</th>
			<th id='borderA' width="200px" align="left">商品名稱</th>
			<th id='borderA' width="400px" align="left">商品敘述</th>
			<th id='borderA' width="100px" align="center">商品價格</th>
			<th id='borderA' width="80px" align="center">商品折扣</th>
			<th id='borderA' width="100px" align="center">商品數量</th>
			<th id='borderA' width="100px" align="center">商品價錢總計</th>
			<th id='borderA' width="100px" align="center">下單日期</th>
		</tr>
		<c:set var="subtotal" value="0" />
		<c:forEach var="aBean" varStatus="stat" items="${OrderItemBean}">
			<c:choose>
				<c:when test="${ stat.count % 2 == 0 }">
					<c:set var="aColor" value="#E6FFA0" />
				</c:when>
				<c:otherwise>
					<c:set var="aColor" value="#EBFFEB" />
				</c:otherwise>
			</c:choose>
				<tr id='borderA'  height='30'>
 				<td id='borderA' align="center">${aBean.orderItemsId}</td>
 				<td id='borderA' align="center">${aBean.shoppingId}</td>
				<td id='borderA' align="left">${aBean.shoppingProductName}</td>
				<td id='borderA' align="left">${aBean.productrelatio}&nbsp;</td>
				<td id='borderA' align="right">${aBean.shoppingProductPrice}&nbsp;</td>
				<td id='borderA' align="center">${aBean.shoppingProductDiscount}&nbsp;</td>
				<td id='borderA' align="right">${aBean.orderItemsNumber}&nbsp;</td>
				
 				<td id='borderA' align="right"><fmt:formatNumber 
 					value="${aBean.orderItemsNumber*aBean.shoppingProductDiscount*aBean.shoppingProductPrice}" 
 						pattern="#,###,###" />元</td> 
   				<c:set var="subtotal" 
 				value="${ aBean.orderItemsNumber* aBean.shoppingProductPrice * aBean.shoppingProductDiscount}" />    
				<td id='borderA' align="left">${aBean.orderDate}</td>
			</tr>
		</c:forEach>
		<tr height='30'>
			<TD id='borderA' width="100px" align="right"colspan="9">
			   <b>總金額</b> <fmt:formatNumber value="${OrderBean.orderTotalPrice}" pattern="#,###,###" />元</TD>
		</tr>
	</TABLE>
	<p />

	<div style="text-align: center">
		<a href="redirect:/rderList/list">回上一頁</a>&nbsp;&nbsp;
		<a href="redirect:/">回首頁</a>
	</div>
</body>
</html>
