<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:include page="../header.jsp" />
<header class="masthead text-black text-center">
	<div class="container">
		<h3 class="display-5">함께한 추억을 떠올려요 ~~ !! 세상에서 당신이 가장 아름답습니다 ♥</h3>
	</div>	
	<div class="container" align="center">
		<div class="form-group">
			<strong><label>제목</label></strong>
	        <input type="text" class="form-control" name='title' value="${detail.title}" readonly>
	    </div>
	</div>
	
	<div class="form-group">
		<strong><label>내용</label></strong>
	    <textarea class="form-control" name="content" rows="10" readonly>${detail.content}</textarea>
	</div>
	
	<div class="form-group">
		<c:if test="${not empty detail.image}">
			<a href="${cpath}/img/${detail.image}" target="_blank">
				<img src="${cpath}/img/${detail.image}" width="600px" height="400px">
			</a>
		</c:if>
	</div> 
	<br><br>
	<span style="float: left;">&nbsp;&nbsp;
		<a class="btn" style="background-color: #0080FF" href="${cpath}/diary/diarylist">목록</a>
	</span>
	<c:if test="${member.memberid == detail.memberid}">
	<span style="float: right;">
		<button id="delete" class="btn btn-danger">삭제</button>&nbsp;&nbsp;
		<button id="update" class="btn btn-primary">수정</button>
	</span>
	</c:if>
</header>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" 
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" 
		crossorigin="anonymous">
</script>   
<br><br>
<script>
	$(function(){
		$('#delete').on('click', function(){
			location.href = "${cpath}/diary/diarydelete?no=${detail.no}&memberid=${detail.memberid}";	
		});
	});
	
	$(function(){
		$('#update').on('click', function(){
			location.href = "${cpath}/diary/diaryupdate?no=${detail.no}&memberid=${detail.memberid}";	
		});
	});
</script>
<jsp:include page="../footer.jsp"/>