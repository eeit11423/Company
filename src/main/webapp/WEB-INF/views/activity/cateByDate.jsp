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
<h3>依日期查詢活動</h3>
<form action="cateByDate.do"> 
起始日期：<input type="date" name="begin"/> 
結束日期：<input type="date" name="end"/> 
<input type="submit" value="查詢"> 
</form> 
</body>
</html>