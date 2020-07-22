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

<h1 class="bg-secondary text-white">請依照類別來挑選活動</h1>
<div style="display:flex">
<img src="${pageContext.request.contextPath}/images/art.jpg" alt="ART" title="藝術" width="400px" height="300px">
<img src="${pageContext.request.contextPath}/images/sport.jpg" alt="SPORT" title="運動" width="400px" height="300px">
<img src="${pageContext.request.contextPath}/images/relation.jpg" alt="RELATION" title="聯誼" width="400px" height="300px">
<img src="${pageContext.request.contextPath}/images/game.jpg" alt="GAME" title="遊戲" width="400px" height="300px">
</div>

 <footer class="bg-secondary"  align='center'>
<div class="btn-group">
<c:forEach var='actCategory' items='${actCategoryList}' >
<p class="bg-secondary text-white" style="font-size: 30pt">｜</p>
  <a type="button" type="button" class="btn btn-secondary" style="font-size: 30pt" href='activities/${actCategory}'>${actCategory}</a>
</c:forEach>
<p class="bg-secondary text-white" style="font-size: 30pt">｜</p>
</div>
</footer>
<a class="btn btn-link"
			href="<c:url value='/activity/index' />">返回前頁</a>

<%-- <c:forEach var='actCategory' items='${actCategoryList}' > --%>
<%-- 	<a href='activities/${actCategory}'>${actCategory}</a><br> --%>
<%-- </c:forEach> --%>

</div>
</body>
</html>