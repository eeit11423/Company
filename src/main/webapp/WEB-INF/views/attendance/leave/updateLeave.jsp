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
<title>修改請假紀錄</title>
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
			return true;
		}
		return false;
	}
</script>
</head>
<body>
	<jsp:include page="/fragment/header.jsp" />
	<div class="container" align='center' style="text-align: center">
		<div align='center' style="text-align: center;background-color:#dee2e6">
		<h1 align='center'>查詢請假紀錄</h1><hr>
		<a href='../queryLeave'>回前頁</a>
		</div>
			<form:form class='center' action="../leave/update/${leave.leaveId}"
				modelAttribute="leave" method="POST">
				<input type="hidden" name="leaveId" value="${leave.leaveId}">
				<input type="hidden" name="memberName" value="${leave.memberName}">
				<input type="hidden" name="finalDecision" value="">
				<Table align='center'>
					<TR>
						<TD align="RIGHT">姓名：</TD>
						<TD align="LEFT">${leave.memberName}</TD>
					</TR>
					<TR>
						<TD align="RIGHT">請假日期：</TD>
						<TD align="LEFT"><form:input path="leaveDate" size="30" /> <font
							color='red' size='-3'>${error.leaveDate}</font></TD>
					</TR>
					<TR>
						<TD align="RIGHT">請假開始：</TD>
						<TD align="LEFT"><form:input path="leaveStart" /> <font
							color='red' size='-3'>${error.leaveStart}</font></TD>
					</TR>
					<TR>
						<TD align="RIGHT">請假結束：</TD>
						<TD align="LEFT"><form:input path="leaveEnd" /> <font
							color='red' size='-3'>${error.leaveEnd}</font></TD>
					</TR>

					<TR>
						<TD colspan="2" align="center">
<!-- 							<input type="submit" value="更新" name='updateBtn' -->
<%-- 							onclick="return confirmUpdate('${leave.memberName}');">  --%>
<%-- 							<input type="submit" value="刪除" name='deleteBtn' onclick="return confirmDelete('${leave.memberName}');"> --%>
							<input type='submit' value='提交'>
							<input type='reset' value='還原'>
						</TD>
							
					</TR>
				</Table>
				<c:if test="${not empty requestScope.modify}">
					<c:remove var="leave" scope="request" />
				</c:if>
			</form:form>
		<p />
	</div>
</body>

</html>
