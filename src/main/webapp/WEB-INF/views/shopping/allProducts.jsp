<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>全部商品</title>
   
<!--     <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.1/js/bootstrap.min.js"></script> -->
<!-- <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->
</head>
<body>
<jsp:include page="/fragment/header.jsp" />
		<script type='text/javascript'>

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


	</script>
    <!-- header/end -->
    <!-- 產品商城/start -->
    <section class="page-content">
        <div class="container pt-5 pb-5">
            <div class="row">
                <!-- 商品區/start -->
                <div class="col-12 col-md-9">
                    <div class="row">
                        <!-- 排序/start -->
                        <div class="col-12 mt-3 mb-3">
                            <p class="d-inline-block">顯示 21 筆結果中的 1–9 筆</p>
                            <form action="" class="d-inline-block float-right">
                                <select id="ProductSelect" class="form-control">
                                    <option>依上架時間</option>
                                    <option>依熱銷度</option>
                                    <option>依價格排序:低至高</option>
                                    <option>依價格排序:高至低</option>
                                </select>
                            </form>
                        </div>
                        <!-- 排序/end -->
                        <!-- 商品/start -->
                        <c:forEach var='product' items='${products}'>
                        <div class="col-12 col-sm-6 col-md-4 mb-3 "  >
                            <div class="card">
                           <img class="card-img-top" src='picture/${product.shoppingId}' alt="${product.shoppingId}">
                                <div class="card-body card" >
                                 <h5 class="card-img-top" >${product.shoppingname}</h5>
                                     <h5 class="card-text text-danger" >
                                     <small class="mr-1" >
                                    <del >$&nbsp;${product.shoppingProductPrice}</del>
                                     </small>
                                     
                                     <fmt:formatNumber value="${product.shoppingProductPrice * product.shoppingProductDiscount }" pattern="#,###,###" />
                                     </h5>
                                    <a href="<spring:url value='oneProduct?id=${product.shoppingId}' />" class="btn btn-outline-secondary btn-block">查看商品</a>
                                    <form action='addToCart' method='POST' >
                                    <input type='hidden'  name='shoppingId' value='${product.shoppingId}'> 
                                    <input type='hidden'  name='orderItemsNumber'  value='1'>
                                    <input class="btn btn-outline-primary btn-block" type='submit' value='加入購物車' >
                                    </form>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        <!-- 商品/end -->
                        <!-- 分頁/start -->
                        <div class="col-12 mt-3 mb-5 ">
                            <nav aria-label="Page navigation product">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">1</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">2</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">3</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <!-- 分頁/end -->
                    </div>
                </div>
                <!-- 商品區/end -->
                <!-- 側邊欄/start -->
                <div class="col-12 col-md-3">
                    <div class="row">
                        <!-- 搜尋/start -->
                        <div class="col-12 mb-5">
                            <form action="">
                                <input type="test" class="form-control" id="PorductSearch" placeholder="搜尋...">
                            </form>
                        </div>
                        <!-- 搜尋/end -->
                        <!-- 購物清單/start -->
                        
                        <div class="col-12 mb-5">
                            <h4 class="title-color">購物車</h4>
                            <div class="d-block sidebar-product-list" id=''>
                            <c:forEach var='ShoppingCart' items='${ShoppingCart.content}' >
                               
                             <h6 class="d-inline-block">${ShoppingCart.value.shoppingProductName}</h6>
                               
                                <p class="d-block text-secondary pl-4">${ShoppingCart.value.orderItemsNumber}
                                    &nbsp;X&nbsp;NT<fmt:formatNumber value="${ShoppingCart.value.shoppingProductPrice* ShoppingCart.value.shoppingProductDiscount }" pattern="#,###,###" />
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
					<c:forEach var="shoppingType1" items="${AllShoppingType}">
						<option value="${shoppingType1}">${shoppingType1}</option>
					</c:forEach>
				</select>
<!--                             <ul class="sidebar-product-category"> -->
<%--                             <c:forEach var="shoppingType1" items="${AllShoppingType}"> --%>
<%-- 						<li> <a href="#">登山拐杖握把</a>value="${shoppingType1}">${shoppingType1}</li> --%>
<%-- 					</c:forEach> --%>
<!--                                 <li> -->
<!--                                     <a href="#">登山拐杖握把</a> -->
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <a href="#">發泡/套管</a> -->
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <a href="#">各色發泡板</a> -->
<!--                                 </li> -->
                            </ul>
                        </div>
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
	
	function memberChange(){
		var Publish_member = document.getElementById("Publish_shoppingType").value;
		var xhr = new XMLHttpRequest();
		//var xhr_img = new XMLHttpRequest();
		xhr.open("GET","<c:url value='/shopping/"+ Publish_member+"' />",true);
		xhr.send();
		xhr.onreadystatechange = function(){
			if (xhr.readyState == 4 && xhr.status ==200){
				var content = "";
				var xhr_img = new XMLHttpRequest();
				for (var i= 0 ; i<member.length ; i++){
					 var timestamp3 = member[i].shoppingDate;
					  var newDate = new Date();
					    newDate.setTime(timestamp3);
					content += '<tr><td style="text-align: center"><a href="shopping/oneProduct?id='+member[i].shoppingId+'">'+member[i].shoppingId+'</a></td>'+
					"<td>"+ member[i].memberNumber+"</td>"+
					"<td>"+ member[i].shoppingname+"</td>"+
					"<td>"+ member[i].shoppingItemId+"</td>"+
					"<td>"+ member[i].shoppingProductTotal+"</td>"+
					"<td>"+ member[i].shoppingProductPrice+"</td>"+
					"<td>"+ member[i].shoppingType+"</td>"+
					"<td>"+ member[i].shoppingfileName+"</td>"+
					"<td><img width='60' height='72' src='shopping/picture/"+member[i].shoppingId+"' /></td>"+
					"<td>"+ member[i].shoppingProductDiscount+"</td>"+
					"<td>"+ member[i].productrelation+"</td>"+
					"<td>"+ newDate.toLocaleString() +"</td>"+
					
					'<td><a href="shopping/sh/'+member[i].shoppingId+'">編輯</a></td>'+
					'<td><a  class="deletelink" href="shopping/sh1/'+member[i].shoppingId+'">刪除</a></td>'+

		"</tr>"
					//xhr_img.open("GET","<c:url value='shopping/picture/"+member[i].shoppingId+"' />",true);
					//xhr_img.send();
				}
				content += "</table>";
				var div = document.getElementById("showsmember");
				div.innerHTML = content;
			}
		}
	}

	</script>
</body>
</html>