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
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/style.css'  type="text/css" />
</head>
<body>
<jsp:include page="/fragment/header.jsp" />
<div style="text-align:center">
<hr>
		<h1 class="bg-secondary text-light">新增活動資料</h1>
<hr>
</div>
<fieldset>
	<form:form method="POST" modelAttribute="activity" enctype='multipart/form-data'>
	<Table align="center">
	<c:if test='${activity.id == null}'>
		<br>
	 	<tr>
	      <td>活動名稱：<br>&nbsp;</td>
	   	  <td width='360'><form:input path='activityTitle' id="actTitle"/><br>&nbsp;
	   	   <form:errors path="activityTitle" cssClass="error"/>
	   	  </td>
	   	  <td>簡介：<br>&nbsp;</td>
		  <td  width='360'><form:input path='activitySubtitle' id="actSubtitle"/><br>&nbsp;	
		      <form:errors path='activitySubtitle' cssClass="error"/>
		  </td>
	   </tr>
    </c:if>	   
    	<c:if test='${activity.id != null}'>
	 	<tr>
	      <td>活動名稱：<br>&nbsp;</td>
	   	  <td><form:hidden path='activityTitle'/>
	   	  	${activity.activityTitle}<br>&nbsp;
	   	  </td>
	   	  <td>簡介：<br>&nbsp;</td>
		  <td  width='360'><form:input path='activitySubtitle' id="actSubtitle"/><br>&nbsp;	
		      <form:errors path='activitySubtitle' cssClass="error"/>
		  </td>
	   </tr>
    </c:if>	
    
	   <tr>
<!-- 	      <td>簡介：<br>&nbsp;</td> -->
<%-- 		  <td  width='360'><form:input path='activitySubtitle' /><br>&nbsp;	 --%>
<%-- 		      <form:errors path='activitySubtitle' cssClass="error"/> --%>
<!-- 		  </td> -->
		  <td>內容：<br>&nbsp;</td>
	      <td  colspan="3">
	      	<form:textarea path="content" cols="90" id="actContent"/><br>&nbsp;	
		      <form:errors path='content' cssClass="error"/>
		  </td>
	   </tr>
	   <tr>
	      <td>報名開始日：<br>&nbsp;</td>
	   	  <td>
	      	<form:input type="date" path="startDate"/><br>&nbsp;	
		      <form:errors path='startDate' cssClass="error"/>
		  </td>
		   <td>報名結束日：<br>&nbsp;</td>
	   	  <td>
	      	<form:input type="date" path="endDate"/><br>&nbsp;	
		      <form:errors path='endDate' cssClass="error"/>
		  </td>
	   </tr>	   
	  	   
	   <tr>
	      <td>貼文單位：<br>&nbsp;</td>
	   	  <td>
			<form:select path="department.id" >
				<form:option value="-1" label="請挑選" />
				<form:options  items="${departmentList}"
	   	  	       itemLabel='name' itemValue='id'/>
	   	  	</form:select><br>&nbsp;
	   	  <form:errors path="department"  cssClass="error"/>
	   	  </td>
	   	   <td>活動分類：<br>&nbsp;</td>
	   	  <td>
	   	  	<form:select path="actCategory">
	   	  		<form:option value="不分類" label="不分類" />
				<form:options  items="${actCategoryAllList}"/>
	   	  	</form:select><br>&nbsp;
	   	   <form:errors path="actCategory"  cssClass="error" /></td>
	   </tr>
	   
	   <tr> 
	    <td>貼文者：<br>&nbsp;</td>
        <td  width='360'><form:hidden path='organiserId' value='${memberBean.memberId}' />
        ${memberBean.memberId}　　 ${memberBean.memberName}<br>&nbsp;	
		      <form:errors path='organiserId' cssClass="error"/>
		  </td>
	   	  
	   	  <td>海報上傳：<br>&nbsp;</td>
	   	  <td>
	   	  	 <form:input path="otherImage" type='file'/><br>&nbsp;
	   	  	 <form:errors path="otherImage"  cssClass="error" />
	   	  </td>
	   </tr>
	   <tr>
	   <td>報名人數上限：<br>&nbsp;</td>
	   	  <td>
	   	  	 <form:input path="joinNum" id="actJoin"/><br>&nbsp;	
		      <form:errors path='joinNum' cssClass="error"/>
	   	  </td>
	    <td>
	      <input type='submit' class="btn btn-info" value=" 送出活動資料  " ><br>&nbsp;
        </td>
        <td>
        <a class="btn btn-outline-secondary" id="demobtn"> DEMO </a>
        <a class="btn btn-outline-secondary" href="<c:url value='/activity/index' />"> 取消 </a>
        <br>&nbsp;</td>
	   </tr>
	</Table>
		 
	</form:form>
	
</fieldset>
<footer class="bg-secondary text-white" align='center' style="font-size:20px">
© Copyright 2020
</footer>

<!-- 一鍵的語法 -->
	<script type='text/javascript'>
		$(document).ready(function() {
			$('#demobtn').click(function() {
				 $("#actTitle").val("咖啡午聚");
				 $("#actSubtitle").val("星X客有買一送一");
				 $("#actContent").val("109/8/3 15:00 樓下星X克門口集合");
				 $("#actJoin").val("5");
	            
			});
		})
	</script>

</body>
</html>