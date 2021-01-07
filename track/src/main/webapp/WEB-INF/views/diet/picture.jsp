<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<style>
	.bigPictureWrapper {
		position: absolute;
		display: none;
		justify-content: center;
		align-items: center;
		top: 30%;
		width: 100%;
		height: 100%;
		background-color: gray;
		z-index: 100;
		background: rgba(255, 255, 255, 0.5);
	}
	
	.bigPicture {
		position: relative;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.bigPicture img {
		width: 650px;
		height: 480px;
	}
</style>
<jsp:include page="../header.jsp" />
<header class="masthead text-black text-center">
<!-- 화면 크게보기  -->
<div class="bigPictureWrapper">
	<div class="bigPicture"></div>
</div>
	<div class="container">
		<h1 class="display-3">자극사진</h1>
	</div>
<div class="container">
	<div class="row">
		<!-- Team Member 1 -->
		<c:forEach var="list" items="${list}">
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-0 shadow">
					<img src="${cpath}/img/${list.image}" width="500px"
						height="250px" class="card-img-top" alt="...">
					
				</div>
			</div>
		</c:forEach>
	</div>
		<ul class="pagination justify-content-center">
			<c:if test="${pageMaker.prev}">
				<li class="page-item"><a class="page-link"
					href="picture${pageMaker.makeQuery(pageMaker.startPage - 1)}" style="background-color: #ff52a0; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<li class="page-item"><a href="picture${pageMaker.makeQuery(idx)}" class="page-link" style="margin-top: 0; height: 40px; color: red; border: 1px solid pink;">${idx}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li class="page-item"><a class="page-link"
					href="picture${pageMaker.makeQuery(pageMaker.endPage + 1)}" style="background-color: #ff52a0; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">다음</a></li>
			</c:if>
		</ul>
	</div>
	<c:choose>
		<c:when test="${member.memberid eq 'jhyoun72002'}">
			<form method="post" enctype="multipart/form-data">
				<label class="btn btn-default btn-file">사진선택
					<input type="file" name="imageFile">
				</label>
				<div class="box-footer">
					<div class="text-center">
						<input class="btn btn-primary" type="submit" value="OK">
						<input type="reset" class="btn btn-primary" value="NO">
					</div>
				</div>
			</form>
		</c:when>
	</c:choose>
</header>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(e) {

		$(document).on("click", "img", function() {
			var path = $(this).attr('src')
			showImage(path);
		});//end click event

		function showImage(fileCallPath) {

			$(".bigPictureWrapper").css("display", "flex").show();

			$(".bigPicture").html("<img src='"+fileCallPath+"' >").animate({
				width : '100%',
				height : '100%'
			}, 1000);

		}//end fileCallPath

		$(".bigPictureWrapper").on("click", function(e) {
			$(".bigPicture").animate({
				width : '0%',
				height : '0%'
			}, 1000);
			setTimeout(function() {
				$('.bigPictureWrapper').hide();
			}, 1000);
		});//end bigWrapperClick event
	});
</script>
<jsp:include page="../footer.jsp" />