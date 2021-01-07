<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:include page="header.jsp" />
<header class="masthead text-black text-center">
	<div class="container">
		<h1 class="my-4">다이어트
		    <br><small>거울봐라 먹고싶니^^~~ㅋㅋㅋㅋ</small>
		</h1>
	  	<div class="row">

	    <div class="col-md-8">
	      <img class="img-fluid" src="assets/img/portfolio/running.jpg" alt=""><br><br>
	      <div class="notice mb10 text-align">
	      	<table class="table table-bordered">
	      		<thead>
	      			<tr>
	      				<th class="text-center table-success">다이어트자극명언</th>
	      			</tr>
	      		</thead>
	      		<tbody>
	      			<tr>
	      				<th scope="row">1. 여우처럼 보이려면 돼지처럼 땀 흘려라.</th>
	      			</tr>
	      			<tr>
	      				<th scope="row">2. 원하는 몸을 만들기 위해 지금의 몸을 부수자</th>
	      			</tr>
	      			<tr>
	      				<th scope="row">3. 계속 노력해라 지름길은 없다.</th>
	      			</tr>
	      			<tr>
	      				<th scope="row">4. 내 인생에 가장 아름다웠다고 생각한 순간이 있어야 한다.</th>
	      			</tr>
	      			<tr>
	      				<th scope="row">5. 내 자신에게 엄격해져라.</th>
	      			</tr>
	      			<tr>
	      				<th scope="row">6. 나를 배부르게 하는 것들이 나를 파괴한다.</th>
	      			</tr>
	      			<tr>
	      				<th scope="row">7. 기억해라 당신이 왜 다이어트를 시작했는지.</th>
	      			</tr>
	      			<tr>
	      				<th scope="row">8. 인생의 가장 아름다운 순간은 돌아오지 않는다.</th>
	      			</tr>
	      			<tr>
	      				<th scope="row">9. 음식이 아깝다 생각말고 네 몸이 아깝다 생각해라.</th>
	      			</tr>
	      			<tr>
	      				<th scope="row">10. 먹을거 다먹고 운동하면 그건 그냥 건강한 돼지~~</th>
	      			</tr>
	      		</tbody>
	      	</table>
	      </div>
	    </div>

	    <div class="col-md-4">
	      <h3 class="my-3"><marquee bgcolor=yellow>최고의 성형은 다이어트다!!</marquee></h3>
	      <p>현재 우리는 비만이 단순히 살이 찌고 빠지는 수준을 넘어서 각종 성인병이 되어서 인간에게 고통은 물론 생사와 직결이 되고 있는 시대에 살고 있다. 세계보건기구는(WHO) 비만이 각종 성인병을 유발하는 가장 큰 요인으로 보고있다. 비만은 사람을 못생겨지게 할 뿐만 아니라 우리의 목숨까지 위협하고 있다. 수많은 사람들이 다이어트를 하지만 빈번히 실패한다. 그러한 실패를 막기 위해 살을 못빼는 사람들을 위해 조금이라도 이 사이트가 도움이 되었으면 한다.</p>
	      <h3 class="my-3">MENU</h3>
	      <ul>
	        <li><a href="${cpath}/diet/BMI">BMI 지수 확인</a></li>
	        <li><a href="${cpath}/diet/Calorie">칼로리 처방</a></li>
	        <li><a href="${cpath}/diet/picture">자극사진</a></li>
	        <li><a href="${cpath}/diet/GroupRoom">그룹방</a></li>
	      </ul>
	      
	    </div>
  	</div>
</div>
<h3 class="my-4">다이어트 효과 UP 자극 UP 동영상</h3>

<div class="container">
	<div class="col-xl-3 col-md-6 mb-4">
		<iframe width="1000" height="600" src="https://www.youtube.com/embed/eg_DipJ7UVk" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" poster="https://www.youtube.com/embed/eg_DipJ7UVk" allowfullscreen></iframe>
	</div>
	<div class="col-xl-3 col-md-6 mb-4">
		<iframe width="1000" height="600" src="https://www.youtube.com/embed/MIB5tKaLTxo" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
	<div class="col-xl-3 col-md-6 mb-4">
		<iframe width="1000" height="600" src="https://www.youtube.com/embed/Ipdba2K8i94" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
	<div class="col-xl-3 col-md-6 mb-4">
		<iframe width="1000" height="600" src="https://www.youtube.com/embed/A5CCe1-Q0t4" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
</div>

</header>
<jsp:include page="footer.jsp" />