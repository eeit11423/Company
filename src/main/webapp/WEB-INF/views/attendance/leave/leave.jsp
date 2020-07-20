<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<title>全體員工請假列表</title>
<style>
td, th {
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="/fragment/header.jsp" />
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h1>請假系統</h1>
			</div>
			<div class="container" style="text-align: center">
				<button onclick="location.href='insertLeave'">新增</button>
				<button onclick="location.href='queryLeave'">查詢</button>
			</div>
			<div style="text-align: center">
				<a href='<c:url value='/'/>'>返回首頁</a>
			</div>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<div class="row">
			<div align='center' id='divtable'>
				<table border='1' border-collapse='collapse'>
					<tr>
						<th>流水號</th>
						<th>姓名</th>
						<th>部門</th>
						<th>請假日期</th>
						<th>假別</th>
						<th>請假開始</th>
						<th>請假結束</th>
						<th>請假原因</th>
					</tr>
					<c:forEach var='leave' items='${leave}'>
						<tr>
							<td>${leave.leaveId}</td>
							<td>${leave.memberName}</td>
							<td>${leave.memberDepartment}</td>
							<td>${leave.leaveDate}</td>
							<td>${leave.leaveCategory}</td>
							<td>${leave.leaveStart}</td>
							<td>${leave.leaveEnd}</td>
							<td>${leave.leaveCause})</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</section>
</body>
<script>
	function timeStampToDate(date) {
		var datetime = new Date();
		datetime.setTime(date);
		var year = datetime.getFullYear();
		var month = datetime.getMonth() + 1;
		var date = datetime.getDate();
		var hour = datetime.getHours();
		var minute = datetime.getMinutes();
		var second = datetime.getSeconds();
		var mseconds = datetime.getMilliseconds();
		var date = year + "-" + month + "-" + date;
		return date;
	};

	function timeStampToTime(time) {
		var datetime = new Date();
		datetime.setTime(time);
		var hour = datetime.getHours();
		var minute = datetime.getMinutes();
		var second = datetime.getSeconds();
		var time = hour + ":" + minute + ":" + second;
		return time;
	};
</script>
</html>