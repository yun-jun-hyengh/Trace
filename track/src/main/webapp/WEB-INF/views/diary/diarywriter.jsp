<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:include page="../header.jsp" />
<header class="masthead text-black text-center">
<div class="container">
		<h3 class="display-5">소중한 추억을 기록하세요!!~~ 따뜻한 마음을 함께 공유해요♥</h3>
</div>
	<form method="post" enctype="multipart/form-data">
		<div class="container" align="center">
			<div class="form-group">
	            <strong><label>제목</label></strong>
	            <input type="text" class="form-control" name='title' placeholder="제목입력" required autofocus>
	        </div>
	    </div>
	    
	    <div class="form-group">
	    	<strong><label>내용</label></strong>
	    	<textarea class="form-control" name="content" rows="10" placeholder="반려동물과 함께한 당신의 하루를 기록하세요" required></textarea>
	    </div>
	    
	    <div class="form-group">
	    	<strong><label>파일첨부</label></strong>
          	<input type="file" name="imageFile">
	    </div>
	    
	    <div class="form-group">
	    	<input type="checkbox" name="ckshare" value="true" checked="checked">&nbsp;<span
							class="glyphicon glyphicon-share text-primary"></span>&nbsp;작성한
						일기를 게시판에 공유합니다.
	    </div>
	    <input type="submit" value="등록" class="btn form-control"
			style="background-color: #0404B4; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
          &nbsp;&nbsp;
          <a class="btn form-control"	href="${cpath}/diary/diarylist"
		style="cursor: pointer; margin-top: 0; height: 40px; color: white; background-color: #01A9DB; border: 0px solid #388E3C; opacity: 0.8">취소</a>
	</form>
</header>
<jsp:include page="../footer.jsp" />