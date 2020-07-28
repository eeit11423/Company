<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<title>Product</title>
<script type="text/javascript">
		function reconfirmOrder() {

			if (confirm("確定參加此課程 ? ") ) {
				document.forms[0].action="<c:url value='/Course123' />";
				document.forms[0].method="POST";
				document.forms[0].submit();
				
				return;
			} else {
				return;
			}
		}
</script>
</head>
<body>
<jsp:include page="/fragment/header.jsp" /> 
<%-- <h1>${{memberBean.memberName}}</h1> --%>
<form action='addToCart' method='POST'>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h1>詳細課程</h1>
			</div>
		</div>
	</section>
	<section class="container">
		<div  class="row">
			<div  class="col-md-5">
			<img width='300' height='200'
                src="<c:url value='/getTrainPicture/${product.trainingId}'/>"/>
				<h3>${product.trainingCourse}</h3>
				<p>
					<strong>課程編號: </strong> <span class='label label-warning'>
						${product.trainingId} </span>
				</p>
				<p>課程來源: ${product.companyBean.name}</p>
				<p>課程介紹: ${product.elaborate}</p>				
				<p>學分: ${product.trainingCredit}</p>

<!-- 				<div> -->
<!-- 					<figure> -->
<%-- 						<iframe src="<c:url value='${product.URLUpload}'/>"  --%>
<!-- 							width=400 height=300 frameborder="0" allowfullscreen></iframe>			    -->
<!-- 					</figure> -->
<!-- 				</div> -->
				<p>
					
					
					<input type='hidden' id='hiiii' name='trainingId' value='${product.trainingId}'> 
					<input type='hidden' id='hiiii' name='trainingCredit' value='${product.trainingCredit}'> 
					
					<input type='hidden'  name='page' value='secondPage'>
					 
					 
<%-- 					<a href="<spring:url value='/products' />" class="btn btn-default"> --%>
<!-- 						<span class="glyphicon-hand-left glyphicon"></span>返回 -->
<!-- 					</a> -->

<!-- 					<a href='#' class='btn btn-warning btn-large'>  -->
<!-- 					    <span class='glyphicon-shopping-cart glyphicon' type='submit' ></span>確定送出 -->
<!-- 					</a> -->
					<input style="color:black" type="button" name="OrderBtn"  value="選課" onclick="reconfirmOrder()">
				</p>
				
                    
			</div>
		</div>
	</section>
	</form>
	
</body>
</html>
