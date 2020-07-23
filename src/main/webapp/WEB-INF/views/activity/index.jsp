<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>付酬者有限公司員工內部網-活動專區</title>
</head>
<body>
<jsp:include page="/fragment/header.jsp" />
	<div align='center'>

		<!-- 廣告/start -->
    <section class="container-fluid">
        <div class="row">
            <div id="carouselBanner" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselBanner" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselBanner" data-slide-to="1"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="${pageContext.request.contextPath}/images/slider_1.jpg" alt="First slide">
                        <div class="carousel-caption d-none d-md-block text-dark">
                            <h1>活動系統</h1> 
                        </div>
                    </div>
                    
                </div>
                <a class="carousel-control-prev" href="#carouselBanner" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselBanner" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </section>
    <!-- 廣告/end -->
		
		

<!-- 		<a href='showAllActivities'>顯示活動資料</a><br>  -->
<!-- 		<a href='act'>新增活動資料</a><br> -->
<!-- 		<a href='queryByActCategory'>活動分類資料</a><br> -->
<!-- 		<a href='cateByDate'>依日期查詢活動</a><br> -->

	</div>
	    <!-- 頁腳/start -->
    <footer class="bg-dark"  align='center'>
        
        <div class="btn-group">
  
  <a type="button" class="btn btn-outline-secondary" href="<c:url value='showAllActivities' />">全部活動</a>
  <div class="btn-group">
    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">
       活動分類
    </button>
    
    <div class="dropdown-menu">
      <a class="dropdown-item" href="<c:url value='queryByActCategory' />">依活動種類</a>
      <a class="dropdown-item" href="<c:url value='cateByDate' />">依截止日期</a>
    </div>
  </div>
  <a type="button" class="btn btn-outline-secondary" href="<c:url value='act' />">發起活動</a>
  

  <div class="btn-group">
    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">
       個人專區
    </button>
    
    <div class="dropdown-menu">
      <a class="dropdown-item" href="<c:url value='queryByActMemberId' />">我發起的活動</a>
      <a class="dropdown-item" href="<c:url value='queryJoinsByActMemberId' />">我參加的活動</a>
    </div>
  </div>
  
  
  <%--     <a type="button" class="btn btn-outline-secondary" href="<c:url value='queryByActMemberId' />">個人專區</a> --%>
</div>


    </footer>
</body>
</html>