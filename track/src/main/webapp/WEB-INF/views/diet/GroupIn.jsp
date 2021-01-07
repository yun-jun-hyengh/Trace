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
				<h1 style="float: middle;">${go.grname} 방에 입장하신 걸 환영합니다</h1>
				<hr>
			</div>
		</div>
	</div>
	<section class="s-content s-content--narrow container"
		style="height: auto; padding-top: 0">
		<div align="right">
			<a class="btn r_btn" href="${cpath}/diet/GroupBoardWrite/${go.grid}"
				style="text-align: right; background-color: #2EFE64">글쓰기</a>&nbsp;&nbsp;
			<c:if test="${member.membername == go.grwriter}">
			<a class="btn r_btn" href="${cpath}/diet/delete?grid=${go.grid}"
				style="text-align: right; background-color: #2EFE64">그룹삭제</a>
			</c:if>
		</div>
	</section>
	
	<div class="container">
		<c:forEach items="${list}" var="list">
		<div class="col-x1-3 col-md-6 mb-4">
			<div class="card border-0 shadow">
				<h4>${list.writer}</h4><br>
				<div class="card-body text-center">
					<h5 class="card-title mb-0">${list.content}</h5>
					<div class="card-text text-black-50"><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd" /><br>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>		
</header>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<jsp:include page="../footer.jsp" />