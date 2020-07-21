<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
 <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/dist/css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/dist/css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->
<!-- <script src='//ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>  -->
<jsp:include page="/fragment/header.jsp" />



<body>

   
<!-- <div id="featured-wrapper"  class="container" > -->
	<div id="featured" class="container">
		<div class="major">
			<h2>數據分析</h2>
		
		</div>
	
		<div class="column1" >
			<a class="" href="<c:url value='/rearend/allSalary'  />">
			<span id="click1" class="icon icon-bar-chart " ></span></a>
			<div class="title ">
				<h2>會員數據</h2>
				
			</div>
		</div>
		
		<div class="column2">
			<a class="" href="<c:url value='/number' />">
			<span id="click2" class="icon icon-bar-chart"></span></a>
			<div class="title">
				<h2 >商品數據</h2>
	
			</div>
		</div>
		<div class="column3">
			<span id="click3" class="icon icon-building"></span>
			<div class="title">
				<h2>活動數據</h2>
		
			</div>
		</div>
		<div class="column4"  >
			<span id="click4" class="icon icon-picture"></span>
			<div class="title">
				<h2>出缺勤數據</h2>
	
			</div>
	
		</div>
	</div>
<!-- </div> -->

<script >

$("span").hover(function(){
	$(this).css('cursor','pointer') ; 
});
</script>

</body>
</html>