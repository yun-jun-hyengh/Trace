<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:include page="../header.jsp" />
<header class="masthead text-black text-center">
	<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <h2 class="text-center">그룹 공지글 쓰기</h2>
        <form method="POST">
          <table class="table table-striped">
            <tr>
                <td>작성자</td>
                <td><input type="text" class="form-control" name="writer" value="${member.membername}" readonly="readonly"></td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text"  class="form-control" name="title"></td>
            </tr>
            <tr>
                <td>글내용</td>
                <td><textarea rows="10" cols="50" name="content" class="form-control"></textarea></td>
            </tr>
            <tr>
                <td colspan="2"  class="text-center">
                    <input type="submit" value="글쓰기" class="btn btn-success">
                    <input type="reset" value="다시작성" class="btn btn-warning">
                </td>
            </tr>
             
          </table>
        </form>
    </div>
</div>
</header>
<jsp:include page="../footer.jsp" />