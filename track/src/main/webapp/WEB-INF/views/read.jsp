<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:include page="header.jsp" />
<!-- 게시판에서 선택한 게시물 내용이 보여질 화면 -->
<header class="masthead text-black text-center">
<div class="container">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-header text-white" style="background-color:#01DFD7;">${dto.num}</div>
				<div class="card-body">
					 <div class="form-group">
            			<label>작성자</label>
            				<input type="text" class="form-control" name='writer' value="${dto.writer}" readonly>
          			 </div>
          			 
          			 <div class="form-group">
            			<label>제목</label>
            				<input type="text" class="form-control" name='title' value="${dto.title}" readonly>
                	 </div>
                	 
                	 <div class="form-group">
                	 	<lable>내용</lable>
                	 	<textarea class="form-control" rows="5" name='content' readonly>${dto.content}</textarea>
                	 </div>
                	 
                	 <div class="form-group">
                	 	<c:if test="${not empty dto.img}">
                	 	<a href="${cpath}/img/${dto.img}" target="_blank">
                	 		<img src="${cpath}/img/${dto.img}" height="300px">
                	 	</a>
                	 	</c:if>
                	 </div>
				</div>
		  </div>
	</div>
</div>
<br><br><br>
<a class="btn" style="background-color: #0080FF" onclick="history.go(-1);">목록</a>&nbsp;&nbsp;
<c:if test="${member.membername == dto.writer}">
<a class="btn" style="background-color: #00BFFF" href="${cpath}/delete?num=${num}">삭제</a>&nbsp;&nbsp;
<a class="btn" style="background-color: #5F04B4" href="${cpath}/update?num=${num}">수정</a>
</c:if>
</header>
<jsp:include page="footer.jsp" />