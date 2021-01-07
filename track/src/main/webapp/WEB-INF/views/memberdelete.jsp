<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:include page="header.jsp" />
<header class="masthead text-black text-center">
	<div class="container">
		<h2 class="display-4">회원정보삭제</h2>
	</div>
</header>
<div class="container">
	<form name="Papago" class="form-horizontal" method="post">
		<div class="form-group row">
			<label class="col-sm-2">아이디</label>
			<div class="col-sm-3">
				<input type="text" name="memberid" id="memberid" class="form-control" value="${member.memberid}" readonly="readonly">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">비밀번호</label>
			<div class="col-sm-3">
				<input id="memberpw" type="password" name="memberpw" class="form-control">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">이름</label>
			<div class="col-sm-3">
				<input type="text" name="membername" class="form-control" value="${member.membername}" readonly="readonly">
			</div>
		</div>
	<br><br><br><br>
	<div class="form-group row">
		<div class="col-sm-offset2 col-sm-10">
			<input type="submit" class="btn btn-primary" value="회원탈퇴">&nbsp;&nbsp;&nbsp;
		</div>
	</div>
	</form>
	<div>
		<c:if test="${msg == false}">
			비밀번호가 맞지 않습니다.
		</c:if>
	</div>
</div>
<jsp:include page="footer.jsp" />