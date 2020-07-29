<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
    href="//netdna.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Products</title>
	<style>
		#outside{
/* 			  background-color:#FF9900; */
/* 			  width: 400px; */
/* 			  height: 100px; */
			  text-align:center;
				}	
	</style>
</head>
<body>
<%-- <jsp:include page="/fragment/header.jsp" /> --%>
<jsp:include page="/fragment/headerRearend.jsp" />
   <div class="main-panel">
        <div class="content-wrapper">
<form method='POST'>
	<input type='hidden' name='_method' value='DELETE'>
</form>
    <section>
        <div class="jumbotron">
            <div class="container" style="text-align: center" >
                <h1>所有訓練課程(後台)</h1>
<!-- 				<div class="container" style="text-align: center" >   	 -->
<%-- 			    	<a href="<c:url value='/' />"class="btn btn-primary"> --%>
<!-- 					<span class="glyphicon-info-sigh glyphicon"></span>首頁</a>									 -->
<!--     			</div> -->
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

   
<!--     <hr style="height:1px;border:none;color:#333;background-color:#333;"> -->
    </section>
    
		<div class="main-panel" style="background-color:#FFFFF4"> 
       <div class="content-wrapper" style="background-color:#FFFFF4;width:1200;height:1600">
<!-- 			<section class="container"> -->
		<div class="row" id='testshow' style="background-color:#FFFFF4">
    <section class="container">
        <div class="row">       
		
        
        <c:forEach var='product' items='${trainAllProductsDelete}'> <!-- controller的識別字串trainAllProducts會導引過來這裡 -->
            <div class="col-sm-6 col-md-4" style="width: 360px; height: 400px">
                <div class="thumbnail" style="width: 320px; height: 600px">
              
                <img id='outside' width='80' height='80'
                src="<c:url value='/getTrainPicture/${product.trainingId}'/>"/>
                
                    <div class="caption" style="height: 235px">
                        <p>
							<b style='font-size: 25px;'>${product.trainingCourse}</b>
                        </p>
                        <p>課程編號:${product.trainingId}</p>
                        <p>簡介:${product.brief}</p>
                        <p>類型:${product.category}</p>             
                        <p>學分:${product.trainingCredit}</p>
                        
                    
<%--                         	<a href="trainproduct/${product.trainingId}" --%>
<!--                         	class="btn btn-primary"><span -->
<!--                         	class="glyphicon-info-sigh glyphicon"></span>詳細內容 -->
<!--                         	</a> -->
                        	  </div>     	    	
                               	
                        	<a href="deleteTrain2/${product.trainingId}"class="btn btn-primary">
								<span class="glyphicon-info-sigh glyphicon"></span>刪除
							</a>
							
							<a href="updateTrain/${product.trainingId}"class="btn btn-primary">
								<span class="glyphicon-info-sigh glyphicon"></span>修改
							</a>
							
                     
                    
                
                </div>                
            </div>
        	</c:forEach>
        </div>     
    </section>
    </div>
    </div>
    </div>
    </div>
    </div>
</body>
</html>
    