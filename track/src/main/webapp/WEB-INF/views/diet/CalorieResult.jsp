<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:include page="../header.jsp" />
<header class="masthead text-black text-center">
<div class="container">
		<h1 class="my-4">다이어트
		    <br><small>거울봐라 먹고싶니^^~~ㅋㅋㅋㅋ</small>
		</h1>
	  	<div class="row">

	    <div class="col-md-8">
	      <img class="img-fluid" src="${cpath}/assets/img/portfolio/dietCal.jpg" alt="">
	    </div>

	    <div class="col-md-4">
	      <h3 class="my-3"><marquee bgcolor=yellow>최고의 성형은 다이어트다!!</marquee></h3>
	      <p>현재 우리는 비만이 단순히 살이 찌고 빠지는 수준을 넘어서 각종 성인병이 되어서 인간에게 고통은 물론 생사와 직결이 되고 있는 시대에 살고 있다. 세계보건기구는(WHO) 비만이 각종 성인병을 유발하는 가장 큰 요인으로 보고있다. 비만은 사람을 못생겨지게 할 뿐만 아니라 우리의 목숨까지 위협하고 있다. 수많은 사람들이 다이어트를 하지만 빈번히 실패한다. 그러한 실패를 막기 위해 살을 못빼는 사람들을 위해 조금이라도 이 사이트가 도움이 되었으면 한다. </p>
	      <h3 class="my-3">MENU</h3>
	      <ul>
	        <li><a href="${cpath}/diet/BMI">BMI 지수 확인</a></li>
	        <li><a href="${cpath}/diet/Calorie">칼로리 처방</a></li>
	        <li><a href="${cpath}/diet/picture">자극사진</a></li>
	        <li><a href="${cpath}/diet/GroupRoom">그룹방</a></li>
	      </ul>
	    </div>
  	</div>
  	
  	<h3 class="my-4">칼로리 처방 결과</h3>
  	<div class="row">
  		<table class="table table-bordered">
				<tr>
					<th>이름</th>
					<th>${vo.c_name}</th>
				</tr>
				<tr>
					<th>현재체중</th>
					<th>${vo.c_weight}</th>
				</tr>
				<tr>
					<th>표준체중</th>
					<th>${vo.result4} 입니다.</th>
				</tr>
				<tr>
					<th>기초대사량</th>
					<th>${vo.result1}</th>
				</tr>
				<tr>
					<th>활동대사량</th>
					<th>${vo.result2}</th>
				</tr>
				<tr>
					<th>하루필요에너지</th>
					<th>${vo.result3}</th>
				</tr>
				<tr>
					<th>하루권장칼로리</th>
					<th>${vo.result5}</th>
				</tr>
		</table>
		<a class="btn form-control" style="background-color: #DF01A5" href="${cpath}/diet/Calorie">목록</a>&nbsp;&nbsp;
  	</div>
</div>
</header>
<jsp:include page="../footer.jsp" />