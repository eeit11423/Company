<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<jsp:include page="/fragment/header.jsp" />
<hr>
	<div align='center'>
		<h1 class="bg-secondary text-light">全部活動資料</h1>
<hr>
		<a class="btn btn-info" href="<c:url value='act' />">新增活動</a> &nbsp;&nbsp;&nbsp;<a class="btn btn-info"
			href="<c:url value='/activity/index' />">返回前頁</a>
		
		<form method='POST'>
			<input type='hidden' name='_method' value='DELETE'>
		</form>

		<c:choose>
			<c:when test="${empty activities}">
	    沒有任何活動資料<br>
			</c:when>
			<c:otherwise>
				<table class="table-striped" style="font-size:15px">
					<tr align="center">
						<th width='65'>序號</th>
						<th width='120'>名稱</th>
						<th width='180'>簡介</th>
						<th width='65'>貼文者</th>
						<th width='65'>詳細資料</th>
						<!-- 			   <th width='130'>報名開始日</th> -->
						<th width='100'>報名結束日</th>
						<th width='80'>貼文單位</th>
						<th width='65'>類型</th>
						<th>活動海報</th>
						<th>異動時間</th>
						<th>剩餘名額</th>
						<th colspan='2' width='90'>資料維護</th>
						<th>報名狀態</th>
					</tr>
					<c:forEach var='activity' items='${activities}'>
						<tr align="center">
							<td style="text-align: center">${activity.id}</td>
							<td>${activity.activityTitle}</td>
							<td>${activity.activitySubtitle}</td>
							<td style="text-align:center">${activity.organiserId}</td>
							<td><a
								href="<spring:url value='activity?id=${activity.id}' />"
								class="btn btn-secondary"> <span
									class="glyphicon-info-sigh glyphicon"></span>詳細資料
							</a></td>
							<%-- 					<td style="text-align:center">${activity.startDate}</td> --%>
							<td style="text-align: right">${activity.endDate}</td>
							<td style="text-align: center">${activity.department.name}</td>
							<td style="text-align: center">${activity.actCategory}</td>
							<td><img width='60' height='72'
								src='activity/picture/${activity.id}' /></td>
							<td>${activity.updateTime}</td>
							<td class="text-success">${activity.joinNum}</td>
							
<!-- 							身分決定是否有管理權限 -->
							
							<td>
							<c:choose>
		                        	<c:when test="${activity.organiserId == memberBean.memberId || memberBean.memberAdmin == 's'}">
                                     <a href="${pageContext.request.contextPath}/activity/act/${activity.id}">編輯</a>
                                     </c:when>
									<c:otherwise>　</c:otherwise>
								</c:choose>
								</td>							
							<td>
							<c:choose>
		                        	<c:when test="${activity.organiserId == memberBean.memberId || memberBean.memberAdmin == 's'}">
                                     <a class="deletelink"
								href="${pageContext.request.contextPath}/activity/act2/${activity.id}">刪除</a>
                                     </c:when>
									<c:otherwise>　</c:otherwise>
								</c:choose>							
								</td>						
							<td>
<!-- 				＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃抓取當下的日期，判斷活動是否已截止＃＃＃＃＃＃＃＃＃＃ -->
							<jsp:useBean id="nowDate" class="java.util.Date" />
							<fmt:formatDate var="nowStr" value="${nowDate}" />
							<c:set var="interval"
								value="${nowDate.time > activity.endDate.time}" />
<%-- 							<c:out value="${interval}" /> --%>
<!-- 				＃＃＃＃＃＃＃＃＃＃＃人數為零或日期截止停止報名＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃ -->
							<c:choose>
		                        	<c:when test="${activity.joinNum <= 0 || nowDate.time > activity.endDate.time}">
                                     <span class="text-danger">報名截止</span>
                                     </c:when>
									<c:otherwise>
										<a
											href="${pageContext.request.contextPath}/activity/join/${activity.id}" class="btn btn-info">報名</a>
									</c:otherwise>
								</c:choose></td>


						</tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
		<hr>
	</div>


	<script type='text/javascript'>
		$(document).ready(function() {
			$('.deletelink').click(function() {
				if (confirm('確定刪除此筆紀錄? ')) {
	        		var href = $(this).attr('href');
	                $('form').attr('action', href).submit();
	        	} 
	        	return false;
	            
			});
		})
	</script>
</body>
</html>