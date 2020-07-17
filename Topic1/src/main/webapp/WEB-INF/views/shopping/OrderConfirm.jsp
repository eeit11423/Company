<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script type="text/javascript">
function cancelOrder() {
	if (confirm("確定取消此份訂單 ? ") ) {
		// 接收此資料的Servlet會使用 finalDecision 參數的值
// 		document.forms[0].finalDecision.value = "CANCEL";
		document.forms[0].action="<c:url value='ProcessOrder.do' />";
		document.forms[0].method="POST";
		document.forms[0].submit();
		return;
	} else {
		return;
	}
}
function reconfirmOrder() {
	var sa = document.getElementById('orderAddress').value;
	if  (sa === "") {
		window.alert ('出貨地址不能是空白');
		return ; 
	}
	if (confirm("確定送出此份訂單 ? ") ) {
		// 接收此資料的Servlet會使用 finalDecision 參數的值
// 		document.forms[0].finalDecision.value = "ORDER";
		document.forms[0].action="<c:url value='ProcessOrder' />";
		document.forms[0].method="POST";
		document.forms[0].submit();
		return;
	} else {
		return;
	}
}
</script>
<meta charset="UTF-8">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 取得今天的日期，今天的日期應當在最後確認時才取得 -->
<jsp:useBean   id="today"  class="java.util.Date" scope="session"/> 
<title>訂單明細資訊確認</title>
</head>
<body style="background:#EBFFEB;">
<c:set var="funcName" value="CHE" scope="session"/>
<div style="text-align:center">
<h3>請確認下列訊息：</h3>
<FORM style="margin: 0 auto; width:750px;" action="<c:url value='ProcessOrder.do' />" method="POST" >
   <TABLE border='1' style="background:#F5EBFF; border-color:rgb( 100, 100, 255); border-style: outset; width:810;">
      <TR >
         <TD style="text-align:left; border-color: #FFBD32; border-style: ridge;">
         	會員編號：${memberBean.memberNumber}
         </TD>
         <TD style="text-align:left; border-color: #FFBD32; border-style: ridge;">
         	客戶姓名：${memberBean.memberName}
         </TD>
         <TD style="text-align:left; border-color: #FFBD32; border-style: ridge;">
         	訂單日期：<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/>
         </TD>
         <TR >
         <TD style="text-align:left; border-color: #FFBD32; border-style: ridge;">
         	電話：${memberBean.memberPhone}
         </TD>
         <TD style="text-align:left; border-color: #FFBD32; border-style: ridge;">
         	部門：${memberBean.memberDepartment}
         </TD>
       
      </TR>
      <TR>
         <TD colspan='3' style="text-align:left; border-color: #FFBD32; border-style: ridge;">
         	會員地址：${memberBean.memberAddress}
         </TD>
      </TR>
      <TR>
         <TD colspan='3' style="text-align:left; border-color: #FFBD32; border-style: ridge;">
                             出貨地址：<Input style="background:#ECFFCD;" size="60" type="text" id='orderAddress' 
                   name="orderAddress" value="">
                   
         </TD>
      </TR>
  
    
      <TR>
         <TD colspan='3'>
         
   <TABLE border='1' style="background:#FFE7CD; border-color:rgb( 100, 100, 255); " >
      
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
			</tr>
     <c:forEach  varStatus="vs" var='ShoppingCart' items='${ShoppingCart.content}'>
				<tr>

					<td>${ShoppingCart.value.orderItemsId}</td>
					<td>${ShoppingCart.value.orderId}</td>
					<td>${ShoppingCart.value.orderDate}</td>
					<td>${ShoppingCart.value.shoppingId}</td>
					<td>${ShoppingCart.value.shoppingProductName}</td>
					<td>${ShoppingCart.value.productrelatio}</td>
					<td>${ShoppingCart.value.shoppingProductPrice}</td>
					<td>${ShoppingCart.value.shoppingProductDiscount}</td>
					<td>${ShoppingCart.value.orderItemsNumber}</td>
                    <td style="text-align:right;"><fmt:formatNumber value="${ShoppingCart.value.shoppingProductPrice * ShoppingCart.value.shoppingProductDiscount * ShoppingCart.value.orderItemsNumber}" pattern="#,###,###" />元</td>
			</c:forEach>
     
        <TR height='16'>
          <TD style="text-align:right;font-size: 11pt;" colspan='5' >合計金額：</TD>
          <TD style="text-align:right;font-size: 11pt;" >
          <fmt:formatNumber value="${ShoppingCart.subtotal}" pattern="#,###,###" />元</TD>
                  
        </TR>
    </TABLE>
          </TD>
      </TR>
 
   </TABLE><P/>
   <input type="hidden" name="finalDecision"  value="">   
   <input type="button" name="OrderBtn"  value="確定送出" onclick="reconfirmOrder()">
   <input type="button" name="CancelBtn" value="取消訂單" onclick="cancelOrder()">
</FORM>
</div>

</body>
</html>