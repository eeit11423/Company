<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
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
<body >
<jsp:include page="/fragment/header.jsp" />
	<p />
	<div class="container-fluid"	>
	<table   class="table table-hover bg-white table-bordered" >
		<tr  class="text-white text-left" style='background: #646D73' >
			<th  colspan="8" id='borderA'><h3>編號${memberBean.memberNumber}: ${memberBean.memberName}的訂單明細</h3></th>
		</tr>
	    <tr id='borderA' class="text-white text-left" style='background: #646D73'>
			
						<td align="Left" colspan="3" id='borderA'>
							<b>出貨地址：</b>${OrderBean.orderAddress}
							                
						</td>
						<td align="Left" colspan="3" id='borderA'>
							<b>訂購日期：</b>
<fmt:formatDate value="${OrderBean.orderDate}" pattern="yyyy-MM-dd"/>
						</td>
						<td align="center" colspan="3" id='borderA'>
							<b>訂單編號：</b>${OrderBean.orderNo}
						</td>
					</tr>
				
		
		<tr  height='36' align="center" class="text-white text-left" style='background: #646D73' id='borderA'>
			<th id='borderA' width="50px" align="center">No</th>
			<th id='borderA' width="100px" align="center">商品Id</th>
			<th id='borderA' width="300px" align="center">名稱</th>
			<th id='borderA' width="400px" align="center">敘述</th>
			<th id='borderA' width="80px" align="center">價格</th>
			<th id='borderA' width="80px" align="center">折扣</th>
			<th id='borderA' width="80px" align="center">數量</th>
			<th id='borderA' width="100px" align="center">總計</th>
		
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
				<tr id='borderA'  >
 				<td id='borderA' align="center">${stat.index+1}</td>
 				<td id='borderA' align="center">${aBean.shoppingId}</td>
				<td id='borderA' align="left">${aBean.shoppingProductName}</td>
				<td id='borderA' align="left">${aBean.productrelatio}&nbsp;</td>
				<td id='borderA' align="right"><fmt:formatNumber  value="${aBean.shoppingProductPrice}"  	pattern="#,###,###" />&nbsp;</td>
				<td id='borderA' align="center">${aBean.shoppingProductDiscount}&nbsp;</td>
				<td id='borderA' align="right">${aBean.orderItemsNumber}&nbsp;</td>
				
 				<td id='borderA' align="right"><fmt:formatNumber 
 					value="${aBean.orderItemsNumber*aBean.shoppingProductDiscount*aBean.shoppingProductPrice}" 
 						pattern="#,###,###" />元</td> 
   				<c:set var="subtotal" 
 				value="${ aBean.orderItemsNumber* aBean.shoppingProductPrice * aBean.shoppingProductDiscount}" />    
				
			</tr>
		</c:forEach>
		<tr height='30'>
			<TD id='borderA' width="100px" align="right"colspan="9">
			   <b>總金額</b> <fmt:formatNumber value="${OrderBean.orderTotalPrice}" pattern="#,###,###" />元</TD>
		</tr>
	</TABLE>
	</div>
	<p />

	<div style="text-align: center">
		<a class="btn btn-secondary btn-lg" href="<c:url value='${pageContext.request.contextPath}/../orderList/list'/> ">回上一頁</a>&nbsp;&nbsp;
		<a  class="btn btn-secondary btn-lg" href="<c:url value='/'/> ">回首頁</a>
	</div>
</body>
</html>
