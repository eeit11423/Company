<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>請輸入時間區間</title>
</head>
<body>
<jsp:include page="/fragment/header.jsp" />
<div style="text-align:center">

<hr>
	<div align='center'>
		<h1 class="bg-secondary text-light">依截止日期查詢活動</h1>
<hr>
<form action="cateByDate.do"> 
起始日期：<input type="date" name="begin"/> 
結束日期：<input type="date" name="end"/> 
<input type="submit" value="查詢"> 
<div style="text-align:center" class="text-danger">
無效的查詢，請重新選擇日期
</div>
</form> 
</div>
</div>
</body>
</html>