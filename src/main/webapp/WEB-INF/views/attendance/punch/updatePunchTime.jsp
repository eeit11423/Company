<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<style>
</style>
<meta charset="UTF-8">
<title>>修改出勤紀錄</title>
<script type="text/javascript">
// 	function confirmDelete(userId) {
// 		var result = confirm("確定刪除此筆記錄(帳號:" + userId.trim() + ")?");
// 		if (result) {
// 			document.forms[0].putOrDelete.value = "DELETE";
// 			return true;
// 		}
// 		return false;
// 	}
	function confirmUpdate(userId) {
		var result = confirm("確定送出此筆記錄(帳號:" + userId.trim() + ")?");
		if (result) {
// 			document.forms[0].putOrDelete.value = "PUT";
			return true;
		}
		return false;
	}
</script>
</head>
<body>
	<jsp:include page="/fragment/header.jsp" />
	<p>
	<hr>
	<div align='center'>
		<h2 align='center'>修改出勤紀錄</h2>
		<hr>
		<a href='../queryPunchTime'>回查詢頁面</a>
		<!-- 				<a href='punchlist'>回前頁</a> -->
		<p>
			<form:form class='center' action="../punchTime/update/${punch.punchId}" modelAttribute="punch"
				method="POST">
<!-- 				<input type="hidden" name="_method" id='putOrDelete' value=""> -->
				<input type="hidden" name="punchId" value="${punch.punchId}">
				<input type="hidden" name="memberName" value="${punch.memberName}">
				<input type="hidden" name="finalDecision" value="">
				<Table>
					<TR>
						<TD align="RIGHT">姓名：</TD>
						<TD align="LEFT">${punch.memberName}</TD>
					</TR>
					<TR>
						<TD align="RIGHT">打卡日期：</TD>
						<TD align="LEFT"><form:input path="punchDate" size="30" /> <font
							color='red' size='-3'>${error.punchDate}</font></TD>
					</TR>
					<TR>
						<TD align="RIGHT">上班時間：</TD>
						<TD align="LEFT"><form:input path="punchWorkOn" /> <font
							color='red' size='-3'>${error.punchWorkOn}</font></TD>
					</TR>
					<TR>
						<TD align="RIGHT">下班時間：</TD>
						<TD align="LEFT"><form:input path="punchWorkOff" /> <font
							color='red' size='-3'>${error.punchWorkOff}</font></TD>
					</TR>

					<TR>
						<TD colspan="2" align="center">
<%-- 							<input type="submit" value="更新" name='updateBtn' onclick="return confirmUpdate('${punch.memberName}');">  --%>
<%-- 							<input type="submit" value="刪除" name='deleteBtn' onclick="return confirmDelete('${punch.memberName}');"> --%>
							<input type='submit' value='提交'>
							<input type='reset' value='還原'>
					</TR>
				</Table>
				<c:if test="${not empty requestScope.modify}">
					<c:remove var="punch" scope="request" />
				</c:if>
			</form:form>
		<p />
	</div>
</body>

</html>
