<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
    href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Products</title>
</head>
<body>
<form method='POST'>
	<input type='hidden' name='_method' value='DELETE'>
</form>
    <section>
        <div class="jumbotron">
            <div class="container" style="text-align: center" >
                <h1>訓練課程清單</h1>
                <p>所有訓練課程資料</p>
                <a href="<c:url value='/' />">首頁</a>
                <a href="<c:url value='/trainProduct/add' />">新增</a>
            </div>
        </div>
    <section class="container"></section>
    <hr style="height:1px;border:none;color:#333;background-color:#333;">
    </section>
    <section class="container">
        <div class="row">
        <c:forEach var='product' items='${trainAllProducts}'>
            <div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
                <div class="thumbnail" style="width: 320px; height: 340px">
                <img width='100' height='200'
                src="<c:url value='/getTrainPicture/${product.trainingId}'/>"/>
                    <div class="caption" >
                        <p>
							<b style='font-size: 25px;'>${product.trainingCourse}</b>
                        </p>
                        <p>發布單位:${product.companyBean.name}</p>
                        <p>簡介:${product.brief}</p>
                        <p>學分:${product.trainingCredit}</p>
                        
<%--                         <p>${product.elaborate}</p> --%>
                        <p>
                        	<a href="trainproduct/${product.trainingId}"
                        	class="btn btn-primary"><span
                        	class="glyphicon-info-sigh glyphicon"></span>詳細內容
                        	</a>
                        	
           	
                        	<a href="deleteTrain/${product.trainingId}"class="btn btn-primary">
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
    