<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:include page="header.jsp" />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<header class="masthead text-black text-center">
	<div class="container">
		<h2 class="display-4">회원가입</h2>
	</div>
</header>
<div class="container">
	<form name="Papago" class="form-horizontal" method="post" id="delForm">
		<div class="form-group row">
			<label class="col-sm-2">아이디</label>
			<div class="col-sm-3">
				<input type="text" name="memberid" id="memberid" class="form-control">
			</div>
			<div class="col-sm-3">
				<button class="btn btn-primary" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">비밀번호</label>
			<div class="col-sm-3">
				<input id="memberpw" type="password" name="memberpw" class="form-control">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">비밀번호 재확인</label>
			<div class="col-sm-3">
				<input id="memberpw2" type="password" name="memberpw2" class="form-control">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">이름(별명)</label>
			<div class="col-sm-3">
				<input type="text" name="membername" class="form-control">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">성별</label>
			<div class="col-sm-3">
				<input type="radio" name="membergender" value="101">남성&nbsp;
				<span>
					<input type="radio" name="membergender" value="102">여성
				</span>
			</div>	
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">생년월일</label>
			<div class="col-sm-3">
				<select name="member_birth_y">
					     <c:forEach var="year" begin="1" end="100">
					       <c:choose>
					         <c:when test="${year==80}">
							   <option value="${ 1920+year}" selected>${ 1920+year} </option>
							</c:when>
							<c:otherwise>
							  <option value="${ 1920+year}" >${ 1920+year} </option>
							</c:otherwise>
							</c:choose>
					   	</c:forEach> 	
				</select>년 
				
				 <select name="member_birth_m" >
					   <c:forEach var="month" begin="1" end="12">
					       <c:choose>
					         <c:when test="${month==5 }">
							   <option value="${month }" selected>${month }</option>
							</c:when>
							<c:otherwise>
							  <option value="${month }">${month}</option>
							</c:otherwise>
							</c:choose>
					   	</c:forEach>
				</select>월  
				
				<select name="member_birth_d">
							<c:forEach var="day" begin="1" end="31">
					       <c:choose>
					         <c:when test="${day==10 }">
							   <option value="${day}" selected>${day}</option>
							</c:when>
							<c:otherwise>
							  <option value="${day}">${day}</option>
							</c:otherwise>
							</c:choose>
					   	</c:forEach>
				</select>일
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">휴대폰번호</label>
			<div class="col-sm-3">
				<select name="phone1">
					<option value="010">010</option>
	                <option value="010">011</option>
	                <option value="010">016</option>
	             	<option value="010">017</option>
	                <option value="010">019</option>
                </select> - <input type="text" maxlength="4" size="7" name="phone2"> - <input type="text" maxlength="4" size="7" name="phone3"><br>
                <input type="checkbox" name="sms" value="y" checked/> SNS 소식을 수신합니다.
                </span>
			</div>
		</div>
		<br>
		<div class="form-group row">
			<label class="col-sm-2">이메일</label>
			<div class="col-sm-3">
				<input type="text" name="email" class="form-control">
			</div>		
		</div>
		
		<tr class="dot_line">
			<td class="fixed_join">주소</td>
			<td>
				<input type="text" id="zipcode" name="zipcode" size="10" > <a href="javascript:execDaumPostcode()">우편번호검색</a>
			 	<br>
				<p> 
				지번 주소:<br><input type="text" id="roadAddress"  name="roadAddress" size="50"><br><br>
				도로명 주소: <input type="text" id="jibunAddress" name="jibunAddress" size="50"><br><br>
				나머지 주소: <input type="text"  name="namujiAddress" size="50" />
				</p>
			</td>
		</tr>
	<div class="form-group row">
		<div class="col-sm-offset2 col-sm-10">
			<input type="submit" class="btn btn-primary" value="회원가입">&nbsp;&nbsp;&nbsp;
			<input type="reset" class="btn btn-primary" value="가입취소">
		</div>
	</div>
	</form>
</div>
<br><br><br><br><br>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" 
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" 
		crossorigin="anonymous">
</script>   
<script type="text/javascript">
function execDaumPostcode() {
	  new daum.Postcode({
	    oncomplete: function(data) {
	      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	      // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	      var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	      var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	        extraRoadAddr += data.bname;
	      }
	      // 건물명이 있고, 공동주택일 경우 추가한다.
	      if(data.buildingName !== '' && data.apartment === 'Y'){
	        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	      }
	      // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	      if(extraRoadAddr !== ''){
	        extraRoadAddr = ' (' + extraRoadAddr + ')';
	      }
	      // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	      if(fullRoadAddr !== ''){
	        fullRoadAddr += extraRoadAddr;
	      }
	      // 우편번호와 주소 정보를 해당 필드에 넣는다.
	      document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
	      document.getElementById('roadAddress').value = fullRoadAddr;
	      document.getElementById('jibunAddress').value = data.jibunAddress;
	      // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	      if(data.autoRoadAddress) {
	        //예상되는 도로명 주소에 조합형 주소를 추가한다.
	        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	        document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	      } else if(data.autoJibunAddress) {
	          var expJibunAddr = data.autoJibunAddress;
	          document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	      } else {
	          document.getElementById('guide').innerHTML = '';
	      }
	      
	    }
	  }).open();
	}
	
	function fn_idChk(){ // 아이디 중복체크
		$.ajax({
			url : "${cpath}/idChk",
			type : "post",
			dataType : "json",
			data : {"memberid" : $("#memberid").val()},
			success : function(data){
				if(data == 1){
					alert("중복된 아이디입니다.");
				}else if(data == 0){
					$("#idChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			}
		})
	}
	
	const checkPassword = () => {
		// == 값이 일치하는가, === 자료형과 값이 일치하는가 
		// != 값이 다른가,  !== 값과 자료형을 포함하여 다른가 
		
		// document.getElementById 메서드는 주어진 문자열과 일치하는 id속성을 가진 요소를 찾아냄 
		const pw1 = document.getElementById('memberpw').value;
		const pw2 = document.getElementById('memberpw2').value;
		if(pw1 === '' || pw2 === '' || pw1 !== pw2){
			document.getElementById('memberpw').value = '';
			document.getElementById('memberpw2').value = '';
			document.getElementById('memberpw').style.border = '2px solid red';
			document.getElementById('memberpw2').style.border = '2px solid red';
			document.getElementById('memberpw').focus();
			alert('비밀번호가 일치하지 않습니다');
		}
		else {
			document.getElementById('memberpw').style.border = '2px solid blue';
			document.getElementById('memberpw2').style.border = '2px solid blue';
		}
	}
	document.getElementById('memberpw2').addEventListener('blur', checkPassword);
	
</script>
<jsp:include page="footer.jsp" />
