<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:include page="../header.jsp" />
<br>
<header class="masthead text-black text-center">
	<div class="container">
		<div class="row">
			<div class="col-lg-2">
			</div>
			<div class="col-lg-8">
				<div class="panel-body">
				<h2 class="page-header"><span style="color: #ff52a0;"></span>공유일기장
					<span id="count-per-page" style="float: right;">
	                     <input class="btn btn-danger" type="button" value="10">  
	                     <input class="btn btn-danger" type="button" value="20">   
	                     <input class="btn btn-danger" type="button" value="30">
	                </span>
	             </h2>
	             <table class="table table-hover">
	             	<thead>
	             	<tr style="background-color: #A901DB; color: white;  border: 0px solid #f78f24;">
	             		<th>번호</th>
						<th>작성자</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
	             	</tr>
	             	</thead>
	             	<c:forEach var="vo" items="${list}">
	             		<tr>
	             			<td>${vo.no}</td>
	             			<td>${vo.memberid}</td>
	             			<td><a href="${cpath}/diary/diaryread?no=${vo.no}&memberid=${vo.memberid}">${vo.title}</a></td>
	             			<td>${vo.regdate}</td>
	             			<td>${vo.readcnt}</td>
	             		</tr>
	             	</c:forEach>
	             </table>
	           </div>
	      </div>
	 </div>
</div>
</header>
<jsp:include page="../footer.jsp"/>