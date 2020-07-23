<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<title>新增打卡紀錄</title>
</head>
<body>
	<jsp:include page="/fragment/header.jsp" />
	<div class="container" align='center' >
		<div align='center' style="text-align: center;background-color:#dee2e6">
			<h1>新增打卡紀錄</h1>
			<hr>
			<a href='queryPunchTime'>回前頁</a>
		</div>
		
		<form:form modelAttribute="punch" action='saveInsertPunchTime'
			enctype='application/x-www-form-urlencoded' method='POST'>
			<table border='1'>
				<tr style='height: 40px'>
					<td align='center'>姓名:</td>
					<td><form:input path='memberName'/>
					 <form:errors path='memberName' cssClass="error"/>				
				</tr>
				<tr style='height: 40px'>
					<td align='center'>編號:</td>
					<td><form:input path='memberNumber' />
					<form:errors path='memberNumber' cssClass="error"/></td>
				</tr>
				<tr style='height: 40px'>
					<td align='center'>日期:</td>
					<td><form:input type='date' path='punchDate' />
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
					<td colspan='3' align='center'>
						<input type='submit' class="btn btn-info" value='提交'>
						<input type='reset' class="btn btn-outline-secondary"  value='還原'></td>
					</td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>