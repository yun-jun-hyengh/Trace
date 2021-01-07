<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:include page="header.jsp" />

<header class="masthead text-black text-center">
	
	<h1>회원님의 비밀번호는 : ${sessionScope.member2.memberpw}</h1>
	<h1>잃어버리지 마세요!!!~~~</h1>
	
<a class="btn" style="background-color: #0080FF" href="${cpath}/login">로그인</a>
</header>
<jsp:include page="footer.jsp"/>