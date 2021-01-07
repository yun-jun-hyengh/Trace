<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:include page="header.jsp" />
<style>
.page-active {
	background-color: #ff52a0;
}
</style>
<br><br>
<header class="masthead text-black text-center">
	<div class="container">
		<div class="row">
			<div class="col-lg-2">
			</div>
			<div class="col-lg-8">
				<div class="panel-body">
				<h2 class="page-header"><span style="color: #ff52a0;"></span>공지사항
					<span id="count-per-page" style="float: right;">
						 <c:choose>
						 	<c:when test="${member.memberid eq 'jhyoun72002'}">
						 		<a href="<c:url value='/writer'/>" class="btn btn-primary">글쓰기</a>
						 	</c:when>
						 </c:choose>
	                  
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
					<c:forEach var="bo" items="${list}">
					<tr style="color:#ff5xa0;">
						<td>${bo.num}</td>
								<td>${bo.writer }</td>

								<td><a style="margin-top: 0; height: 40px; color: orange;" href="${cpath}/read/${bo.num}">
										${bo.title }
									</a>
								</td>
								<td><fmt:formatDate value="${bo.registDate }" pattern="yyyy-MM-dd"/></td>
								<td>${bo.viewCount}</td>
					</tr>
					</c:forEach>
	         	</table>
	         	
	         	<!-- 페이징 처리 -->
	         	<div class="paging">
					<c:if test="${prev }">
						<a href="${cpath }/${begin - 1}">◀</a>
					</c:if>
					<c:forEach var="i" begin="${begin }" end="${end }">
					<c:if test="${i eq page }">
						<strong>[${i }]</strong>&nbsp;
					</c:if>
					<c:if test="${i ne page }">
						<a href="${cpath }/${i}">[${i }]</a>&nbsp;
					</c:if>
					</c:forEach>
					<c:if test="${next }">
						<a href="${cpath }/${end + 1}">▶</a>
					</c:if>
				</div>
	          </div>
	      </div>
	  </div>
	  </div>
	  <br><br>
	   <c:set var="titleFlag">${searchType == 'title'}</c:set>
	   <c:set var="writerFlag">${searchType == 'writer'}</c:set>
	   <c:set var="contentFlag">${searchType == 'content'}</c:set>
	   <form>
	   <select id="condition" class="form-control" name="searchType">                            	
	                 <option value="title" ${titleFlag ? 'selected' : ''}>제목</option>
	                 <option value="content" ${writerFlag ? 'selected' : ''}>내용</option>
	                 <option value="writer" ${contentFlag ? 'selected' : ''}>작성자</option>
	   </select>
	   <input type="text" class="form-control" name="searchWord" value="${searchWord}" id="keywordInput" placeholder="검색어">
	               <!-- <span class="input-group-btn"> -->
	               <br>
	               
	                       <input type="submit" value="검색" class="btn btn-primary">&nbsp;&nbsp; 
	                         
	                       <a href="${cpath}/initsearch">
	                       		<input type="button" value="초기화" class="btn btn-primary">
	                       </a> 
	              
	   </form>                                
  
</header>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" 
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" 
		crossorigin="anonymous">
</script>
<br><br><br><br><br><br><br><br>
<script type="text/javascript">
	$(function(){
		$("#count-per-page .btn-danger").click(function() {
			let count = $(this).val();
			location.href="${cpath}/list?perPage=" + count;
		});
	});
</script>
<jsp:include page="footer.jsp" />
