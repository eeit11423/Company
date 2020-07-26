<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type='text/javascript'
	src='${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js'></script>
<title></title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/style.css' type="text/css" />
</head>
<body>

<jsp:include page="/fragment/headerRearend.jsp" />

			
			<div>
			</div>
		<hr>
		<form method='POST'>
			<input type='hidden' name='_method' value='DELETE'>
		</form>

		<c:choose>
			<c:when test="${empty indexBean}">
	    沒有任何商品資料<br>
			</c:when>
			<c:otherwise>
			    <div class="main-panel"> 
			    <div class="content-wrapper">
			<div class="row">
<!--             <div class="col-md-10 grid-margin stretch-card"> -->
<!--               <div class="card"> -->
<!--                 <div class="card-body"> -->
<!--                   <p class="card-title mb-0">Top Products</p> -->
                  <div class="table-responsive">
             
			<div class="container-fluid " id="double-scroll">
				<table class="table-hover border border-secondary"   >
					<tr class="text-white text-left border border-secondary " style='background:#646D73'>
						<th width='50' class="border border-secondary " >No</th>
						<th width='50' class="border border-secondary " >員工編號</th>
						<th width='auto' class="border border-secondary " >標頭文字</th> 
						<th width='200' class="border border-secondary " >文字內容</th>
						<th width='50'  class="border border-secondary ">照片名稱</th>
						<th  width='300' height='100' class="border border-secondary ">照片</th>
						<th width='100' class="border border-secondary ">上傳日期</th>						
						<th colspan='2' width='100'  class="border border-secondary" style="text-align: center">維護</th>
					</tr>
					
					<c:forEach var='indexBean' items='${indexBean}'>
						<tr    id="testshow" class="border border-secondary "> 		
						<td  class="border border-secondary ">${indexBean.indexId}</td>		
							<td  class="border border-secondary ">${indexBean.memberNumber}</td>
							<td width='auto' class="border border-secondary ">${indexBean.indexH2}</td>
							<td  class="border border-secondary " width='200'>${indexBean.indexP}</td>
							<td  class="border border-secondary ">${indexBean.indexfileName}</td>
							<td  class="border border-secondary " width='300' height='100'><img width='300' height='100'
								src='picture/${indexBean.indexId}' /></td>
							<td width='100' class="border border-secondary "><fmt:formatDate value="${indexBean.indexDate}" pattern="yyyy-MM-dd"/></td>
							<td  class="border border-secondary "><a
								href="${pageContext.request.contextPath}/index/sh/${indexBean.indexId}">編輯</a></td>
							<td  class="border border-secondary "><a class='deletelink'
								href="${pageContext.request.contextPath}/index/sh1/${indexBean.indexId}">刪除</a></td>
						</tr>
					</c:forEach>
				</table>
				</div></div></div></div>
				</div>
				</div>
					</div>
				
			</c:otherwise>
		</c:choose>
<!-- 		<div class='container' align="center"> -->
<!-- 		<a class="btn btn-secondary btn-lg" -->
<%-- 					href="<c:url value='/'/> ">回首頁</a> --%>
	
	
	
	
	<script type='text/javascript'>

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