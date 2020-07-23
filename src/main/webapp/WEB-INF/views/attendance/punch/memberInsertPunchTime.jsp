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
	<div class="container" align='center'>
		<div align='center' style="text-align: center;background-color:#dee2e6">
			<h1>新增打卡紀錄</h1>
			<hr>
			<a href='memberPunch'>回前頁</a>
		</div>
		
		<form:form modelAttribute="punch" action='memberSaveInsertPunchTime'
			enctype='application/x-www-form-urlencoded' method='POST'>
			<input type="hidden" name='memberName' value="${punch.memberName}"/>
			<input type="hidden" name='memberNumber' value="${punch.memberNumber}"/>
			<table border='1'>
				<tr style='height: 40px'>
					<td align='center'>姓名:</td>
					<td> ${punch.memberName}</td></tr>
<%-- 					<td><form:input hide path='memberName'/> --%>
<%-- 					 <form:errors path='memberName' cssClass="error"/>				</tr> --%>
				<tr style='height: 40px'>
					<td align='center'>編號:</td>
					<td> ${punch.memberNumber}</td>
<%-- 					<td><form:input path='memberNumber' /> --%>
<%-- 					<form:errors path='memberNumber' cssClass="error"/></td> --%>
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
					<td colspan='3' align='center'><input type='submit' value='提交'>
						<input type='reset' value='還原'></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>