<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/style.css'  type="text/css" />

<title>新增打卡紀錄</title>
</head>
<body>
	<jsp:include page="/fragment/header.jsp" />
	<div align='center'>
		<div align='center'>
			<h3>新增打卡紀錄</h3>
			<hr>
			<a href='queryPunchTime'>回查詢頁面</a>
		</div>

		<form:form modelAttribute="punch" action='saveInsertPunchTime'
			enctype='application/x-www-form-urlencoded' method='POST'>
			<table border='1'>
				<tr style='height: 40px'>
					<td align='center'>姓名:</td>
					<td><form:input path='memberName' />
					 <form:errors path='memberName' cssClass="error"/>				</tr>
				<tr style='height: 40px'>
					<td align='center'>編號:</td>
					<td><form:input path='memberNumber' />
					<form:errors path='memberNumber' cssClass="error"/></td>
				</tr>
				<tr style='height: 40px'>
					<td align='center'>日期:</td>
					<td><form:input path='punchDate' />
					<form:errors path='punchDate' cssClass="error"/></td>
				</tr>
				<tr style='height: 40px'>
					<td align='center'>上班時間:</td>
					<td><form:input path='punchWorkOn' />
					<form:errors path='punchWorkOn' cssClass="error"/></td>
				</tr>
				<tr style='height: 40px'>
					<td align='center'>下班時間:</td>
					<td><form:input path='punchWorkOff' />
					<form:errors path='punchWorkOff' cssClass="error"/></td>
				</tr>
				<tr style='height: 40px'>
					<td colspan='3' align='center'><input type='submit' value='提交'>
						<input type='reset' value='還原'></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>