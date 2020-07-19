<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="UTF-8">

<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"> -->
<!-- <script -->
<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"> -->
<!-- <title>Activity</title> -->
<!-- <link rel='stylesheet' -->
<%-- 	href='${pageContext.request.contextPath}/css/styles.css' --%>
<!-- 	type="text/css" /> -->
</head>
<body>
<jsp:include page="/fragment/header.jsp" />
<hr>
	<section class="container">
		<div>
			<div class="container" style="text-align: center">
				<h2>${activity.activityTitle}</h2>
			</div>

			<div class="row">
				<div class="col-sm-4">

					<img width='300' height='450'
						src="<c:url value='/activity/picture/${activity.id}'/>" />
				</div>

				<div class="col-sm-8">
		
					<p>${activity.activitySubtitle}</p>

					<hr>
					<p>活動內容: ${activity.content}</p>
					<p>報名截止日: ${activity.endDate}</p>
					<p>貼文人員: ${activity.organiserId}</p>
					<p>貼文單位: ${activity.department.name}</p>
					<p>
						<strong>剩餘名額: </strong> <span class='label label-warning'>
							${activity.joinNum} </span>
					</p>
					<p>
						<!-- 				＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃抓取當下的日期，判斷活動是否已截止＃＃＃＃＃＃＃＃＃＃ -->
						<jsp:useBean id="nowDate" class="java.util.Date" />
						<fmt:formatDate var="nowStr" value="${nowDate}" />
						<c:set var="interval"
							value="${nowDate.time > activity.endDate.time}" />
						<%-- 							<c:out value="${interval}" /> --%>
						<!-- 				＃＃＃＃＃＃＃＃＃＃＃人數為零或日期截止停止報名＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃ -->
						<c:choose>
							<c:when
								test="${activity.joinNum <= 0 || nowDate.time > activity.endDate.time}">
                                                                                                報名截止
                                     </c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/activity/join/${activity.id}"
									class='btn btn-warning btn-large'> <span
									class='glyphicon-shopping-cart glyphicon'></span>按我報名
								</a>
							</c:otherwise>
						</c:choose>
					</p>

					<button class="btn btn-outline-secondary" data-toggle="collapse"
						data-target="#demo">已報名名單</button>

					<div id="demo" class="collapse">
						<table border='1' cellpadding="3" cellspacing="1">
							<tr>
								<th style="text-align: center">員工編號</th>
								<th style="text-align: center">加入時間</th>
							</tr>
							<c:forEach var='join' items='${joins}'>
								<tr>
									<td style="text-align: center">${join.joinMemberId}</td>
									<td style="text-align: center">${join.joinTime}</td>
								</tr>
							</c:forEach>
						</table>
					</div>

				</div>
			</div>


		</div>
	</section>
	<hr>
	<div>
		<a href="<c:url value='/'/> ">回前頁</a>
	</div>


</body>
</html>
