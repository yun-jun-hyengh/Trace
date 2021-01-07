<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:include page="../header.jsp" />
<br><br>
<header class="masthead text-black text-center">
<div class="container">
<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-header text-white" style="background-color: #01DFD7;"> 게시글 등록</div>
      <div class="card-body">
      <c:if test="${msg == null}">
        <form role="form" method="post" enctype="multipart/form-data">
        
          <div class="form-group">
            <label>작성자</label>
            <input type="text" class="form-control" name='writer' value="${member.membername}" readonly="readonly">
          </div>
          
          <div class="form-group">
            <label>제목</label>
            <input type="text" class="form-control" name='title'>
          </div>

          <div class="form-group">
            <label>내용</label>
            <textarea class="form-control" rows="5" name='content' placeholder="게시글 내용을 입력하세요."></textarea>
          </div>
          <div class="form-group">
          	<label>파일첨부</label>
          	<input type="file" name="imgFile">
          </div>
         <input type="submit" value="등록" class="btn form-control"
			style="background-color: #0404B4; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
          &nbsp;&nbsp;
          <a class="btn form-control"	href="${cpath}/jabdam/jabdamlist"
		style="cursor: pointer; margin-top: 0; height: 40px; color: white; background-color: #01A9DB; border: 0px solid #388E3C; opacity: 0.8">취소</a>
        </form>
        </c:if>
        <c:if test="${msg == false}">
        	<p>로그인을 하셔야 글을 작성할 수 있습니다.</p>
        	<p><a href="${cpath}/login">로그인</a></p>
        </c:if>
      </div>
    </div>
  </div>
</div>
</div>
</header>
<jsp:include page="../footer.jsp" />
    