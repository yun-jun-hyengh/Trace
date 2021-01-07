<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:include page="../header.jsp" />
<br><br>
<form role="form" method="get">
<header class="masthead text-black text-center">
	<div class="container">
		<div class="row">
			<div class="col-lg-2">
			</div>
			<div class="col-lg-8">
				<div class="panel-body">
				<h2 class="page-header"><span style="color: #ff52a0;"></span>잡동사니
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
	             	<c:forEach var="bo" items="${list}">
	             	<tr>
	             		<td>${bo.boardnum}</td>
						<td>${bo.writer}</td>
						<td><a href="${cpath}/jabdam/jabdamread/${bo.boardnum}">${bo.title}</a></td>
						<td><fmt:formatDate value="${bo.registDate}" pattern="yyyy-MM-dd"/></td>
						<td>${bo.viewCount}</td>
	             	</tr>
	             	</c:forEach>
	             </table>
	             <div class="paging">
	             	<ul>
					<c:if test="${pageMaker.prev}">
						<a href="jabdamlist${pageMaker.makeSearch(pageMaker.startPage - 1)}">◀</a>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<strong><a href="jabdamlist${pageMaker.makeSearch(idx)}">${idx}</a></strong>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<a href="jabdamlist${pageMaker.makeSearch(pageMaker.endPage + 1)}">▶</a>
					</c:if>
					</ul>
				</div>
	            </div>
	         </div>
	     </div>
	 </div>
	 <div class="search">
	   <select class="form-control" name="searchType">                            	
	         <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
      		 <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
      		 <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
      		 <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
      		 <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
	   </select>
	   </div>
	    <input type="text" class="form-control" name="keyword" id="keywordInput" value="${scri.keyword}"/>
	    <br>
    	<button id="searchBtn" type="button" class="btn btn-primary">검색</button>&nbsp;&nbsp;
	 <span style="float: right;">
		<a href="${cpath}/jabdam/jabdamwrite" class="btn btn-primary">글쓰기</a>
	 </span>
</header>
</form>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	$(function(){
	    $('#searchBtn').click(function() {
	      self.location = "jabdamlist" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
	    });
	}); 
	$(function(){
		$("#count-per-page .btn-danger").click(function() {
			let count = $(this).val();
			location.href="${cpath}/board/Preelist?perPageNum=" + count;
		});
	});
</script>
<script type="text/javascript">
	const result = "${msg}";
	if(result == "regSuccess"){
		alert("게시글을 등록하였습니다");
	} else if(result == "delSuccess"){
		alert("게시물을 삭제하였습니다.");
	}
</script>
<br><br><br><br><br><br><br><br> 
<jsp:include page="../footer.jsp" />