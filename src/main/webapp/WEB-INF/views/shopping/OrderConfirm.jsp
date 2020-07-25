<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>

<html>
<head>
<meta charset="UTF-8">

<!-- 取得今天的日期，今天的日期應當在最後確認時才取得 -->
<jsp:useBean   id="today"  class="java.util.Date" scope="session"/> 
<title>訂單明細資訊確認</title>
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

function check(){
	var checkbox=document.getElementById('checkbox').checked

	document.getElementById('orderAddress').value ="${memberBean.memberAddress}"
	
	 if(checkbox==false){
		   document.getElementById('orderAddress').value =""
		 }

	  
	
}
	
 
</script>



</head>
<body>
<jsp:include page="/fragment/header.jsp" />
<c:set var="funcName" value="CHE" scope="session"/>
<div style="text-align:center">
<FORM style="margin: 0 auto; width:1000px;" action="<c:url value='ProcessOrder.do' />" method="POST" >

<section class=" box-30">
	<div class="container">
		<h2 class="text-left  mb-4"  >
			<strong  >請確認下列訊息：</strong>
		</h2>
		<table   class="table table-hover bg-white table-bordered" >
				<tr  class="text-white text-left" style='background:#646D73'>
					<td  colspan="1">會員編號:${memberBean.memberNumber}</td>
					<td colspan="3">客戶姓名:${memberBean.memberName}</td>
					<td colspan="2">部門：${memberBean.memberDepartment}</td>
					
			</tr>
		<tr  class="text-white text-left" style='background:#646D73'>
					<td colspan="2">電話：${memberBean.memberPhone}</td>
					<td colspan="4" class='text-right'>訂單日期:<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/></td>
					
			</tr>
			<tr  class="text-white text-left" style='background:#646D73'>
					<td colspan='6'>會員地址：${memberBean.memberAddress}</td>
					
					
			</tr >
		<tr  class="text-white text-left" style='background:#646D73'>
			<td colspan='6'>
			<span>出貨地址：</span>
			
			<Input size='60px' type="text" id='orderAddress' 
                   name="orderAddress" value="" >
                   <input type="checkbox" name="" value="" id="checkbox" onchange='check()' >同上
                   </td>
                   
			</tr>
				</table>
		<table   class="table table-hover bg-white table-bordered" >	
          <tr>
            <td scope="col" width='180'>商品名稱</td>
            <td scope="col" width='180'>商品敘述</td>
            <td scope="col" width='30'>價格</td>
            <td scope="col" width='30'>折扣</td>
                <td scope="col" width='30'>數量</td>
            <td scope="col" width='100'>商品總金額</td>
          
          </tr>
               <c:forEach  varStatus="vs" var='ShoppingCart' items='${ShoppingCart.content}'>
				<tr>
					<td>${ShoppingCart.value.shoppingProductName}</td>
					<td>${ShoppingCart.value.productrelatio}</td>
					<td>${ShoppingCart.value.shoppingProductPrice}</td>
					<td>${ShoppingCart.value.shoppingProductDiscount}</td>
					<td>${ShoppingCart.value.orderItemsNumber}</td>
                    <td style="text-align:right;"><fmt:formatNumber value="${ShoppingCart.value.shoppingProductPrice * ShoppingCart.value.shoppingProductDiscount * ShoppingCart.value.orderItemsNumber}" pattern="#,###,###" />元</td>
			</c:forEach>
       
		</table>
	</div>
</section>


<div class="container">
  
  
    
      <TR>
         <TD colspan='3'>
         
   <TABLE   class="table " >
      

     
        <TR height='80'>
       
          <TD style="text-align:right;font-size: 30pt;" colspan='6'  >合計金額：
          <fmt:formatNumber value="${ShoppingCart.subtotal}" pattern="#,###,###" />元</TD>
                  
        </TR>
    </TABLE>
          </TD>
      </TR>
 
   </TABLE>
   </div>
   <P/>
   <input type="hidden" name="finalDecision"  value="">   
   <input type="button"  class="btn btn-secondary slidedown" name="OrderBtn"  value="確定送出" onclick="reconfirmOrder()">
   <input type="button"  class="btn btn-secondary slidedown" name="CancelBtn" value="取消訂單" onclick="cancelOrder()">
   
</FORM>


</body>
</html>