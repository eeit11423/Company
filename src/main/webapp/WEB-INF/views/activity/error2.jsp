<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主辦人已刪除或變更該活動</title>
</head>
<body>
<jsp:include page="/fragment/header.jsp" />
<div style="text-align:center">

<hr>
	<div align='center'>
		<h1 class="bg-secondary text-light">活動變更提醒</h1>
<hr>

活動主辦人<strong>已刪除或變更</strong>該活動<br>
已替您<strong>刪除該筆參加紀錄</strong>，若需重新報名請聯絡主辦人<br>
<br>
<a type="button" class="btn btn-info" href='${pageContext.request.contextPath}/activity/queryJoinsByActMemberId' >回我參加的活動</a>
<hr>
</div>
</body>
</html>