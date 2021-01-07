<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:include page="header.jsp" />
<header class="masthead text-black text-center">
	<div class="container">
		<h1 class="display-3">회원가입이 완료되었습니다.!!!</h1><br>
		<h1 class="display-3">저희 홈페이지에 오셔서 자취생활에 많은 도움이 되시길 바랍니다!!</h1>
	</div>
</header>

<span style="float: center;">
	<a class="btn btn-primary btn-lg" style="background-color: #00BFFF" href="<c:out value='/track'/>">메인페이지이동</a>
</span>
<jsp:include page="footer.jsp" />







