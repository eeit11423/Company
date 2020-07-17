<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
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
   border:1px solid black;
}

</style>
</head>
<body style="background: #EBFFEB;">
<c:set var="funcName" value="ORD" scope="session"/>

	<!-- 引入共同的頁首 -->

    <p/>
	<table style="margin-left:auto; margin-right:auto; width:810; background:#F5EBFF; border:2px solid blue; border-style: outset; ">

		<tr id='borderA' height='50' >
			<th id='borderA'  colspan="8" align="center">${memberBean.memberNumber}: ${memberBean.memberName}的訂購紀錄</th>
	
		<tr id='borderA' height='36' >
			<th id='borderA'>訂單編號</th>
			<th id='borderA'>員工編號</th>
			<th id='borderA'>員工部門</th>
			<th id='borderA'>員工姓名</th>
			<th id='borderA'>員工電話</th>
			<th id='borderA'>寄送地址</th>
			<th id='borderA'>商品總金額</th>
			<th id='borderA'>下單時間</th>

			
		</tr>
		<c:forEach var="orderBean" varStatus="stat" items="${memberOrders}">
			<TR id='borderA' height='30'>
			<TD id='borderA' width="86" align="center">
			    <a  href="<c:url value='../shopping/order/ShowOrderDetail/${memberBean.memberNumber}/${orderBean.orderNo}' />">
				    ${orderBean.orderNo}
<%-- 				    ../shopping/order/ShowOrderDetail/${orderBean.orderNo} --%>
<!-- 				    href="shopping/order/ShowOrderDetail?orderNo=1" -->
			    </a>
			</TD>
			<TD id='borderA' width="100" align="center">${orderBean.memberNumber}</TD>
			<TD id='borderA' width="80" align="right">${memberBean.memberDepartment}</TD>
			<TD id='borderA' width="100" align="left">&nbsp;${memberBean.memberName}</TD>
			<TD id='borderA' width="200" align="center">${memberBean.memberPhone}</TD>
			<TD id='borderA' width="300" align="right">${orderBean.orderAddress}</TD>
			<TD id='borderA' width="200" align="left">&nbsp;${orderBean.orderTotalPrice}</TD>
			<TD id='borderA' width="200" align="left">&nbsp;${orderBean.orderDate}</TD>
							
		</TR>
		</c:forEach>
		<tr height='36' id='borderA'>
			
		
				<td id='borderA' align="center" colspan="4"><a href="<c:url value='list'/> ">上一頁</a></td>
	<td id='borderA' align="center" colspan="4"><a href="<c:url value='/'/> ">回首頁</a></td>
		
	

		</tr>
	</TABLE>
</body>
</html>