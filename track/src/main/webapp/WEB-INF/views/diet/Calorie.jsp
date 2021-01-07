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
  	
  	<h3 class="my-4">칼로리 처방 받기</h3>
  	<form action="${cpath}/diet/CalorieResult" method="GET">
  		<div class="row">
  			<table class="table">
  				<thead>
  					<tr>
  						<th scope="col">이름</th>
						<th scope="col"><input type="text" class="form-control" id="c_name" name="c_name" placeholder="이름"></th>
  						<th scope="col">성별</th>
  						<th scope="col"><input type="radio" id="c_gender" name="c_gender" value="남성">남성</th>
						<th scope="col"><input type="radio" id="c_gender" name="c_gender" value="여성">여성</th>			
  					</tr>
  				</thead>
  				<tbody>
  					<tr>
  						<th scope="row">키</th>
  						<td><input type="text" class="form-control" id="c_height" name="c_height" placeholder="키"></td>
  					</tr>
  					
  					<tr>
  						<th scope="row">몸무게</th>
  						<td><input type="text" class="form-control" id="c_weight" name="c_weight" placeholder="몸무게"></td>
  					</tr>
  					
  					<tr>
  						<th scope="row">목표체중</th>
  						<td><input type="text" class="form-control" id="GoalWeight" name="GoalWeight" placeholder="목표체중"></td>
  					</tr>
  					
  					<tr>
  						<th scope="row">나이</th>
  						<td><input type="text" class="form-control" id="c_age" name="c_age" placeholder="나이"></td>
  					</tr>
  					
  					<tr>
  						<th scope="row">체중감량기간</th>
  						<td><input type="text" class="form-control" id="Dday" name="Dday" placeholder="체중감량기간"></td>
  					</tr>
  					<tr>
  						<th scope="row">평소 활동량</th>
  						<td><input type="radio" id="exercise" name="exercise" value="1">활동안함<br>
  							<input type="radio" id="exercise" name="exercise" value="2">가벼운활동<br>
  							<input type="radio" id="exercise" name="exercise" value="3">보통활동<br>
  							<input type="radio" id="exercise" name="exercise" value="4">많은활동<br>
  							<input type="radio" id="exercise" name="exercise" value="5">격심한활동</td>		
  					</tr>
  				</tbody>
  			</table>
  			<input type="submit" value="확인" class="btn form-control"
			style="background-color: #DF01A5; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
  	</div>
  	</form>
</div>
</header>
<jsp:include page="../footer.jsp" />