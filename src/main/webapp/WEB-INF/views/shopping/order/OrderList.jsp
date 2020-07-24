<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:if test="${empty memberBean}">
	<c:redirect url="/" />
</c:if>
<title>訂單列表</title>
<style type="text/css">
#borderA {
	border: 1px solid black;
}
</style>
</head>
<body>
	<jsp:include page="/fragment/header.jsp" />
	<c:set var="funcName" value="ORD" scope="session" />

	<!-- 引入共同的頁首 -->

	<p />
	<div class="container-fluid">
		<table class="table table-hover bg-white table-bordered">

			<tr class="text-white text-left" style='background: #646D73'>
				<th colspan="8" align="center" font='30'><h3>編號${memberBean.memberNumber}:
					${memberBean.memberName}的訂購紀錄</h3></th>
			<tr class="text-white " style='background: #646D73'>
				<th width="30" align="center">No</th>

				<th width="100" align="center">部門</th>
				<th align="center">姓名</th>
				<th width="200" align="center">電話</th>
				<th width="400" align="center">寄送地址</th>
				<th align="center">總金額</th>
				<th align="center">下單時間</th>
				<th align="center">明細</th>


			</tr>
			<c:forEach  varStatus="vs" var="orderBean"  items="${memberOrders}">
				<TR>
					<TD width="40" align="center">${vs.index+1}</TD>
					<TD align="left">&nbsp;${memberBean.memberDepartment}</TD>
					<TD align="left">&nbsp;${memberBean.memberName}</TD>
					<TD align="left">&nbsp;${memberBean.memberPhone}</TD>
					<TD align="left">&nbsp;${orderBean.orderAddress}</TD>
					<TD align="left">&nbsp;<fmt:formatNumber value="${orderBean.orderTotalPrice}" pattern="#,###,###" /></TD>
					<TD align="left">&nbsp;<fmt:formatDate value="${orderBean.orderDate}" pattern="yyyy-MM-dd"/></TD>
					<TD align="center">
					<a	class='btn btn-secondary btn-sm btn-block' style='background: #646D73' href="<c:url value='../shopping/order/ShowOrderDetail/${memberBean.memberNumber}/${orderBean.orderNo}' />">
					連結
					</TD>

				</TR>
			</c:forEach>
			


		


		
		</TABLE>
		

		
	</div>
	<div class='container' align="center">
		<a class="btn btn-secondary btn-lg"
					href="<c:url value='/'/> ">回首頁</a>
	
		</div>
</body>
</html>