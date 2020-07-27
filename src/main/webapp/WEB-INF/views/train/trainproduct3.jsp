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

				<p>										
					<input type='hidden' id='hiiii' name='trainingId' value='${product.trainingId}'> 
					<input type='hidden' id='hiiii' name='trainingCredit' value='${product.trainingCredit}'> 					
					<input type='hidden'  name='page' value='secondPage'>
				</p>
				
<%--                  <a href="deleteRoster/${roster329.rosterId}"class="btn btn-primary"> --%>
<!-- 								<span class="glyphicon-info-sigh glyphicon"></span>刪除 -->
<!-- 							</a>    -->
			</div>
		</div>
	</section>
	</form>
	
</body>
</html>
