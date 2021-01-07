<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:include page="header.jsp" />
<header class="masthead text-black text-center">
<form id="writeForm" method="post">
<div class="container">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-header text-white" style="background-color:#01DFD7;">${dto.num}</div>
				<div class="card-body">
					 <div class="form-group">
            			<label>작성자</label>
            				<input type="text" class="form-control" name='writer' value="${dto.writer}" required autofocus>
          			 </div>
          			 
          			 <div class="form-group">
            			<label>제목</label>
            				<input type="text" class="form-control" name='title' value="${dto.title}" required>
                	 </div>
                	 
                	 <div class="form-group">
                	 	<lable>내용</lable>
                	 	<textarea class="form-control" rows="5" name='content' required>${dto.content}</textarea>
                	 </div>
				</div>
		  </div>
	</div>
	<br><br><br>
	<input class="btn" style="background-color: #0080FF" type="submit" value="수정"/>
		<a class="btn" style="background-color: #FF00BF" href="<c:url value='/list'/>">목록</a>
</div>
</form>
</header>
<jsp:include page="footer.jsp" />