<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>活動分類</title>

</head>
<body>
<jsp:include page="/fragment/header.jsp" />

<div style="text-align:center" >
<hr>

<h1>請依照類別來挑選活動：</h1>
<c:forEach var='actCategory' items='${actCategoryList}' >
	<a href='activities/${actCategory}'>${actCategory}</a><br>
</c:forEach>
</div>
</body>
</html>