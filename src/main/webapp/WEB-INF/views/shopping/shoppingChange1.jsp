<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/fragment/header.jsp" />
	<h1>分類一</h1>
	<form method='POST'>
		<input type='hidden' name='_method' value='DELETE'>
	</form>
		<input type="test" class="form-control" id="PorductSearch"
				placeholder="搜尋..." onkeyup='keyup()'>
	<div align='center'>
		商品類型: <select id='Publish_shoppingType' onchange="memberChange()">
			<option value="-1">請選擇</option>
			<c:forEach var="shoppingType" items="${shoppingType}">
				<option value="${shoppingType}">${shoppingType}</option>
			</c:forEach>
		</select>

	
	</div>
	<c:forEach varStatus="vs" var='SearchShoppingName'
		items='${SearchShoppingName}'>
		<tr>
			<td class="product-name">${SearchShoppingName.shoppingname}</td>
		</tr>
	</c:forEach>
	<hr>
	<div id='showsmember' align='center'>
		
	</div>

	<script>
		function keyup() {
			var x = $("#PorductSearch").val();
			console.log($("#PorductSearch").val())
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "<c:url value='/shopping/search/"+x+"' />", true);
			xhr.send();
			xhr.onreadystatechange = function() {
							if (xhr.readyState == 4 && xhr.status ==200){
								var content ='<div class="col-12 mt-3 mb-3"> <p class="d-inline-block">顯示 21 筆結果中的 1–9 筆</p><form action="" class="d-inline-block float-right"> <select id="ProductSelect" class="form-control" onchange="javascript:handleSelect(this)">'+
		                          '<option value="allProducts">請選擇排序</option><option value="allProducts">依上架時間舊到新</option>'+
			                        '<option value="AllProductsNewtoOld">依上架時間新到舊</option><option value="AllProductsPriceLowtoHigh">依價格排序:低至高</option>'+
			                       '<option value="AllProductsPriceHightoLow">依價格排序:高至低</option>  </select>	</form> </div>';
			             var member = JSON.parse(xhr.responseText);
			             console.log(member)
			       	  //  var xhr_img = new XMLHttpRequest();
			             for (var i= 0 ; i<member.length ; i++){
								content +='<div class="col-12 col-sm-6 col-md-4 mb-3 "><div class="card">'+
								'<img class="card-img-top" src="picture/'+member[i].shoppingId+'" alt="${product.shoppingId}">'+
								'<div class="card-body card">'+'<h5 class="card-img-top">'+member[i].shoppingname+'</h5>'+
								'<h5 class="card-text ">'+'<small class="mr-1"> <del>$&nbsp;'+member[i].shoppingProductPrice+'</del>'+
								'</small> <span class="card-text text-danger">$'+
								Math.ceil(member[i].shoppingProductPrice * member[i].shoppingProductDiscount)+'</span></h5>'+
								'<a href="oneProduct?id='+member[i].shoppingId+'" class="btn btn-outline-secondary btn-block">查看商品</a>'+
								'<form action="addToCart" method="POST"><input type="hidden" name="shoppingId"'+
								'value="'+member[i].shoppingId+'"> <input type="hidden" name="orderItemsNumber" value="1">'+
								'<input class="btn btn-outline-primary btn-block" type="submit" value="加入購物車">		</form>'
						            
								+'</div></div></div>'
															
							}
			content += "";
			var div = document.getElementById("showsmember");
			div.innerHTML = content;
						}
					}
		}

		function memberChange() {
			var Publish_member = document
					.getElementById("Publish_shoppingType").value;
			var xhr = new XMLHttpRequest();
			//var xhr_img = new XMLHttpRequest();
			xhr.open("GET", "<c:url value='/shopping/"+ Publish_member+"' />",	true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var content = "<table border='1'>";
					content += "<tr><th width='56'>購物ID</th><th width='140'>員工編號</th><th width='180'>商品名稱</th><th width='130'>商品編號</th>"
							+ "<th width='64'>商品總數</th><th width='56'>商品價格</th><th width='180'>類型</th>	<th width='180'>照片名稱</th>"
							+ "<th>照片</th><th width='180'>折扣</th><th width='180'>商品敘述</th><th width='180'>上傳時間</th><th colspan='2' width='72'>資料維護</th></tr>"
					var member = JSON.parse(xhr.responseText);
					var xhr_img = new XMLHttpRequest();
					for (var i = 0; i < member.length; i++) {
						var timestamp3 = member[i].shoppingDate;
						var newDate = new Date();
						newDate.setTime(timestamp3);
						content += '<tr><td style="text-align: center"><a href="shopping/oneProduct?id='
								+ member[i].shoppingId
								+ '">'
								+ member[i].shoppingId
								+ '</a></td>'
								+ "<td>"
								+ member[i].memberNumber
								+ "</td>"
								+ "<td>"
								+ member[i].shoppingname
								+ "</td>"
								+ "<td>"
								+ member[i].shoppingItemId
								+ "</td>"
								+ "<td>"
								+ member[i].shoppingProductTotal
								+ "</td>"
								+ "<td>"
								+ member[i].shoppingProductPrice
								+ "</td>"
								+ "<td>"
								+ member[i].shoppingType
								+ "</td>"
								+ "<td>"
								+ member[i].shoppingfileName
								+ "</td>"
								+ "<td><img width='60' height='72' src='shopping/picture/"+member[i].shoppingId+"' /></td>"
								+ "<td>"
								+ member[i].shoppingProductDiscount
								+ "</td>"
								+ "<td>"
								+ member[i].productrelation
								+ "</td>"
								+ "<td>"
								+ newDate.toLocaleString()
								+ "</td>"
								+

								'<td><a href="shopping/sh/'+member[i].shoppingId+'">編輯</a></td>'
								+ '<td><a  class="deletelink" href="shopping/sh1/'+member[i].shoppingId+'">刪除</a></td>'
								+

								"</tr>"
						//xhr_img.open("GET","<c:url value='shopping/picture/"+member[i].shoppingId+"' />",true);
						//xhr_img.send();
					}
					content += "</table>";
					var div = document.getElementById("showsmember");
					div.innerHTML = content;
				}
			}
		}
		$(document).ready(function() {
			$('.deletelink').click(function() {
				if (confirm('確定刪除此筆紀錄? ')) {
					var href = $(this).attr('href');
					$('form').attr('action', href).submit();
				}
				return false;

			});
		})
	</script>
</body>
</html>