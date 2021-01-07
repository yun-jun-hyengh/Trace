<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:include page="../header.jsp" />
<header class="masthead text-black text-center">
<div class="container">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-header text-white" style="background-color:#01DFD7;">${read.boardnum}</div>
				<div class="card-body">
					 <div class="form-group">
            			<label>작성자</label>
            				<input type="text" class="form-control" name='writer' value="${read.writer}" readonly>
          			 </div>
          			 
          			 <div class="form-group">
            			<label>제목</label>
            				<input type="text" class="form-control" name='title' value="${read.title}" readonly>
                	 </div>
                	 
                	 <div class="form-group">
                	 	<lable>내용</lable>
                	 	<textarea class="form-control" rows="5" name='content' readonly>${read.content}</textarea>
                	 </div>
                	 
                	 <div class="form-group">
                	 	<c:if test="${not empty read.img}">
                	 	<a href="${cpath}/img/${read.img}" target="_blank">
                	 		<img src="${cpath}/img/${read.img}" height="300px">
                	 	</a>
                	 	</c:if>
                	 </div>
                </div>
        	</div>
			<div id="reply" class="card">
				<strong>댓글</strong><br>
				<c:forEach items="${replyList1}" var="replyList1">
					<p>
						작성자 : ${replyList1.writer}&nbsp;
						<button id="deleteReply-${replyList1.replyNum}"
							class="btn deleteReply">삭제</button>
						<br> 작성 날짜 :
						<fmt:formatDate value="${replyList1.registDate}"
							pattern="yyyy-MM-dd" />
						<br> 내용 : ${replyList1.context}
					</p>
				</c:forEach>
			</div>
		</div>
    </div>
<br><br><br>
<a class="btn" style="background-color: #0080FF" href="${cpath}/jabdam/jabdamlist">목록</a>&nbsp;&nbsp;
<c:if test="${member.membername == read.writer}">
	<a class="btn" style="background-color: #00BFFF" href="${cpath}/jabdam/delete?boardnum=${boardnum}">삭제</a>&nbsp;&nbsp;
	<a class="btn" style="background-color: #5F04B4" href="${cpath}/jabdam/jabdamUpdate?boardnum=${boardnum}">수정</a>
</c:if>
<br><br>
	<form role="form" method="post">
		<input type="text" class="form-control" name="writer" placeholder="이름" value="${member.membername}" readonly="readonly"><br>
		<textarea class="form-control" rows="5" name='context'
			placeholder="댓글을 입력하세요"></textarea>
		<br>
		<c:if test="${member != null}">
		<br> <span style="float: right;"> <input class="btn"
			type="submit" value="댓글작성" class="btn form-control"
			style="background-color: #0404B4; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
		</span>
		</c:if>
	</form>
</header>
<script type="text/javascript">
	// 클래스 이름이 deleteReply인 모든 HTML요소를 가져온다
	const deleteReplyBtns = document.querySelectorAll('.deleteReply');
	
	deleteReplyBtns.forEach( (element) => {	// 모든 댓글 삭제버튼에 대해서
		element.onclick = (event) => {	// 버튼을 클릭하면 실행할 이벤트 함수를 부여한다
			const replyNum = event.target.id.split('-')[1];	// 클릭한 버튼의 댓글번호를 가져와서
			const answer = confirm('댓글을 삭제하시겠습니까?');	// 물어보고
			if(answer === true) {	// 확인을 받으면
				location.href = '${cpath}/jabdam/deleteReply/' + replyNum;	// 해당 주소로 이동
				// 해당 주소는 컨트롤러로 연결되어서 삭제 쿼리를 수행하고 현재 읽기 페이지로 리다이렉트
				// 이전 읽기 페이지를 확인하려면
				// @RequestHeader("referer") 를 확인하기
			}
		}
	});

</script>
<jsp:include page="../footer.jsp" />