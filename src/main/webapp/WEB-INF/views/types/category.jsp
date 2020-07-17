<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align='center'>
		<h1>請選擇部門</h1>
		<h2>aaaa</h2>
		<c:forEach var="dep" items='${memberList}'>
			<a href='members/${dep}'>${dep}</a><br>
		</c:forEach>
	</div>
</body>
</html>