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
<fieldset>
	<legend >活動報名(Activity)</legend> 
	<form:form method="POST" modelAttribute="join" enctype='multipart/form-data'>
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
	   	  <td><form:hidden path='activityId' value='${activity.id}'/>
	   	  	${activity.id}<br>&nbsp;
	   	  </td>
	   	  
	   </tr>
    </c:if>	
    <tr>
	      <td>活動名稱：<br>&nbsp;</td>
		  <td  width='360'><form:hidden path='activityName' value='${activity.activityTitle}'/>
		  ${activity.activityTitle}<br>&nbsp;
		  </td>
	   </tr>
	   <tr>
	      <td>參加人員：<br>&nbsp;</td>
		  <td  width='360'><form:hidden path='joinMemberId' value='${memberBean.memberId}' />	
		  ${memberBean.memberId} ${memberBean.memberName}<br>&nbsp;
		  </td>
	   </tr>
	   	   <tr>
	    <td colspan='4' align='center'><br>&nbsp;
	      <input type='submit'>
        </td>
	   </tr>
	</Table>
		 
	</form:form>
	
</fieldset>
<br>
<a href="<c:url value='/activity/showAllActivities'/> " >回前頁</a>
</body>
</html>