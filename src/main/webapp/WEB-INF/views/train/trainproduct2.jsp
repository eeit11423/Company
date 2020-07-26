<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Video</title>

</head>
<body>
<jsp:include page="/fragment/header.jsp" /> 
<%-- <h1>${{memberBean.memberName}}</h1> --%>
<form action='' method='POST'>
			<section>
				<div>
					<div class="container" style="text-align: center">
						<h1>影音課程</h1>
					</div>
				</div>
			</section>
			<div style="text-align: center">
				<figure>
					<iframe src="<c:url value='${product.URLUpload}'/>" 
						width=1000 height=600 frameborder="0" allowfullscreen></iframe>			   
				</figure>
			</div>				                    
			
	</form>
	
</body>
</html>
