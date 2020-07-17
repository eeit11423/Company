<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Members</title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/styles.css'
	type="text/css" />
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h1>會員清單</h1>
			</div>
		</div>
		<div>
			<div class="container" style="text-align: center">
				<h1>請選擇部門</h1>
				<c:forEach var="dep" items='${memberList}'>
					<a href='members/${dep}'>${dep}</a>
					<br>
				</c:forEach>
			</div>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<div class="row">
			<c:forEach var='member1' items='${members}'>
				<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
					<div class="thumbnail" style="width: 320px; height: 340px">
						<img height='200' width='100'
							src="<c:url value='/getPicture/${member1.memberId}' />" />
						<div class="caption">
							<p>
								<b style='font-size: 16px;'>${member1.memberNumber}</b>
							</p>
							<p>帳號: ${member1.memberNumber}</p>
							<p>信箱: ${member1.memberEmail}</p>
							<p>性別: ${member1.memberGender}</p>
							<p>部門: ${member1.memberDepartment}</p>
							<p>
								<a href="delect/${member1.memberId}" class="btn btn-primary">
									<span class="glyphicon-info-sigh glyphicon"></span>刪除
								</a> <a href="update/${member1.memberId}" class="btn btn-primary">
									<span class="glyphicon-info-sigh glyphicon"></span>修改
								</a>
							</p>

						</div>
					</div>
				</div>
			</c:forEach>
			<div align='center'>
				<a href="<c:url value='/' />">回首頁</a>
			</div>
		</div>
	</section>
</body>
</html>
