<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type='text/javascript'
	src='${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js'></script>
<title></title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/style.css' type="text/css" />
	<style>
		#outside{
				  text-align:center;/*區塊內元素顯示置中*/
				  width: 1300px;
				  height: 0px;
				  margin:0 auto;/*區塊置中*/
				}
	</style>
</head>
<body>
<jsp:include page="/fragment/header.jsp" />
	
		<div id="outside" class="">
			<table  class="table table-bordered">
			<tr style='background:#646D73' class="text-white text-left">
					<th width='110'>課程編號</th>
					<th width='56'>詳細資料</th>
					<th width='120'>員工編號</th>
					<th width='120'>員工姓名</th>
					<th width='120'>課程名稱</th>
					<th width='70'>類型</th>
					<th width='80'>影片</th>
					<th width='40'>照片</th>			
					<th width='70'>學分</th>
					<th width='120'>自我評點</th>
					<th width='110'>評點總分</th>
<!-- 					<th width='100'>管理</th> -->

			</tr>
			
			
<%-- 			<c:forEach var='roster3292' items='${CourseList}'> --%>
			
<%-- 			${roster3292.starSum} --%>
<%-- 			</c:forEach> --%>
		
			<c:set var="ai" value="0" scope="session"/>
			<c:forEach var='roster329' items='${train001}'>
			<tr>
						<td>${roster329.trainingId}</td>
<!-- 					<td style="text-align: center"> -->
<%--				<a href="<spring:url value='/train/trainproduct/${roster329.trainingId}' />">${roster329.trainingId}</a> --%>
<%-- 					<a href="<spring:url value='/train/trainproduct/${roster329.trainingId}' />">詳細資料</a> --%>
<!-- 					</td> -->
					<td><a href="<spring:url value='/train/trainproduct3/${roster329.trainingId}' />"
		                        	class="btn btn-secondary btn-block text-white"><span
		                        	class="glyphicon-info-sigh glyphicon"></span>詳細資料</a>
		              	</td>
					
						<td>${memberBean.memberNumber}</td>
						<td>${memberBean.memberName}</td>
						<td>${roster329.trainingCourse}</td>
						<td>${roster329.category}</td>
						<td><a href="<spring:url value='/train/trainproduct2/${roster329.trainingId}' />"
		                        	class="btn btn-primary"><span
		                        	class="glyphicon-info-sigh glyphicon"></span>連結</a>
		              	</td>
						
						<td><img width='80' height='80'
							src='getTrainPicture/${roster329.trainingId}' />
						</td>				
						
						<td>
							${roster329.trainingCredit}
						</td>
						
						<td><a href="<c:url value='/train/score/${roster329.trainingId}' />"
	                        	class="btn btn-secondary btn-block text-white"><span
	                        	class="glyphicon-info-sigh glyphicon"></span>開始</a></td>
							<td>
							<c:if test="${roster329.starSum == 0}">
								未評分
							</c:if>
							<c:if test="${roster329.starSum != 0}">
								${roster329.starSum}
							</c:if>
								
							</td>
<!-- 							<td> -->
<%-- 							<a href="deleteRoster/${roster329.rosterId}"class="btn btn-primary"> --%>
<!-- 								<span class="glyphicon-info-sigh glyphicon"></span>刪除 -->
<!-- 							</a> -->
<!-- 							</td>		 -->
			</tr>
				
			</c:forEach>
			
			
			
<!-- 	              		</td> -->
		              		
<!-- 	              		<td> -->
	              			 
<!-- 	              		</td> -->
<!-- 		              	<td> -->
<%-- 		              	<a href="deleteRoster/${roster329.rosterId}"class="btn btn-primary"> --%>
<!-- 								<span class="glyphicon-info-sigh glyphicon"></span>刪除 -->
<!-- 							</a>   -->
<!-- 		              	</td>	 -->	
			</table>
			</div>
</body>
</html>