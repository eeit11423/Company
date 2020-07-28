<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>OnePrduct</title>
<meta charset="UTF-8">
<title>shopping</title>
<script>
function modifynumber() {
	var newQty = document.getElementById(newQty).value;
	var orderItemsNumber = document.getElementById(orderItemsNumber).value;
	newQty=orderItemsNumber

	
	
}

function chceknumber(){
	
    var sno = $('#quantity').val();
	
	if((sno.indexOf(" ") >= 0 || sno == null)){
		alert('數量不能為空格或null值');
		return;
	}else{
	
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


function modify(x) {
	
	var shId=x
	var newQty = document.getElementById(quantity).value;
	
	if  (newQty < 0 ) {
		window.alert ('數量不能小於 0');
		return ; 
	}
	if  (newQty == 0 ) {
		window.alert ("請輸入數量");
		document.getElementById(newQty).value = qty;
		return ; 
	}

	if (confirm("確定將此商品的加入數量是否" + newQty + " ? ") ) {
		document.forms[0].action="pageContext.request.contextPath"+"shopping/addToCartOneProduct/"+shId+"/"+newQty;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
		document.getElementById(x).value = qty;
	}
}

$(document).ready(function() {
    $('.addshoppingcart').click(function() {
    	if (confirm('確定刪除此筆紀錄? ')) {
    		var href = $(this).attr('href');
            $('form').attr('action', href).submit();
    	} 
    	return false;
        
    });
})

$(function () {
    $('[data-toggle="tooltip"]').tooltip({trigger: "click"});
})
function Checkout(qty) {
	console.log("qty"+qty)
}
	if (qty == 0)  {
		alert("無購買任何商品，不需結帳");
		return false;
	}
	if (confirm("再次確認訂單內容 ? ") ) {
		return true;
	} else {
		return false;
	}

</script>

</head>
<body>
<jsp:include page="/fragment/header.jsp" />
<!-- 產品商城/start -->
    <section class="page-content">
        <div class="container pt-5 pb-5">
            <div class="row">
                <!-- 產品說明/start -->
                <div class="col-12 col-md-9">
                    <div class="row" id='showAllProducts'>
                        <!-- 商品照片/start -->
                        <div class="col-12 col-md-6">
                            <img class="card-img-top" src='picture/${shoppingBean.shoppingId}' alt="${product.shoppingId}" class="img-fluid w-100">
                        </div>
                        <!-- 商品照片/end -->
                        <!-- 商品介紹/start -->
                        <div class="col-12 col-md-6">
                            <h4 class="mb-3 title-color">${shoppingBean.shoppingname}</h4>
                            <h5 class="text-danger">
                                <small class="text-secondary mr-2">
                                    <del>NT$&nbsp;${shoppingBean.shoppingProductPrice}</del>
                                </small>
                                NT$&nbsp;<fmt:formatNumber value="${shoppingBean.shoppingProductPrice * shoppingBean.shoppingProductDiscount }" pattern="#,###,###" />
                            </h5>
<%--                             <p class="mt-4">${shoppingBean.shoppingname}</p> --%>
                             <form   action='addToCartOneProduct' method='POST'>
                            <div class="d-block mb-3">
                                <p class="mb-0 d-inline-block">數量</p>
                               
                                    <input class="d-inline-block" type="number"  name='orderItemsNumber'  class="form-control w-25" id="quantity" value='1' min="1" max="50" required   onkeypress="return isNumberKey(event)">
                       
                            </div>
                            <div class="mb-3">
                                    
                                    <input type='hidden'  name='shoppingId' value='${shoppingBean.shoppingId}'> 
                                    <input type='hidden'  value='1'  id='orderItemsNumber'>
                             
                                    <input class="btn btn-primary text-white mr-1" type='submit' value='加入購物車' >
                         
                                <span><a href="${pageContext.request.contextPath}/OrderConfirm" 	onClick="return Checkout(${ShoppingCart.subtotal})"  class="btn btn-secondary text-white mr-1">直接結帳</a></span>
                            	
                            	</div>  </form>
                            <p class="d-block text-secondary">產品分類：<span>${shoppingBean.shoppingType}</span></p>
                        </div>
                        <!-- 商品介紹/end -->
                        <!-- 詳細資料/start -->
                        <div class="col-12 mt-5 mb-5">
                            <ul class="nav nav-tabs" id="ProductTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">描述</a>
                                </li>
<!--                                 <li class="nav-item"> -->
<!--                                     <a class="nav-link" id="specification-tab" data-toggle="tab" href="#specification" role="tab" aria-controls="specification" aria-selected="false">產品規格</a> -->
<!--                                 </li> -->
                            </ul>
                            <div class="tab-content" id="ProductTabContent">
                                <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
                                    <p class="p-2">${shoppingBean.productrelation}</p>
                                </div>
<!--                                 <div class="tab-pane fade" id="specification" role="tabpanel" aria-labelledby="specification-tab"> -->
<%--                                     <p class="p-2">${shoppingBean.productrelation}</p> --%>
<!--                                 </div> -->
                            </div>
                        </div>
                        <!-- 詳細資料/end -->
                    </div>
                </div>
                <!-- 產品說明/end -->
                <!-- 側邊欄/start -->
                <div class="col-12 col-md-3">
                    <div class="rpw">
                        <!-- 搜尋/start -->
                    <div class="col-12 mb-5">
						<form action="">
							<input type="test" class="form-control" id="PorductSearch"
				placeholder="搜尋..." onkeyup='keyup()'>
						</form>
					</div>
                        <!-- 搜尋/end -->
                        <!-- 購物清單/start -->
                  <div class="col-12 mb-5">
                            <h4 class="title-color">購物車</h4>
                            <div class="d-block sidebar-product-list" id=''>
                            <c:forEach var='ShoppingCart' items='${ShoppingCart.content}' >
                               
                             <h6 class="d-inline-block">${ShoppingCart.value.shoppingProductName}</h6>
                               
                                <p class="d-block text-secondary pl-4">
                                    <span class="text-warning">${ShoppingCart.value.orderItemsNumber}</span>&nbsp;X&nbsp;<fmt:formatNumber value="${ShoppingCart.value.shoppingProductPrice*ShoppingCart.value.shoppingProductDiscount}" pattern="#,###,###" />
                                    <input type='hidden'  name='shoppingId' value="${ShoppingCart.value.shoppingProductPrice * ShoppingCart.value.shoppingProductDiscount * ShoppingCart.value.orderItemsNumber}">
                                </p>
                                </c:forEach>
                            </div>
     
                            <div class="d-block mt-3 mb-3">
                            
                               <h5 class="text-center" >小計：NT$&nbsp;<fmt:formatNumber value="${ShoppingCart.subtotal}" pattern="#,###,###" /></h5>
                            </div>
                            <div class="d-block">
                                <a href="${pageContext.request.contextPath}/shoppingCart" class="btn btn-primary btn-block text-white" role="button">查看購物車</a>
                            </div>
                            <div class="d-block mt-1 mb-3">
                                <a href="${pageContext.request.contextPath}/OrderConfirm" onClick="return Checkout(${ShoppingCart.subtotal});" class="btn btn-secondary btn-block text-white" role="button">結帳</a>
                            </div>
                        </div>
                        <!-- 購物清單/end -->
                        <!-- 產品分類/start -->
                  <div class="col-12 mb-5">
                            <h4 class="title-color">產品分類</h4>
                            <select id='Publish_shoppingType' class='form-control'  onchange="memberChange()" >
                            <option value="-1">請選擇</option>
					<c:forEach var="shoppingType1" items="${AllShoppingType}">
						<option value="${shoppingType1}">${shoppingType1}</option>
					</c:forEach>
				</select>
                          
                        <!-- 產品分類/end -->
                    </div>
                </div>
                <!-- 側邊欄/end -->
            </div>
        </div>
    </section>
    <!-- 產品商城/end -->
    <!-- 頁腳/start -->
    <!-- 頁腳/end -->
    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip({trigger: "click"});
        })
          function handleSelect(elm)
   {
   window.location = elm.value;
   }
        
        function memberChange(){
		var Publish_member = document.getElementById("Publish_shoppingType").value;
		var xhr = new XMLHttpRequest();
		xhr.open("GET","<c:url value='/shopping/"+ Publish_member+"' />",true);
		xhr.send();
		xhr.onreadystatechange = function(){
			if (xhr.readyState == 4 && xhr.status ==200){
				var content ='<div class="col-12 mt-3 mb-3"> <p class="d-inline-block">顯示 21 筆結果中的 1–9 筆</p><form action="" class="d-inline-block float-right"> <select id="ProductSelect" class="form-control" onchange="javascript:handleSelect(this)">'+
	                          '<option value="allProducts">請選擇排序</option><option value="allProducts">依上架時間舊到新</option>'+
	                        '<option value="AllProductsNewtoOld">依上架時間新到舊</option><option value="AllProductsPriceLowtoHigh">依價格排序:低至高</option>'+
	                       '<option value="AllProductsPriceHightoLow">依價格排序:高至低</option>  </select>	</form> </div>'
	             var member = JSON.parse(xhr.responseText);
	       	    var xhr_img = new XMLHttpRequest();
				for (var i= 0 ; i<member.length ; i++){
					content +='<div class="col-12 col-sm-6 col-md-4 mb-3 "><div class="card">'+
					'<img class="card-img-top" src="picture/'+member[i].shoppingId+'" alt="${product.shoppingId}">'+
					'<div class="card-body card">'+'<h5 class="card-img-top">'+member[i].shoppingname+'</h5>'+
					'<h5 class="card-text ">'+'<small class="mr-1"> <del>$&nbsp;'+member[i].shoppingProductPrice+'</del>'+
					'</small> <span class="card-text text-danger">$'+
					Math.ceil(member[i].shoppingProductPrice * member[i].shoppingProductDiscount)+'</span></h5>'+
					'<a href="oneProduct?id='+member[i].shoppingId+'" class="btn btn-outline-secondary btn-block">查看商品</a>'+
					'<form action="addToCart" method="POST"><input type="hidden" name="shoppingId"'+
					'value="'+member[i].shoppingId+'"> <input type="hidden" name="orderItemsNumber" value="1">'+
					'<input class="btn btn-outline-primary btn-block" type="submit" value="加入購物車">		</form>'
			            
					+'</div></div></div>'
												
				}
				content += "";
				var div = document.getElementById("showAllProducts");
				div.innerHTML = content;
			}
		}
	}
        
        function keyup() {
    		var x = $("#PorductSearch").val();
    		console.log($("#PorductSearch").val())
    		var xhr = new XMLHttpRequest();
    		xhr.open("GET", "<c:url value='/shopping/search/"+x+"' />", true);
    		xhr.send();
    		xhr.onreadystatechange = function() {
    						if (xhr.readyState == 4 && xhr.status ==200){
    							var content ='<div class="col-12 mt-3 mb-3"> <p class="d-inline-block">顯示 21 筆結果中的 1–9 筆</p><form action="" class="d-inline-block float-right"> <select id="ProductSelect" class="form-control" onchange="javascript:handleSelect(this)">'+
    	                          '<option value="allProducts">請選擇排序</option><option value="allProducts">依上架時間舊到新</option>'+
    		                        '<option value="AllProductsNewtoOld">依上架時間新到舊</option><option value="AllProductsPriceLowtoHigh">依價格排序:低至高</option>'+
    		                       '<option value="AllProductsPriceHightoLow">依價格排序:高至低</option>  </select>	</form> </div>';
    		             var member = JSON.parse(xhr.responseText);
    		             console.log(member)
    		       	  //  var xhr_img = new XMLHttpRequest();
    		             for (var i= 0 ; i<member.length ; i++){
    							content +='<div class="col-12 col-sm-6 col-md-4 mb-3 "><div class="card">'+
    							'<img class="card-img-top" src="picture/'+member[i].shoppingId+'" alt="${product.shoppingId}">'+
    							'<div class="card-body card">'+'<h5 class="card-img-top">'+member[i].shoppingname+'</h5>'+
    							'<h5 class="card-text ">'+'<small class="mr-1"> <del>$&nbsp;'+member[i].shoppingProductPrice+'</del>'+
    							'</small> <span class="card-text text-danger">$'+
    							Math.ceil(member[i].shoppingProductPrice * member[i].shoppingProductDiscount)+'</span></h5>'+
    							'<a href="oneProduct?id='+member[i].shoppingId+'" class="btn btn-outline-secondary btn-block">查看商品</a>'+
    							'<form action="addToCart" method="POST"><input type="hidden" name="shoppingId"'+
    							'value="'+member[i].shoppingId+'"> <input type="hidden" name="orderItemsNumber" value="1">'+
    							'<input class="btn btn-outline-primary btn-block" type="submit" value="加入購物車">		</form>'
    					            
    							+'</div></div></div>'
    														
    						}
    				content += "";
    				var div = document.getElementById("showAllProducts");
    				div.innerHTML = content;
    			}
    		}
    	}

        
    </script>
</body>
</html>