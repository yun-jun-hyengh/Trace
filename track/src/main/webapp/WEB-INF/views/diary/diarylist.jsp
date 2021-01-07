<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:include page="../header.jsp" />
<header class="masthead text-black text-center">
<div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1">
		<section class="content-header">
		<h4>일기목록</h4>
			<ol class="breadcrumb text-left">
				<li><a href="${cpath}/diary/diarywriter"><i class="fa fa-dashboard"></i><span
					class="glyphicon glyphicon-pencil text-primary">&nbsp;</span>일기쓰기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</a></li>
				<li class="active">사람 사이의 신뢰는 깨지기 쉽다. 그러나 충직한 개는 결코 우리를 배신하지 않는다.</li>
			</ol>
		</section>
	<br />
</div>

<div class="container">
	<div id="sample" style="width: 210px; height: 210px; border:1px solid black; border-radius:105px;">
		<img src="${cpath}/assets/img/portfolio/sample5.jpg" width="210px;" height="210px;" style="border-radius:105px;">		
	</div>
	
	<div class="profile-usertitle">
		<div class="profile-usertitle-name" id="nick" style="color: #0000FF"><strong><h2>사랑스런 반려동물과</h2></strong></div>
		<div class="profile-usertitle-job" id="intro">함께한 오늘을 기록하세요~~!! 반려동물은 사랑입니다</div>
	</div>	
</div>
<br>
<c:forEach items="${list}" var="list">
	<div class="media">
		<div class="col-xs-6 col-md-3">
			<a href="${cpath}/diary/diaryread?no=${list.no}&memberid=${list.memberid}" class="thumbnail">
				<img src="${cpath}/img/${list.image}" width="240px" height="165px">
			</a>
		</div>
		<div class="media-body">
			<a href="${cpath}/diary/diaryread?no=${list.no}&memberid=${list.memberid}">
				<h3>
					<strong>${list.title}</strong>
				</h3>
			</a><em><span class="text-primary">${list.memberid}
			</span>&nbsp;&nbsp;작성일
				${list.regdate}
			</em>
		</div>
	</div>
</c:forEach>
</header>
<jsp:include page="../footer.jsp" />