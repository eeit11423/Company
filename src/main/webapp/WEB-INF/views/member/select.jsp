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
<!-- <link rel='stylesheet' -->
<%-- 	href='${pageContext.request.contextPath}/css/styles.css' --%>
<!-- 	type="text/css" /> -->
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h1>會員清單</h1>
			</div>
			<div align='center'>
				請挑選部門: <select id='Publish_test' onchange="memberChange()">
					<c:forEach var="member" items="${memberList}">
						<option value="${member}">${member}</option>
					</c:forEach>
				</select>
				<hr>

			</div>

			<div id='showsmember' align='center'>
				<h1></h1>
			</div>

		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<div class="row" id='testshow'>
			<c:forEach var='member1' items='${members}'>
				<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
					<div class="thumbnail" style="width: 320px; height: 340px" >
						<img height='200' width='100'
							src="<c:url value='/getPicture/${member1.memberId}' />" />
						<div class="caption" >
							<p>
								<b style='font-size: 16px;'>${member1.memberName}</b>
							</p>
							<p>會員帳號: ${member1.memberNumber}</p>
							<p>會員信箱: ${member1.memberEmail}</p>
							<p>會員性別: ${member1.memberGender}</p>
							<p>會員部門: ${member1.memberDepartment}</p>
							<p>
								<a class="btn btn-primary" href="delect/${member1.memberId}" >
									<span class="glyphicon-info-sigh glyphicon"></span>刪除
								</a> 
								<a href="update/${member1.memberId}" class="btn btn-primary">
									<span class="glyphicon-info-sigh glyphicon"></span>修改
								</a>
								<a href="personal/${member1.memberId}" class="btn btn-primary">
									<span class="glyphicon-info-sigh glyphicon"></span>詳細資料
								</a>
							</p>

						</div>
					</div>
				</div>
			</c:forEach>
			
		</div>
		<div align='center'>
				<a href="<c:url value='/' />">回首頁</a>
			</div>
	</section>
	<script>
		function memberChange(){
			var Publish_member = document.getElementById("Publish_test").value;
			var xhr = new XMLHttpRequest();
			xhr.open("GET","<c:url value='/membersdepart/"+ Publish_member+"' />",true);
			xhr.send();
			xhr.onreadystatechange = function(){
				if (xhr.readyState == 4 && xhr.status ==200){
					var content = "";
					var member = JSON.parse(xhr.responseText);
					for (var i= 0 ; i<member.length ; i++){
						content += "<div class='col-sm-6 col-md-3' style='width: 360px; height: 360px'>"+
						"<div class='thumbnail' style='width: 320px; height: 340px' >"+
						"<img height='200' width='100' src='<c:url value='/getPicture/"+member[i].memberId+"' />' />"
						content += "<div class='caption' >"+
						"<p><b style='font-size: 16px;'>" + member[i].memberName + "</b></p>"+
				 		"<p> 會員編號 :" + member[i].memberNumber + "</p>" +
						"<p> 會員信箱 :" + member[i].memberEmail + "</p>" + 
						"<p> 會員部門 :" + member[i].memberDepartment + "</p>"+
						"<p>"+
						"<a class='btn btn-primary' href='delect/" + member[i].memberId +"'>" +
						"<span class='glyphicon-info-sigh glyphicon'></span>刪除</a> " +
						"<a class='btn btn-primary' href='update/" + member[i].memberId +"'>" +
						"<span class='glyphicon-info-sigh glyphicon'></span>修改資料</a> " +
						"<a class='btn btn-primary' href='personal/" + member[i].memberId +"'>" +
						"<span class='glyphicon-info-sigh glyphicon'></span>詳細資料</a> " +
						"</p>"+
						"</div></div></div>" 
					}
					content += "";
					var div = document.getElementById("testshow");
					div.innerHTML = content;
				}
			}
		}
	</script>
</body>
</html>
