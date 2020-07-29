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
	<script>
	function reconfirmOrder(Id) {
		//getElementById裡面塞進trainingId讓這個請求認得某一個課程Id
		if (confirm("確定參加此課程 ? ")) { 
			var form = document.getElementById("form"+Id)
			form.action="<c:url value='/Course123'/>";
			form.method="POST";
			form.submit();
			
			return;
		} else {
			return;
		}
	}
	</script>
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
<form method='POST'>
	<input type='hidden' name='_method' value='DELETE'>
</form>
    <section>
        <div class="jumbotron">
            <div class="container" style="text-align: center" >
                <h1>所有訓練課程</h1>
				<div class="container" style="text-align: center" >   	
			    	<a href="<c:url value='/' />"class="btn btn-primary">
					<span class="glyphicon-info-sigh glyphicon"></span>首頁</a>
					
					<a href="<c:url value='/CourseList' />"class="btn btn-primary">
					<span class="glyphicon-info-sigh glyphicon"></span>我的課程</a>									
    			</div>
            </div>
            
            <form id="trainCategory" action='/train/trainAllProducts'>  
            <div align='center'>
				請挑選課程類型: 
				<select id='Publish_course' onchange="trainChange()" >
				<option  value="-1">類別選擇</option>
<c:forEach var='category' items='${list}' >
	<a href='train/${category}'>前端</a><br>
</c:forEach>
</select>
			

<!-- 			</div> -->
<!--         </form> -->
        </div>
<!--         		<tr height='52' bgcolor="lightblue" align="center"> -->
<!-- 					<td width="350"><p align="left"/> -->
<!-- 						<a href='queryByCategory'>課程分類</a><BR> -->
<!-- 					</td> -->
<!-- 					<td width="350"><p align="left" /> -->
<!-- 						<a href=''></a><br> -->
<!-- 					</td>	 -->
<!-- 				</tr> -->
    <section class="container"></section>
    <hr style="height:1px;border:none;color:#333;background-color:#333;">
    </section>
    <section class="container">
        <div class="row">
         <c:forEach var='product' items='${productss}'> <!-- controller的識別字串trainAllProducts會導引過來這裡 -->
            <form id="form${product.trainingId}" >
            <div class="col-sm-6 col-md-4" style="width: 360px; height: 400px">
                <div class="thumbnail" style="width: 320px; height: 380px">
              	<div id='outside' style="height: 80px" >
              	
                <img width='80' height='80'
                src="<c:url value='/getTrainPicture/${product.trainingId}'/>"/>
                </div>
                    <div class="caption" style="height: 245px">
                        <p>
							<b style='font-size: 25px;'>${product.trainingCourse}</b>
                        </p>
                        <p>課程編號:${product.trainingId}</p>
                        <p>簡介:${product.brief}</p>
                        <p>類型:${product.category}</p>             
                        <p>學分:${product.trainingCredit}</p>
                      
                       </div>
                        	<a href="trainproduct/${product.trainingId}"
                        	class="btn btn-primary"><span
                        	class="glyphicon-info-sigh glyphicon"></span>詳細內容
                        	</a>
       							<input type='hidden' id='hiiii' name='trainingId' value='${product.trainingId}'> <!-- 把controller的三個存取值放進表單一起送 -->
								<input type='hidden' id='hiiii' name='trainingCredit' value='${product.trainingCredit}'> 		
				 				<input type='hidden'  name='page' value='secondPage'>
<%--                         	<a href="deleteTrain/${product.trainingId}"class="btn btn-primary"> --%>
<!-- 								<span class="glyphicon-info-sigh gly  phicon"></span>刪除 -->
<!-- 							</a> -->
							
<%-- 							<a href="updateTrain/${product.trainingId}"class="btn btn-primary"> --%>
<!-- 								<span class="glyphicon-info-sigh glyphicon"></span>修改 -->
<!-- 							</a> -->
<%-- 							<input style="color:black" type="button" name="OrderBtn"  value="確定選課" onclick="reconfirmOrder(${product.trainingId})"> --%>
                        	<a onclick="reconfirmOrder(${product.trainingId})"
                        		class="btn btn-primary"><span
                        		class="glyphicon-info-sigh glyphicon"></span>選課
                        	</a>
<%--                         	<input style="color:black" type="button" name="OrderBtn"  value="確定選課" onclick="reconfirmOrder(${product.trainingId})"> --%>
                
                    
                    
                </div>                
            </div>
            </form>
        	</c:forEach>
        </div>     
    </section>
	<script>
		function trainChange(){
			
			 var select = document.getElementById("Publish_course").value;
			 console.log(select);
			 var URL = select;
// 			 document.trainCategory.action ="/train/trainAllProducts?category="+select;
			 document.getElementById("trainCategory").action =URL;
			 document.getElementById("trainCategory").submit();
			 
		};
	</script>
</body>
</html>
    