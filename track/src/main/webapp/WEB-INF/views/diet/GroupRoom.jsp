<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:include page="../header.jsp" />
<header class="masthead text-black text-center">
	<div class="s-content s-content--narrow al_center container"
		style="height: auto; padding-top: 0">
		<div class="col-sm-12 col-lg-12 col-md-12">
			<div>
				<h1 style="float: middle;">그룹방</h1>
				<hr>
			</div>
		</div>
	</div>
	<section class="s-content s-content--narrow container"
		style="height: auto; padding-top: 0">
		<div align="right">
			<a class="btn r_btn" href="${cpath}/diet/GroupMake"
				style="text-align: right; background-color: #2EFE64">그룹 만들기</a>
		</div><br>
		<table class="table table-hover">
			<thead>
				<tr style="background-color: #A901DB; color: white; border: 0px solid #f78f24;">
					<th>방번호</th>
					<th>방장</th>
					<th>그룹명</th>
					<th>지역</th>
					<th>생성일</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="list">
				<tr>
					<th>${list.grid}</th>
					<th>${list.grwriter}</th>
					<th><a href="${cpath}/diet/GroupIn/${list.grid}">${list.grname}</a></th>
					<th>${list.grlocal}</th>
					<th><fmt:formatDate value="${list.grdate}" pattern="yyyy-MM-dd"/></th>
				</tr>
			</c:forEach>
		</table>
	</section>
</header>
<jsp:include page="../footer.jsp" />