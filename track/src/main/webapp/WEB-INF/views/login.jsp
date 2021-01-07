<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:include page="header.jsp" />
<header class="masthead text-black text-center">
	<div class="container">
		<h1 class="display-3">로그인</h1>
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<form class="loginForm" method="POST" action="${cpath}/login">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디" name="memberid">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" name="memberpw">
				</div>
				<input class="btn btn-lg btn-success btn-block" type="submit" value="로그인">
				<br>
				<a id="custom-login-btn" href="https://kauth.kakao.com/oauth/authorize?client_id=1b99bdb2b2d8b2b7b7f7c7ee8f97842b&redirect_uri=http://localhost:8181/ggbro/kakaoLogin&response_type=code">
									<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
				</a>
			</form>
		</div>
	</div>
	<a href="${cpath}/findId">아이디 찾기</a>&nbsp;&nbsp;
	<a href="${cpath}/findPw">비밀번호 찾기</a>&nbsp;&nbsp;
	<a href="${cpath}/member">회원가입</a>&nbsp;&nbsp;
</header>
<jsp:include page="footer.jsp" />