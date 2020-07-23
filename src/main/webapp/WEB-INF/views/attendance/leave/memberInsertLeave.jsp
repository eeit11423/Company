<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>新增請假紀錄</title>
</head>
<body>
<jsp:include page="/fragment/header.jsp" />
	<div class="container" align='center'>
		<div align='center' style="text-align: center;background-color:#dee2e6">
		<h1>新增請假紀錄</h1><hr>
		<a href='memberLeave'>回前頁</a>
		</div>
		<hr>
		<form:form action="memberSaveInsertLeave" modelAttribute="leave" method='POST'>
			<input type="hidden" name='memberName' value="${leave.memberName}"/>
			<input type="hidden" name='memberNumber' value="${leave.memberNumber}"/>
		
		<table border='1' border-collaspe='collaspe'>

			<tr style='height: 40px'>	
				<td align='center'>姓名:</td>
				<td>${leave.memberName}
				</td>
			</tr>	
			<tr style='height: 40px'>	
				<td align='center'>編號:</td>
				<td>${leave.memberNumber}</td>
			</tr>
			<tr style='height: 40px'>	
				<td align='center'>日期:</td>
				<td><form:input path='leaveDate' /></td>
			</tr>
			<tr style='height: 40px'>	
				<td align='center'>開始時間:</td>
				<td><form:input path='leaveStart' /></td>
			</tr>
			<tr style='height: 40px'>	
				<td align='center'>結束時間:</td>
				<td><form:input path='leaveEnd' /></td>
			</tr>
			<tr style='height: 40px'>
				<td align='center'>假別</td>
				<td><form:select path='leaveCategory'>
					<form:option value='事假'>事假</form:option>
					<form:option value='病假'>病假</form:option>
					<form:option value='公假'>公假</form:option>
					<form:option value='婚嫁'>婚嫁</form:option>
					<form:option value='喪假'>喪假</form:option>
				</form:select>
				</td>
			</tr>
			<tr style='height: 40px'>	
				<td align='center'>原因:</td>
				<td><form:input path='leaveCause' /></td>
			</tr>
			<tr style='height: 40px'>	
				<td colspan='3' align='center'>
					<input type='submit' value='提交'> 
					<input type='reset' value='還原'> 
				</td>
			</tr>
			</table>
		</form:form>
	</div>
</body>
</html>