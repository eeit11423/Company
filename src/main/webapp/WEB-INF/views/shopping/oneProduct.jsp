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
</head>
<body>
<jsp:include page="/fragment/header.jsp" />
<!-- 產品商城/start -->
    <section class="page-content">
        <div class="container pt-5 pb-5">
            <div class="row">
                <!-- 產品說明/start -->
                <div class="col-12 col-md-9">
                    <div class="row">
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
                            <div class="d-block mb-3">
                                <p class="mb-0 d-inline-block">數量</p>
                                <form action="" class="d-inline-block">
                                    <input type="number" class="form-control w-25" id="quantity" value="1">
                                </form>
                            </div>
                            <div class="mb-3">
                                    <form action='addToCartOneProduct' method='POST' >
                                    <input type='hidden'  name='shoppingId' value='${shoppingBean.shoppingId}'> 
                                    <input type='hidden'  name='orderItemsNumber'  value='1'>
                             
                                    <input class="btn btn-primary text-white mr-1" type='submit' value='加入購物車' >
                                    </form>
                                <span><a href="${pageContext.request.contextPath}/OrderConfirm" onClick="return Checkout(${ShoppingCart.subtotal});"  class="btn btn-secondary text-white">直接結帳</a></span>
                            </div>
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
    </script>
</body>
</html>