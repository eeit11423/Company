<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
<style type="text/css">
   span.error {
	color: red;
	display: inline-block;
	font-size: 5pt;
}
</style>
<meta charset="UTF-8">
<%-- <link rel='stylesheet' href='${pageContext.request.contextPath}/css/style.css'  type="text/css" /> --%>
</head>
<body>
<jsp:include page="/fragment/header.jsp" />

<div align="center">
<hr>
		<h1 class="bg-secondary text-light">活動報名</h1>
<hr>

<fieldset>
	<Table align="center">
	<c:if test='${activity.id == null}'>
		<br>
	 	<tr>
	      <td>找不到活動，請聯絡承辦人員<br>&nbsp;</td>
	   </tr>
    </c:if>	   
    	<c:if test='${activity.id != null}'>
	 	<tr>
	      <td>活動序號：<br>&nbsp;</td>
	   	  <td>
	   	  	${activity.id}<br>&nbsp;
	   	  </td>
	   	  
	   </tr>
    </c:if>	
    <tr>
	      <td>活動名稱：<br>&nbsp;</td>
		  <td  width='360'>
		  ${activity.activityTitle}<br>&nbsp;
		  </td>
	   </tr>
	   <tr>
	      <td>參加人員：<br>&nbsp;</td>
		  <td  width='360'>
		  ${memberBean.memberId} ${memberBean.memberName}<br>&nbsp;
		  </td>
	   </tr>
	   	   <tr>
	      <td>報名時間：<br>&nbsp;</td>
		  <td  width='360'>
		  <c:forEach var='join' items='${joins}' >
	      ${join.joinTime}<br>&nbsp;
         </c:forEach> 
		  </td>
	   </tr>
	   
<!-- 	   刪除出現錯誤 -->
<!-- 	      <tr> -->
<!-- 	    <td colspan='4' align='center'><br>&nbsp; -->
<%-- 	    <c:forEach var='join' items='${joins}' > --%>
<!-- 	      <a class="deletelink"  -->
<%-- 	      href="${pageContext.request.contextPath}/activity/join2/${join.id}">取消報名</a> --%>
<%-- 	        </c:forEach>  --%>
<!--         </td> -->
<!-- 	   </tr> -->
	</Table>

	
</fieldset>
<br>
<a href="<c:url value='/activity/showAllActivities'/> " >回前頁</a>

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
</div>
<footer class="bg-secondary text-white" align='center' style="font-size:20px">
© Copyright 2020
</footer>
</body>
</html>