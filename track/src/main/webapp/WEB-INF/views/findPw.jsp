<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:include page="header.jsp" />
<header class="masthead text-black text-center">
	<div class="container">
		<h1 class="display-5">비밀번호 찾기</h1>
	</div>
	<br><br>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<form class="FineForm" method="POST">
				<div class="form-group">
					<input type="text" name="memberid" class="form-control" placeholder="아이디를 입력하세요">
				</div>
				<div class="form-group">
					<input type="text" name="email" class="form-control" placeholder="이메일을 입력하세요">
				</div>
				<input type="submit" class="btn btn-lg btn-success btn-block" value="찾기">
			</form>
			<br><br>
		</div>
	</div>
</header>
<jsp:include page="footer.jsp"/>