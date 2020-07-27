<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
    href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Products</title>

</head>
<body>
<%-- <jsp:include page="/fragment/header.jsp" /> --%>
<form method='POST'>
	<input type='hidden' name='_method' value='DELETE'>
</form>
    <section>
        <div class="jumbotron">
            <div class="container" style="text-align: center" >
                <h1>所有訓練課程(後台)</h1>
				<div class="container" style="text-align: center" >   	
			    	<a href="<c:url value='/' />"class="btn btn-primary">
					<span class="glyphicon-info-sigh glyphicon"></span>首頁</a>									
    			</div>
            </div>
<!--             <div align='center'> -->
<!-- 				請挑選課程類型: <select id='Publish_course' onchange="memberChange()"> -->
<%-- 					<c:forEach var="category" items="${CategoryList}"> --%>
<%-- 						<option value="${category}">${category}</option> --%>
<%-- 					</c:forEach> --%>
<!-- 				</select> -->
<!-- 				<hr> -->

<!-- 			</div> -->
        </div>
    <section class="container"></section>
<!--     <hr style="height:1px;border:none;color:#333;background-color:#333;"> -->
    </section>
    <section class="container">
        <div class="row">
        
        
        <c:forEach var='product' items='${trainAllProductsDelete}'> <!-- controller的識別字串trainAllProducts會導引過來這裡 -->
            <div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
                <div class="thumbnail" style="width: 320px; height: 340px">
                <img width='80' height='80'
                src="<c:url value='/getTrainPicture/${product.trainingId}'/>"/>
                    <div class="caption" >
                        <p>
							<b style='font-size: 25px;'>${product.trainingCourse}</b>
                        </p>
                        <p>課程編號:${product.trainingId}</p>
                        <p>簡介:${product.brief}</p>
                        <p>類型:${product.category}</p>             
                        <p>學分:${product.trainingCredit}</p>
                        
                        <p>
<%--                         	<a href="trainproduct/${product.trainingId}" --%>
<!--                         	class="btn btn-primary"><span -->
<!--                         	class="glyphicon-info-sigh glyphicon"></span>詳細內容 -->
<!--                         	</a> -->
                        	           	
                        	<a href="deleteTrain2/${product.trainingId}"class="btn btn-primary">
								<span class="glyphicon-info-sigh glyphicon"></span>刪除
							</a>
							
							<a href="updateTrain/${product.trainingId}"class="btn btn-primary">
								<span class="glyphicon-info-sigh glyphicon"></span>修改
							</a>
                        </p>
                    
                    </div>
                </div>                
            </div>
        	</c:forEach>
        </div>     
    </section>
    
</body>
</html>
    