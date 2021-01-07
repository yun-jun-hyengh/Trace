<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:include page="../header.jsp" />
<header class="masthead text-black text-center">
	<section class="s-content s-content--narrow container al_center">
		<div align="center" id="wrap">
			<h1 style="float: middle;">그룹 생성</h1>
			<hr>
			<div class="continer">
				<c:if test="${msg == null}">
					<form method="POST">
						<div class="form-group">
							<div align="left">
								<label>카테고리</label>
							</div>
							<div class="form-group">
								<div class="col-xs-4">
									<select id="grage" name="grage" class="form-control">
										<option value="">연령대</option>
										<option value="10대">10대</option>
										<option value="20대">20대</option>
										<option value="30대">30대</option>
										<option value="40대">40대</option>
										<option value="50대이상">50대이상</option>
									</select>
								</div>
								<br>

								<div class="col-xs-4">
									<select id="grlocal" name="grlocal" class="form-control">
										<option value="">지역별</option>
										<option value="서울">서울</option>
										<option value="경기도">경기도</option>
										<option value="인천">인천</option>
										<option value="강원도">강원도</option>
										<option value="충북">충북</option>
										<option value="충남">충남</option>
										<option value="전북">전북</option>
										<option value="전남">전남</option>
										<option value="경북">경북</option>
										<option value="경남">경남</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<div align="left">
									<label for="grname">그룹명</label>
								</div>
								<input type="text" class="form-control" id="grname"
									name="grname" placeholder="GROUP NAME">
							</div>

							<div class="form-group">
								<div align="left">
									<label>그룹 생성자</label> 
								</div>
								<input type="text" class="form-control"
									name='grwriter' value="${member.membername}" readonly="readonly">
							</div>


							<div class="form-group">
								<div align="left">
									<label for="nickname">해시태그</label>
								</div>
								<div contenteditable="true" class="hashTag form-control"
									id="hashTag"></div>
							</div>

							<div class="form-group">
								<input type="submit" class="btn btn-primary" value="생성">&nbsp;&nbsp;
								<a href="${cpath}/diet/GroupRoom" class="btn btn-primary">취소</a>
							</div>
						</div>
					</form>
				</c:if>
				<c:if test="${msg == false}">
					<p>로그인을 하셔야 됩니다!!</p>
					<p>
						<a href="${cpath}/login">로그인</a>
					</p>
				</c:if>
			</div>
		</div>
	</section>
</header>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	var saveSelection2, restoreSelection2, len;

	function doPaste2() {
		if (savedSelection2) {
			restoreSelection2(document.getElementById("hashTag"),
					savedSelection2);
		}
	}

	if (window.getSelection && document.createRange) {
		saveSelection2 = function(containerEl, len) {
			var range = window.getSelection().getRangeAt(0);
			var preSelectionRange = range.cloneRange();
			preSelectionRange.selectNodeContents(containerEl);
			preSelectionRange.setEnd(range.startContainer, range.startOffset);
			var start = preSelectionRange.toString().length + len;

			return {
				start : start,
				end : start + range.toString().length
			};
		};

		restoreSelection2 = function(containerEl, savedSel) {
			var charIndex = 0, range = document.createRange();
			range.setStart(containerEl, 0);
			range.collapse(true);
			var nodeStack = [ containerEl ], node, foundStart = false, stop = false;

			while (!stop && (node = nodeStack.pop())) {
				if (node.nodeType == 3) {
					var nextCharIndex = charIndex + node.length;
					if (!foundStart && savedSel.start >= charIndex
							&& savedSel.start <= nextCharIndex) {
						range.setStart(node, savedSel.start - charIndex);
						foundStart = true;
					}
					if (foundStart && savedSel.end >= charIndex
							&& savedSel.end <= nextCharIndex) {
						range.setEnd(node, savedSel.end - charIndex);
						stop = true;
					}
					charIndex = nextCharIndex;
				} else {
					var i = node.childNodes.length;
					while (i--) {
						nodeStack.push(node.childNodes[i]);
					}
				}
			}

			var sel = window.getSelection();
			sel.removeAllRanges();
			sel.addRange(range);
		}
	} else if (document.selection) {
		saveSelection2 = function(containerEl, len) {
			var selectedTextRange = document.selection.createRange();
			var preSelectionTextRange = document.body.createTextRange();
			preSelectionTextRange.moveToElementText(containerEl);
			preSelectionTextRange.setEndPoint("EndToStart", selectedTextRange);
			var start = preSelectionTextRange.text.length + len;

			return {
				start : start,
				end : start + selectedTextRange.text.length
			}
		};

		restoreSelection2 = function(containerEl, savedSel) {
			var textRange = document.body.createTextRange();
			textRange.moveToElementText(containerEl);
			textRange.collapse(true);
			textRange.moveEnd("character", savedSel.end);
			textRange.moveStart("character", savedSel.start);
			textRange.select();
		};
	}

	var savedSelection2;
	function doSave2(len) {
		savedSelection2 = saveSelection2(document.getElementById("hashTag"),
				len);
		/* console.log(savedSelection); */
	}

	$(function() {

		$("#test").click(function() {

			$("#my-textarea").html($("#b_content").html());
			$("#hashtagArea").html($("#b_content").html());
		});

		$(".hashTag")
				.keypress(
						function(event) {
							if (event.keyCode == '32') {
								console.log($(".hashTag").html());
								if (($('.hashTag').html()).match('#')) {
									console.log("#체크");
									var txt = ($(".hashTag").html());
									var orgtag = [];
									var tags = [];
									txt
											.replace(
													/#[^#\s,;]+/gm,
													function(tag) {
														orgtag.push(tag);
														tags
																.push('<span contenteditable="false"><a class="hashTag" href = "/">＃'
																		+ tag
																				.substr(1)
																		+ '</a></span>&nbsp&nbsp');
														console
																.log("orgtag....");
														console.log(orgtag);

														$
																.each(
																		orgtag,
																		function(
																				index,
																				item) {

																			console
																					.log(item);

																		});
														console.log("tags....");
														console.log(tags);
														doSave2(1);
														$
																.each(
																		tags,
																		function(
																				index,
																				item) {

																			console
																					.log(item);
																			var a = ($(".hashTag")
																					.html())
																					.replace(
																							""
																									+ orgtag[index]
																									+ "",
																							""
																									+ tags[index]
																									+ "")
																			$(
																					".hashTag")
																					.html(
																							a);
																			$(
																					"#subcategory")
																					.val(
																							$(
																									".hashTag")
																									.html());
																		});
														doPaste2();
													});
								}
							}
						});
	});
</script>
<jsp:include page="../footer.jsp" />