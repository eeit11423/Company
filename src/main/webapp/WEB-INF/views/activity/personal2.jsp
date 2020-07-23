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
		<h1 class="bg-secondary text-light">${memberBean.memberName}參加的活動資料</h1>
<hr>
<%-- 		<a class="btn btn-info" href="<c:url value='act' />">新增活動</a> &nbsp;&nbsp;&nbsp; --%>
		<a class="btn btn-info" href="<c:url value='/activity/index' />">返回前頁</a>
		
		<form method='POST'>
			<input type='hidden' name='_method' value='DELETE'>
		</form>

		<c:choose>
			<c:when test="${empty joins}">
	    您沒有參加任何活動<br>
			</c:when>
			<c:otherwise>
				<table class="table-striped" style="font-size:15px">
					<tr align="center">
						<th width='65'>序號</th>
						<th width='120'>名稱</th>
						<th width='65'>參加者</th>
						<th width='100'>報名時間戳記</th>
						<th width='80'>報名狀態</th>
					</tr>
					<c:forEach var='join' items='${joins}'>
						<tr align="center">
							<td style="text-align: center">${join.activityId}</td>
							<td>${join.activityName}</td>
							<td>${join.joinMemberId}</td>
							<td style="text-align:center">${join.joinTime}</td>
							<td><a class="deletelink" href="${pageContext.request.contextPath}/activity/join2/${join.id}">取消報名</a></td>
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
				if (confirm('確定取消報名此活動? ')) {
	        		var href = $(this).attr('href');
	                $('form').attr('action', href).submit();
	        	} 
	        	return false;
	            
			});
		})
	</script>
</body>
</html>