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
<h1>HIHIHIIHIHIHI</h1>

		<div align='center'>
				商品類型: <select id='Publish_shoppingType' onchange="memberChange()" >
					<c:forEach var="shoppingType" items="${shoppingType}">
						<option value="${shoppingType}">${shoppingType}</option>
					</c:forEach>
				</select>
			</div>
			
		<hr>
	<div class="col-12 mb-5">
		<form action="">
			<input type="test" class="form-control" id="PorductSearch"
				placeholder="搜尋...">
           <a href='shopping/SearchShoppingName/${"a"}'>測試模糊搜尋</a>
		</form>
	</div>
	
	<div id='showsmember' align='center'><h1></h1>
	</div>
	
	<script>
		function memberChange(){
			var Publish_member = document.getElementById("Publish_shoppingType").value;
			var xhr = new XMLHttpRequest();
			xhr.open("GET","<c:url value='/shopping/"+ Publish_member+"' />",true);
			xhr.send();
			xhr.onreadystatechange = function(){
				if (xhr.readyState == 4 && xhr.status ==200){
					var content = "<table border='1'>";
					content += "<tr><th>帳號</th><th>姓名</th><th>部門</th></tr>";
					var member = JSON.parse(xhr.responseText);
					for (var i= 0 ; i<member.length ; i++){
						content += "<tr><td align='center'>"+ member[i].shoppingId + "</td>" +
						"<td>"+ member[i].shoppingname + "</td>" +
						"<td>"+ member[i].shoppingType + "</td>"
					}
					content += "</table>";
					var div = document.getElementById("showsmember");
					div.innerHTML = content;
				}
			}
		}
	</script>
</body>
</html>