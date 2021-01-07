<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:include page="header.jsp" />
<header class="masthead text-black text-center">
	<div class="container">
		<h2 class="display-4">상세정보</h2>
	</div>
</header>
<div class="container">
	<div class="form-group row">
		<label class="col-sm-2">아이디</label>
		<div class="col-sm-3">
			<input type="text" name='memberid' class="form-control" value="${member.memberid}" readonly>
		</div>
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2">이름</label>
		<div class="col-sm-3">
			<input type="text" name="membername" class="form-control" value="${member.membername}" readonly>
		</div>
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2">이메일</label>
		<div class="col-sm-3">
			<input type="text" name="email" class="form-control" value="${member.email}" readonly>
		</div>		
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2">태어난 년도</label>
		<div class="col-sm-3">
			<input type="text" name="member_birth_y" class="form-control" value="${member.member_birth_y}" readonly>
		</div>			
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2">태어난 월</label>
		<div class="col-sm-3">
			<input type="text" name="member_birth_m" class="form-control" value="${member.member_birth_m}" readonly>
		</div>		
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2">태어난 일</label>
		<div class="col-sm-3">
			<input type="text" name="member_birth_d" class="form-control" value="${member.member_birth_d}" readonly>
		</div>		
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2">휴대폰 번호 앞자리</label>
		<div class="col-sm-3">
			<input type="text" name="phone1" class="form-control" value="${member.phone1}" readonly>
		</div>		
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2">휴대폰 번호 중간자리</label>
		<div class="col-sm-3">
			<input type="text" name="phone2" class="form-control" value="${member.phone2}" readonly>
		</div>		
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2">휴대폰 번호 뒷자리</label>
		<div class="col-sm-3">
			<input type="text" name="phone3" class="form-control" value="${member.phone3}" readonly>
		</div>		
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2">지번주소</label>
		<div class="col-sm-3">
			<input type="text" name="roadAddress" class="form-control" value="${member.roadAddress}" readonly>
		</div>		
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2">도로명주소</label>
		<div class="col-sm-3">
			<input type="text" name="jibunAddress" class="form-control" value="${member.jibunAddress}" readonly>
		</div>		
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2">나머지주소</label>
		<div class="col-sm-3">
			<input type="text" name="namujiAddress" class="form-control" value="${member.namujiAddress}" readonly>
		</div>		
	</div>
</div>
<br><br>
<jsp:include page="footer.jsp" />