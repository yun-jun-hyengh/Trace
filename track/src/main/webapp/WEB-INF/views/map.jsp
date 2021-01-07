<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<div id="map" style="width:100%;height:950px;"></div>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5e2075e255e60709ec446363cda6236e"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(35.15714966699255, 129.05845142746833), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
	{
	    content: '<div>광명환경</div><br>054-742-1841', 
	    latlng: new kakao.maps.LatLng(35.876993, 129.226438)
	},
	{
	    content: '<div>세진방역환경공사</div><br>054-776-3380', 
	    latlng: new kakao.maps.LatLng(35.870778, 129.223997)
	},
	{
	    content: '<div>청소반장</div><br>054-745-8525', 
	    latlng: new kakao.maps.LatLng(35.869723, 129.218197)
	},
	{
	    content: '<div>홍일실업청소용역</div><br>054-749-6100',
	    latlng: new kakao.maps.LatLng(35.869678, 129.205462)
	},
	{
	    content: '<div>경일환경방역공사</div><br>054-773-5199',
	    latlng: new kakao.maps.LatLng(35.866803, 129.221217)
	},
	{
	    content: '<div>삼일환경공사</div><br>054-775-3344',
	    latlng: new kakao.maps.LatLng(35.865976, 129.220510)
	},
	{
	    content: '<div>상록수환경</div><br>054-749-9994',
	    latlng: new kakao.maps.LatLng(35.861453, 129.224078)
	},
	{
	    content: '<div>닥터크리너</div><br>054-776-3400',
	    latlng: new kakao.maps.LatLng(35.857270, 129.218758)
	},
	{
	    content: '<div>선인크린텍</div><br>054-777-1800',
	    latlng: new kakao.maps.LatLng(35.857284, 129.218831)
	},
	{
	    content: '<div>훼미리청소</div><br>054-749-1118',
	    latlng: new kakao.maps.LatLng(35.850376, 129.203389)
	},
	{
	    content: '<div>탑크린</div><br>054-705-4856',
	    latlng: new kakao.maps.LatLng(35.851104, 129.212787)
	},
	{
	    content: '<div>세계산업</div><br>054-748-1188',
	    latlng: new kakao.maps.LatLng(35.848369, 129.214188)
	},
	{
	    content: '<div>경성인력</div><br>054-777-6998',
	    latlng: new kakao.maps.LatLng(35.846933, 129.215979)
	},
	{
	    content: '<div>청소반장</div><br>054-705-1369',
	    latlng: new kakao.maps.LatLng(35.845754, 129.211969)
	},
	{
	    content: '<div>중앙방역</div><br>054-745-5600',
	    latlng: new kakao.maps.LatLng(35.843785, 129.207515)
	},
	{
	    content: '<div>성인크린텍</div><br>054-775-3401',
	    latlng: new kakao.maps.LatLng(35.839510, 129.207376)
	},
	{
	    content: '<div>유품청소소독정리</div><br>054-749-8045',
	    latlng: new kakao.maps.LatLng(35.842648, 129.227941)
	},
	{
	    content: '<div>청소의달인</div><br>054-776-5888',
	    latlng: new kakao.maps.LatLng(35.846899, 129.244801)
	},
	{
	    content: '<div>하나방역</div><br>054-624-9020',
	    latlng: new kakao.maps.LatLng(35.851165, 129.210171)
	},
	{
	    content: '<div>보원산업</div><br>054-772-5258',
	    latlng: new kakao.maps.LatLng(35.854748, 129.222662)
	},
	{
	    content: '<div>밀레니엄환경기업</div><br>054-333-7589',
	    latlng: new kakao.maps.LatLng(35.981204, 128.944483)
	},
	{
	    content: '<div>크린웰</div><br>054-338-0682',
	    latlng: new kakao.maps.LatLng(35.975996, 128.947186)
	},
	{
	    content: '<div>청수환경용역</div><br>054-336-9718',
	    latlng: new kakao.maps.LatLng(35.971527, 128.948417)
	},
	{
	    content: '<div>신나는빗자루</div><br>054-334-2258',
	    latlng: new kakao.maps.LatLng(35.969341, 128.931731)
	},
	{
	    content: '<div>청수환경용역</div><br>054-333-3235',
	    latlng: new kakao.maps.LatLng(35.964849, 128.939697)
	},
	{
	    content: '<div>대양산업</div><br>054-334-2136',
	    latlng: new kakao.maps.LatLng(35.963699, 128.922763)
	},
	{
	    content: '<div>밀레니엄환경기업</div><br>054-733-1262',
	    latlng: new kakao.maps.LatLng(36.412294, 129.382450)
	},
	{
	    content: '<div>아름다운청소뷰티클린</div><br>054-734-5904',
	    latlng: new kakao.maps.LatLng(36.409206, 129.368207)
	},
	{
	    content: '<div>두드림</div><br>054-734-7200',
	    latlng: new kakao.maps.LatLng(36.412152, 129.367686)
	},
	{
	    content: '<div>청소아지매청아종합용역</div><br>054-682-7482',
	    latlng: new kakao.maps.LatLng(36.645209, 129.171901)
	},
	{
	    content: '<div>청암환경</div><br>054-872-9494',
	    latlng: new kakao.maps.LatLng(36.438373, 129.051617)
	},
	{
		content: '<div>아름다운청소뷰티클린</div><br>054-781-0401',
		latlng: new kakao.maps.LatLng(36.997812, 129.401814)
	},
	{
		content: '<div>밀레니엄기업</div><br>054-781-7707',
		latlng: new kakao.maps.LatLng(36.990810, 129.397844)
	},
	{
		content: '<div>동양메인티넌스</div><br>054-783-2974',
		latlng: new kakao.maps.LatLng(36.989858, 129.399628)
	},
	{
		content: '<div>삼정실업</div><br>054-783-9338',
		latlng: new kakao.maps.LatLng(37.002581, 129.400982)
	},
	{
		content: '<div>서울용역</div><br>054-788-0405',
		latlng: new kakao.maps.LatLng(36.677065, 129.442485)
	},
	{
		content: '<div>청소하는날</div><br>033-554-1563',
		latlng: new kakao.maps.LatLng(37.159413, 128.988897)
	},
	{
		content: '<div>고려청소용역</div><br>033-552-5677',
		latlng: new kakao.maps.LatLng(37.170761, 128.991591)
	},
	{
		content: '<div>클린태백방역</div><br>033-554-0105',
		latlng: new kakao.maps.LatLng(37.174830, 128.991132)
	},
	{
		content: '<div>태백발전시민(주)</div><br>033-553-1150',
		latlng: new kakao.maps.LatLng(37.142006, 128.978664)
	},
	{
		content: '<div>영동환경</div><br>033-553-5015',
		latlng: new kakao.maps.LatLng(37.180461, 128.981006)
	},
	{
		content: '<div>그린소독방역업체</div><br>033-582-1147',
		latlng: new kakao.maps.LatLng(37.111842, 129.036272)
	},
	{
		content: '<div>핸디페어 상장동점</div><br>033-554-1739',
		latlng: new kakao.maps.LatLng(37.160991, 128.983001)
	},
	{
		content: '<div>연하산업</div><br>033-552-0774',
		latlng: new kakao.maps.LatLng(37.176107, 128.988479)
	},
	{
		content: '<div>먼지먹는하마</div><br>033-554-4944',
		latlng: new kakao.maps.LatLng(37.153369, 128.990621)
	},
	{
		content: '<div>모든청소</div><br>054-251-2422',
		latlng: new kakao.maps.LatLng(36.067340, 129.370279)
	},
	{
		content: '<div>포항시니어클럽클린토</div><br>054-249-9777',
		latlng: new kakao.maps.LatLng(36.051325, 129.363421)
	},
	{
		content: '<div>탑크린</div><br>054-611-4855',
		latlng: new kakao.maps.LatLng(36.042596, 129.364668)
	},
	{
		content: '<div>썬환경</div><br>054-277-1237',
		latlng: new kakao.maps.LatLng(36.041844, 129.365654)
	},
	{
		content: '<div>삼보실업</div><br>054-277-5536',
		latlng: new kakao.maps.LatLng(36.028965, 129.370385)
	},
	{
		content: '<div>진드기청소박사</div><br>054-275-3819',
		latlng: new kakao.maps.LatLng(36.034183, 129.341216)
	},
	{
		content: '<div>청소반장</div><br>054-243-8885',
		latlng: new kakao.maps.LatLng(36.026812, 129.334383)
	},
	{
		content: '<div>포항원룸메니지먼트</div><br>054-272-8272',
		latlng: new kakao.maps.LatLng(36.023464, 129.350935)
	},
	{
		content: '<div>포항양심청소 미하테크</div><br>054-286-0702',
		latlng: new kakao.maps.LatLng(36.026060, 129.355660)
	},
	{
		content: '<div>청소일번지</div><br>054-244-1210',
		latlng: new kakao.maps.LatLng(36.021677, 129.362995)
	},
	{
		content: '<div>새아름환경</div><br>054-277-8672',
		latlng: new kakao.maps.LatLng(36.015699, 129.366022)
	},
	{
		content: '<div>장성위생용역</div><br>054-274-5684',
		latlng: new kakao.maps.LatLng(36.014254, 129.361382)
	},
	{
		content: '<div>청소나라</div><br>054-241-0747',
		latlng: new kakao.maps.LatLng(36.017027, 129.357124)
	},
	{
		content: '<div>좋은만남청소용역</div><br>054-278-2459',
		latlng: new kakao.maps.LatLng(36.011048, 129.349984)
	},
	{
		content: '<div>포항용역</div><br>054-274-0149',
		latlng: new kakao.maps.LatLng(36.009851, 129.357556)
	},
	{
		content: '<div>모든청소</div><br>054-285-9904',
		latlng: new kakao.maps.LatLng(35.999750, 129.345034)
	},
	{
		content: '<div>청소의달인</div><br>054-285-5999',
		latlng: new kakao.maps.LatLng(35.999290, 129.344829)
	},
	{
		content: '<div>그린청소</div><br>054-285-6090',
		latlng: new kakao.maps.LatLng(35.991047, 129.349912)
	},
	{
		content: '<div>대한하수구</div><br>054-281-8473',
		latlng: new kakao.maps.LatLng(35.987487, 129.398517)
	},
	{
		content: '<div>핸디페어 삼척교동점</div><br>033-575-0770',
		latlng: new kakao.maps.LatLng(37.447250, 129.175845)
	},
	{
		content: '<div>대광청소용역</div><br>033-574-0708',
		latlng: new kakao.maps.LatLng(37.445557, 129.170637)
	},
	{
		content: '<div>고려청소용역</div><br>033-572-6544',
		latlng: new kakao.maps.LatLng(37.434572, 129.164543)
	},
	{
		content: '<div>한성용역</div><br>033-572-9168',
		latlng: new kakao.maps.LatLng(37.434568, 129.164544)
	},
	{
		content: '<div>해맑은환경</div><br>033-572-5956',
		latlng: new kakao.maps.LatLng(37.441758, 129.162245)
	},
	{
		content: '<div>제일환경</div><br>033-572-3399',
		latlng: new kakao.maps.LatLng(37.442623, 129.165486)
	},
	{
		content: '<div>의림실업</div><br>033-572-9433',
		latlng: new kakao.maps.LatLng(37.440775, 129.167293)
	},
	{
		content: '<div>먼지먹는하마</div><br>033-572-7719',
		latlng: new kakao.maps.LatLng(37.440311, 129.183387)
	},
	{
		content: '<div>하이진</div><br>033-575-0282',
		latlng: new kakao.maps.LatLng(37.465403, 129.162641)
	},
	{
		content: '<div>(유한)경신</div><br>033-575-5100',
		latlng: new kakao.maps.LatLng(37.433725, 129.182892)
	},
	{
		content: '<div>동해청소나라</div><br>033-931-1359',
		latlng: new kakao.maps.LatLng(37.489039, 129.100449)
	},
	{
		content: '<div>고려청소용역</div><br>033-525-6942',
		latlng: new kakao.maps.LatLng(37.522842, 129.116066)
	},
	{
		content: '<div>고려청소용역</div><br>033-535-5474',
		latlng: new kakao.maps.LatLng(37.528878, 129.120184)
	},
	{
		content: '<div>종합청소대행</div><br>033-532-9838',
		latlng: new kakao.maps.LatLng(37.537322, 129.108975)
	},
	{
		content: '<div>해맑은청소</div><br>033-522-4514',
		latlng: new kakao.maps.LatLng(37.492673, 129.108817)
	},
	{
		content: '<div>한성용역</div><br>033-535-4006',
		latlng: new kakao.maps.LatLng(37.520491, 129.091343)
	},
	{
		content: '<div>영성개발</div><br>033-522-2927',
		latlng: new kakao.maps.LatLng(37.481478, 129.115426)
	},
	{
		content: '<div>한성용역</div><br>033-521-3363',
		latlng: new kakao.maps.LatLng(37.487127, 129.108815)
	},
	{
		content: '<div>깔끔환경</div><br>033-522-6117',
		latlng: new kakao.maps.LatLng(37.481664, 129.121850)
	},
	{
		content: '<div>세세실업</div><br>033-533-3136',
		latlng: new kakao.maps.LatLng(37.522359, 129.114660)
	},
	{
		content: '<div>핸디페어</div><br>033-521-5864',
		latlng: new kakao.maps.LatLng(37.488856, 129.107680)
	},
	{
		content: '<div>(유한)늘푸른환경</div><br>033-522-6990',
		latlng: new kakao.maps.LatLng(37.494908, 129.104287)
	},
	{
		content: '<div>가나크린</div><br>033-535-0222',
		latlng: new kakao.maps.LatLng(37.491910, 129.100701)
	},
	{
		content: '<div>(주)정방</div><br>033-522-4590',
		latlng: new kakao.maps.LatLng(37.496063, 129.124511)
	},
	{
		content: '<div>(주)유레이바이오랜드</div><br>033-522-0762',
		latlng: new kakao.maps.LatLng(37.496063, 129.124511)
	},
	{
		content: '<div>세화산업</div><br>033-532-4989',
		latlng: new kakao.maps.LatLng(37.522046, 129.114762)
	},
	{
		content: '<div>해오름환경</div><br>033-533-0651',
		latlng: new kakao.maps.LatLng(37.518569, 129.110867)
	},
	{
		content: '<div>강릉청소용역</div><br>033-652-1964',
		latlng: new kakao.maps.LatLng(37.770088, 128.921450)
	},
	{
		content: '<div>강릉물청소용역</div><br>033-645-8820',
		latlng: new kakao.maps.LatLng(37.730327, 128.920766)
	},
	{
		content: '<div>한성청소대행</div><br>033-646-1412',
		latlng: new kakao.maps.LatLng(37.767620, 128.894068)
	},
	{
		content: '<div>청소나라</div><br>033-641-1359',
		latlng: new kakao.maps.LatLng(37.763077, 128.880336)
	},
	{
		content: '<div>청소나라</div><br>033-641-6116',
		latlng: new kakao.maps.LatLng(37.749626, 128.891297)
	},
	{
		content: '<div>깔끔이청소나라친환경센터</div><br>033-642-6129',
		latlng: new kakao.maps.LatLng(37.775079, 128.887663)
	},
	{
		content: '<div>늘푸른청소</div><br>033-651-1357',
		latlng: new kakao.maps.LatLng(37.768212, 128.916847)
	},
	{
		content: '<div>청소하는사람들</div><br>033-646-5863',
		latlng: new kakao.maps.LatLng(37.756945, 128.911975)
	},
	{
		content: '<div>깔끔환경</div><br>033-648-4112',
		latlng: new kakao.maps.LatLng(37.762971, 128.907407)
	},
	{
		content: '<div>청소오케이</div><br>033-645-1914',
		latlng: new kakao.maps.LatLng(37.788868, 128.866832)
	},
	{
		content: '<div>삼화청소용역</div><br>033-643-2400',
		latlng: new kakao.maps.LatLng(37.758335, 128.894807)
	},
	{
		content: '<div>고려청소용역</div><br>033-646-5090',
		latlng: new kakao.maps.LatLng(37.749631, 128.891297)
	},
	{
		content: '<div>천사크린</div><br>033-643-5100',
		latlng: new kakao.maps.LatLng(37.747960, 128.892811)
	},
	{
		content: '<div>뽀드득청소용역</div><br>033-646-3328',
		latlng: new kakao.maps.LatLng(37.763272, 128.888136)
	},
	{
		content: '<div>청소명장</div><br>033-673-4009',
		latlng: new kakao.maps.LatLng(38.142089, 128.571410)
	},
	{
		content: '<div>경원산업(합자)</div><br>033-672-3987',
		latlng: new kakao.maps.LatLng(38.079208, 128.627162)
	},
	{
		content: '<div>삼성용역</div><br>033-672-6044',
		latlng: new kakao.maps.LatLng(38.097049, 128.627315)
	},
	{
		content: '<div>청소명장</div><br>033-638-0009',
		latlng: new kakao.maps.LatLng(38.204476, 128.581085)
	},
	{
		content: '<div>늘푸른환경</div><br>033-633-0113',
		latlng: new kakao.maps.LatLng(38.217024, 128.592915)
	},
	{
		content: '<div>청소나라</div><br>033-637-3016',
		latlng: new kakao.maps.LatLng(38.194714, 128.576762)
	},
	{
		content: '<div>정화조청소속초시대행업체협회</div><br>033-632-4114',
		latlng: new kakao.maps.LatLng(38.183883, 128.600298)
	},
	{
		content: '<div>청소명장</div><br>033-638-0009',
		latlng: new kakao.maps.LatLng(38.204474, 128.581084)
	},
	{
		content: '<div>고려청소용역</div><br>033-636-5009',
		latlng: new kakao.maps.LatLng(38.192355, 128.568800)
	},
	{
		content: '<div>가나크린</div><br>033-636-1233',
		latlng: new kakao.maps.LatLng(38.191601, 128.564350)
	},
	{
		content: '<div>설악용역(합명)</div><br>033-635-4545',
		latlng: new kakao.maps.LatLng(38.188083, 128.600787)
	},
	{
		content: '<div>깨끗한세상</div><br>033-633-8131',
		latlng: new kakao.maps.LatLng(38.204103, 128.580987)
	},
	{
		content: '<div>서울용역</div><br>033-631-4373',
		latlng: new kakao.maps.LatLng(38.199995, 128.581584)
	},
	{
		content: '<div>엔비닥터</div><br>033-637-7985',
		latlng: new kakao.maps.LatLng(38.216522, 128.593945)
	},
	{
		content: '<div>먼지먹는하마</div><br>033-636-6212',
		latlng: new kakao.maps.LatLng(38.189340, 128.564364)
	},
	{
		content: '<div>운화퓨러파잉테코놀로지</div><br>033-682-2231',
		latlng: new kakao.maps.LatLng(38.379253, 128.467227)
	},
	{
		content: '<div>금강산업(합명)</div><br>033-681-5315',
		latlng: new kakao.maps.LatLng(38.510517, 128.418555)
	},
	{
		content: '<div>늘푸른환경</div><br>033-681-4712',
		latlng: new kakao.maps.LatLng(38.377161, 128.465522)
	},
	{
		content: '<div>대전청소</div><br>042-528-7339',
		latlng: new kakao.maps.LatLng(36.349944, 127.365970)
	},
	{
		content: '<div>대전청소환경</div><br>042-286-4119',
		latlng: new kakao.maps.LatLng(36.324455, 127.382097)
	},
	{
		content: '<div>맑은청소</div><br>042-633-9644',
		latlng: new kakao.maps.LatLng(36.341722, 127.442522)
	},
	{
		content: '<div>대전청소</div><br>042-2222-7474',
		latlng: new kakao.maps.LatLng(36.367205, 127.431295)
	},
	{
		content: '<div>대전깔끔이홈케어</div><br>010-2227-2079',
		latlng: new kakao.maps.LatLng(36.327580, 127.372502)
	},
	{
		content: '<div>대전크린</div><br>042-523-9996',
		latlng: new kakao.maps.LatLng(36.333216, 127.376504)
	},
	{
		content: '<div>총서코리아</div><br>042-538-7582',
		latlng: new kakao.maps.LatLng(36.340897, 127.387416)
	},
	{
		content: '<div>스마일청소</div><br>042-343-3443',
		latlng: new kakao.maps.LatLng(36.311033, 127.372812)
	},
	{
		content: '<div>현대청소대행</div><br>042-482-6522',
		latlng: new kakao.maps.LatLng(36.361766, 127.373040)
	},
	{
		content: '<div>청소119</div><br>042-528-0119',
		latlng: new kakao.maps.LatLng(36.339698, 127.397424)
	},
	{
		content: '<div>청소박사</div><br>042-472-7483',
		latlng: new kakao.maps.LatLng(36.354596, 127.385679)
	},
	{
		content: '<div>신바람청소마을</div><br>042-825-2337',
		latlng: new kakao.maps.LatLng(36.362254, 127.356855)
	},
	{
		content: '<div>한발용역</div><br>042-631-7023',
		latlng: new kakao.maps.LatLng(36.351963, 127.418961)
	},
	{
		content: '<div>세경청소대행</div><br>042-522-5228',
		latlng: new kakao.maps.LatLng(36.349450, 127.369930)
	},
	{
		content: '<div>크린청소</div><br>042-285-7823',
		latlng: new kakao.maps.LatLng(36.310639, 127.454257)
	},
	{
		content: '<div>청소KOREA</div><br>042-538-7585',
		latlng: new kakao.maps.LatLng(36.335396, 127.402415)
	},
	{
		content: '<div>청소왕</div><br>042-533-6979',
		latlng: new kakao.maps.LatLng(36.320322, 127.377009)
	},
	{
		content: '<div>청소당번</div><br>042-622-2755',
		latlng: new kakao.maps.LatLng(36.349085, 127.420783)
	},
	{
		content: '<div>청소119</div><br>042-626-0119',
		latlng: new kakao.maps.LatLng(36.330711, 127.400822)
	},
	{
		content: '<div>한빛청소대행</div><br>042-484-8832',
		latlng: new kakao.maps.LatLng(36.355946, 127.354725)
	},
	{
		content: '<div>가자청소기획</div><br>042-637-4993',
		latlng: new kakao.maps.LatLng(36.351660, 127.447423)
	},
	{
		content: '<div>한빛청소대행</div><br>042-626-8898',
		latlng: new kakao.maps.LatLng(36.364240, 127.445706)
	},
	{
		content: '<div>청소박사</div><br>042-537-7484',
		latlng: new kakao.maps.LatLng(36.306437, 127.436780)
	},
	{
		content: '<div>온정청소박사</div><br>042-584-7975',
		latlng: new kakao.maps.LatLng(36.313492, 127.411374)
	},
	{
		content: '<div>깔끔이청소박사</div><br>042-526-3079',
		latlng: new kakao.maps.LatLng(36.326493, 127.372578)
	},
	{
		content: '<div>대한청소대행</div><br>042-522-7977',
		latlng: new kakao.maps.LatLng(36.323589, 127.378071)
	},
	{
		content: '<div>솔로몬청소인력</div><br>042-527-6604',
		latlng: new kakao.maps.LatLng(36.363134, 127.426308)
	},
	{
		content: '<div>나래청소</div><br>042-271-7801',
		latlng: new kakao.maps.LatLng(36.310449, 127.458237)
	},
	{
		content: '<div>크린데이</div><br>042-636-2341',
		latlng: new kakao.maps.LatLng(36.355807, 127.444504)
	},
	{
		content: '<div>신바람청소마을</div><br>042-485-0337',
		latlng: new kakao.maps.LatLng(36.338145, 127.394408)
	},
	{
		content: '<div>백마청소대행</div><br>042-533-3734',
		latlng: new kakao.maps.LatLng(36.329568, 127.396317)
	},
	{
		content: '<div>청풍청소관리</div><br>042-489-8783',
		latlng: new kakao.maps.LatLng(36.356844, 127.361644)
	},
	{
		content: '<div>신바람청소마을</div><br>042-522-1733',
		latlng: new kakao.maps.LatLng(36.326762, 127.397038)
	},
	{
		content: '<div>크린월드</div><br>042-488-3167',
		latlng: new kakao.maps.LatLng(36.348180, 127.393981)
	},
	{
		content: '<div>세미환경</div><br>042-621-5380',
		latlng: new kakao.maps.LatLng(36.365442, 127.416844)
	},
	{
		content: '<div>창명</div><br>042-273-20158',
		latlng: new kakao.maps.LatLng(36.308305, 127.447646)
	},
	{
		content: '<div>온정청소박사</div><br>042-522-0133',
		latlng: new kakao.maps.LatLng(36.329780, 127.376668)
	},
	{
		content: '<div>가람청소박사</div><br>042-524-5116',
		latlng: new kakao.maps.LatLng(36.318439, 127.381131)
	},
	{
		content: '<div>클린캡슐</div><br>042-636-1104',
		latlng: new kakao.maps.LatLng(36.315905, 127.396220)
	},
	{
		content: '<div>(주)파란세상</div><br>042-636-1104',
		latlng: new kakao.maps.LatLng(36.349935, 127.416130)
	},
	{
		content: '<div>대전입주청소</div><br>042-331-5325',
		latlng: new kakao.maps.LatLng(36.356132, 127.400645)
	},
	{
		content: '<div>청청그린</div><br>042-381-7272',
		latlng: new kakao.maps.LatLng(36.362583, 127.409142)
	},
	{
		content: '<div>상쾌한산업</div><br>042-532-0882',
		latlng: new kakao.maps.LatLng(36.334542, 127.388525)
	},
	{
		content: '<div>신바람청소마을</div><br>042-825-4737',
		latlng: new kakao.maps.LatLng(36.384355, 127.324016)
	},
	{
		content: '<div>대전거주청소</div><br>042-342-5325',
		latlng: new kakao.maps.LatLng(36.356082, 127.371990)
	},
	{
		content: '<div>창원상사</div><br>042-532-1731',
		latlng: new kakao.maps.LatLng(36.316286, 127.377910)
	},
	{
		content: '<div>애들아청소하자</div><br>070-4195-1198',
		latlng: new kakao.maps.LatLng(36.306186, 127.316379)
	},
	{
		content: '<div>깔끔남홈케어</div><br>010-5917-0622',
		latlng: new kakao.maps.LatLng(36.294710, 127.341395)
	},
	{
		content: '<div>하우스케어</div><br>010-3549-4667',
		latlng: new kakao.maps.LatLng(36.299077, 127.353488)
	},
	{
		content: '<div>청소전문업체</div><br>043-733-1569',
		latlng: new kakao.maps.LatLng(36.295059, 127.569465)
	},
	{
		content: '<div>새로이크린</div><br>043-733-1569',
		latlng: new kakao.maps.LatLng(36.298898, 127.572985)
	},
	{
		content: '<div>깨끗한세상</div><br>043-900-3380',
		latlng: new kakao.maps.LatLng(36.264917, 127.587137)
	},
	{
		content: '<div>옥천청소용역</div><br>043-731-5722',
		latlng: new kakao.maps.LatLng(36.297275, 127.577546)
	},
	{
		content: '<div>옥천크린업</div><br>043-902-0039',
		latlng: new kakao.maps.LatLng(36.301824, 127.576332)
	},
	{
		content: '<div>대전입주청소</div><br>070-4980-5809',
		latlng: new kakao.maps.LatLng(36.302607, 127.566257)
	},
	{
		content: '<div>크린청소보수</div><br>070-8019-1712',
		latlng: new kakao.maps.LatLng(36.304319, 127.570870)
	},
	{
		content: '<div>청소박사도우미뱅크</div><br>043-732-7484',
		latlng: new kakao.maps.LatLng(36.300112, 127.565711)
	},
	{
		content: '<div>크린영동</div><br>043-744-5663',
		latlng: new kakao.maps.LatLng(36.173573, 127.776361)
	},
	{
		content: '<div>그린케어</div><br>043-745-0044',
		latlng: new kakao.maps.LatLng(36.177447, 127.778563)
	},
	{
		content: '<div>크린청소보수</div><br>070-8019-1549',
		latlng: new kakao.maps.LatLng(36.171097, 127.771778)
	},
	{
		content: '<div>대전입주청소</div><br>070-4980-5807',
		latlng: new kakao.maps.LatLng(36.174249, 127.752225)
	},
	{
		content: '<div>구미청소프로텍</div><br>054-473-9477',
		latlng: new kakao.maps.LatLng(36.098168, 128.441789)
	},
	{
		content: '<div>구미크리닝</div><br>054-475-2522',
		latlng: new kakao.maps.LatLng(36.135949, 128.417249)
	},
	{
		content: '<div>구미용역</div><br>054-462-9808',
		latlng: new kakao.maps.LatLng(36.103060, 128.382880)
	},
	{
		content: '<div>구미크리닝</div><br>054-474-6388',
		latlng: new kakao.maps.LatLng(36.112697, 128.377893)
	},
	{
		content: '<div>깔끔한박여사</div><br>054-456-0117',
		latlng: new kakao.maps.LatLng(36.153457, 128.333433)
	},
	{
		content: '<div>구미환경산업</div><br>054-451-2253',
		latlng: new kakao.maps.LatLng(36.131000, 128.315065)
	},
	{
		content: '<div>청경청소관리</div><br>054-456-4814',
		latlng: new kakao.maps.LatLng(36.138209, 128.298929)
	},
	{
		content: '<div>구미더홈케어</div><br>010-6505-5421',
		latlng: new kakao.maps.LatLng(36.081210, 128.411195)
	},
	{
		content: '<div>웰빙크린텍</div><br>054-461-7738',
		latlng: new kakao.maps.LatLng(36.124899, 128.366907)
	},
	{
		content: '<div>개미용역</div><br>054-471-2225',
		latlng: new kakao.maps.LatLng(36.092447, 128.441236)
	},
	{
		content: '<div>영덕이업</div><br>054-453-7799',
		latlng: new kakao.maps.LatLng(36.113390, 128.339784)
	},
	{
		content: '<div>대영청소용역</div><br>054-443-6325',
		latlng: new kakao.maps.LatLng(36.110616, 128.332746)
	},
	{
		content: '<div>청소박사</div><br>054-462-3484',
		latlng: new kakao.maps.LatLng(36.107427, 128.381326)
	},
	{
		content: '<div>가나청소용역</div><br>054-457-3533',
		latlng: new kakao.maps.LatLng(36.148052, 128.347680)
	},
	{
		content: '<div>청소한마당</div><br>054-475-1204',
		latlng: new kakao.maps.LatLng(36.108952, 128.430078)
	},
	{
		content: '<div>예예크린</div><br>054-473-7544',
		latlng: new kakao.maps.LatLng(36.144032, 128.421667)
	},
	{
		content: '<div>크린서브</div><br>054-442-5504',
		latlng: new kakao.maps.LatLng(36.131139, 128.328626)
	},
	{
		content: '<div>현대클린</div><br>054-715-2223',
		latlng: new kakao.maps.LatLng(36.112280, 128.425443)
	},
	{
		content: '<div>크린웰</div><br>054-474-0682',
		latlng: new kakao.maps.LatLng(36.140696, 128.431113)
	},
	{
		content: '<div>현대크린</div><br>054-474-1388',
		latlng: new kakao.maps.LatLng(36.148114, 128.416619)
	},
	{
		content: '<div>청소박사</div><br>054-463-0177',
		latlng: new kakao.maps.LatLng(36.124374, 128.375382)
	},
	{
		content: '<div>제일청소상사</div><br>054-475-2308',
		latlng: new kakao.maps.LatLng(36.138553, 128.454385)
	},
	{
		content: '<div>세기위생관리</div><br>054-471-4355',
		latlng: new kakao.maps.LatLng(36.113490, 128.404778)
	},
	{
		content: '<div>구미어머니청소</div><br>054-464-0112',
		latlng: new kakao.maps.LatLng(36.100460, 128.432746)
	},
	{
		content: '<div>새롬환경</div><br>054-444-1263',
		latlng: new kakao.maps.LatLng(36.132783, 128.326184)
	},
	{
		content: '<div>닥터크리너</div><br>054-442-9901',
		latlng: new kakao.maps.LatLng(36.152071, 128.313527)
	},
	{
		content: '<div>스마트앤홈</div><br>010-9355-0652',
		latlng: new kakao.maps.LatLng(36.110376, 128.402875)
	},
	{
		content: '<div>경북크린T&K</div><br>010-8675-6714',
		latlng: new kakao.maps.LatLng(35.878446, 128.617646)
	},
	{
		content: '<div>대구입주청소호야크린</div><br>010-5536-4027',
		latlng: new kakao.maps.LatLng(35.845193, 128.614578)
	},
	{
		content: '<div>대구청소</div><br>053-341-3538',
		latlng: new kakao.maps.LatLng(35.895107, 128.557064)
	},
	{
		content: '<div>대구청소</div><br>053-635-3530',
		latlng: new kakao.maps.LatLng(35.832226, 128.552944)
	},
	{
		content: '<div>모든청소</div><br>053-523-6677',
		latlng: new kakao.maps.LatLng(35.861725, 128.528911)
	},
	{
		content: '<div>북구청소대행</div><br>053-351-7882',
		latlng: new kakao.maps.LatLng(35.899557, 128.587963)
	},
	{
		content: '<div>대구청소웰빙홈케어</div><br>010-3824-8937',
		latlng: new kakao.maps.LatLng(35.894273, 128.582126)
	},
	{
		content: '<div>서구청소대행</div><br>053-564-7750',
		latlng: new kakao.maps.LatLng(35.872576, 128.567020)
	},
	{
		content: '<div>청소박사</div><br>053-759-7484',
		latlng: new kakao.maps.LatLng(35.863116, 128.642208)
	},
	{
		content: '<div>청소용역</div><br>053-257-4002',
		latlng: new kakao.maps.LatLng(35.825824, 128.550541)
	},
	{
		content: '<div>황금손클린</div><br>010-8828-4977',
		latlng: new kakao.maps.LatLng(35.856160, 128.592426)
	},
	{
		content: '<div>동구청소대행</div><br>053-957-1574',
		latlng: new kakao.maps.LatLng(35.886763, 128.644954)
	},
	{
		content: '<div>가람청소</div><br>070-7792-5255',
		latlng: new kakao.maps.LatLng(35.859221, 128.638775)
	},
	{
		content: '<div>달서구청소대행</div><br>053-583-3324',
		latlng: new kakao.maps.LatLng(35.857273, 128.519642)
	},
	{
		content: '<div>청소매니저</div><br>053-588-7455',
		latlng: new kakao.maps.LatLng(35.853378, 128.574917)
	},
	{
		content: '<div>청소대행사</div><br>053-424-3393',
		latlng: new kakao.maps.LatLng(35.865342, 128.581096)
	},
	{
		content: '<div>용역회사</div><br>053-381-4188',
		latlng: new kakao.maps.LatLng(35.907065, 128.617145)
	},
	{
		content: '<div>청소방역114</div><br>053-753-9114',
		latlng: new kakao.maps.LatLng(35.872019, 128.645984)
	},
	{
		content: '<div>청소플러스</div><br>053-986-1232',
		latlng: new kakao.maps.LatLng(35.897610, 128.650104)
	},
	{
		content: '<div>대구심부름</div><br>053-744-4020',
		latlng: new kakao.maps.LatLng(35.873092, 128.624355)
	},
	{
		content: '<div>청소하는마을</div><br>053-766-8234',
		latlng: new kakao.maps.LatLng(35.826311, 128.644755)
	},
	{
		content: '<div>청소가람</div><br>053-761-7728',
		latlng: new kakao.maps.LatLng(35.852522, 128.619233)
	},
	{
		content: '<div>청소박사</div><br>053-424-3484',
		latlng: new kakao.maps.LatLng(35.880899, 128.587327)
	},
	{
		content: '<div>예예크린</div><br>053-243-7544',
		latlng: new kakao.maps.LatLng(35.872711, 128.612155)
	},
	{
		content: '<div>중앙청소</div><br>053-358-5432',
		latlng: new kakao.maps.LatLng(35.897739, 128.589636)
	},
	{
		content: '<div>꿀벌크린청소</div><br>053-425-2666',
		latlng: new kakao.maps.LatLng(35.876454, 128.619661)
	},
	{
		content: '<div>신천종합관리(주)</div><br>053-429-6197',
		latlng: new kakao.maps.LatLng(35.869436, 128.602628)
	},
	{
		content: '<div>청소랜드</div><br>010-2508-1715',
		latlng: new kakao.maps.LatLng(35.841123, 128.560189)
	},
	{
		content: '<div>금강청소대행</div><br>053-952-0284',
		latlng: new kakao.maps.LatLng(35.889085, 128.628899)
	},
	{
		content: '<div>용역대표</div><br>053-254-0505',
		latlng: new kakao.maps.LatLng(35.871308, 128.590791)
	},
	{
		content: '<div>(주)닥트청소와종합개발</div><br>053-955-9670',
		latlng: new kakao.maps.LatLng(35.887682, 128.609268)
	},
	{
		content: '<div>탑크린</div><br>053-745-5211',
		latlng: new kakao.maps.LatLng(35.881366, 128.621104)
	},
	{
		content: '<div>청소닥터</div><br>053-351-2064',
		latlng: new kakao.maps.LatLng(35.897973, 128.605803)
	},
	{
		content: '<div>퍼스트홈케어</div><br>010-5306-7896',
		latlng: new kakao.maps.LatLng(35.832932, 128.551817)
	},
	{
		content: '<div>청소맨</div><br>053-939-6733',
		latlng: new kakao.maps.LatLng(35.887216, 128.616536)
	},
	{
		content: '<div>크린피아</div><br>053-744-8250',
		latlng: new kakao.maps.LatLng(35.852973, 128.616127)
	},
	{
		content: '<div>세기위생관리</div><br>053-716-1355',
		latlng: new kakao.maps.LatLng(35.857605, 128.622048)
	},
	{
		content: '<div>토탈크린</div><br>053-654-9389',
		latlng: new kakao.maps.LatLng(35.848174, 128.572645)
	},
	{
		content: '<div>중구어머니회</div><br>053-422-2572',
		latlng: new kakao.maps.LatLng(35.865858, 128.606846)
	},
	{
		content: '<div>대구종합관리(주)</div><br>053-312-5535',
		latlng: new kakao.maps.LatLng(35.917869, 128.547107)
	},
	{
		content: '<div>용역대표</div><br>053-424-5055',
		latlng: new kakao.maps.LatLng(35.865229, 128.599589)
	},
	{
		content: '<div>청소고래</div><br>053-471-7577',
		latlng: new kakao.maps.LatLng(35.850275, 128.600803)
	},
	{
		content: '<div>중구어머니회</div><br>053-427-7797',
		latlng: new kakao.maps.LatLng(35.871721, 128.611970)
	},
	{
		content: '<div>현대클린</div><br>053-525-1387',
		latlng: new kakao.maps.LatLng(35.871131, 128.556620)
	},
	{
		content: '<div>(주)명성산업</div><br>053-384-2728',
		latlng: new kakao.maps.LatLng(35.910859, 128.624837)
	},
	{
		content: '<div>동경크린텍</div><br>053-623-4533',
		latlng: new kakao.maps.LatLng(35.867590, 128.592792)
	},
	{
		content: '<div>강북환경(주)</div><br>053-354-7273',
		latlng: new kakao.maps.LatLng(35.884703, 128.580411)
	},
	{
		content: '<div>청정씨엔비</div><br>053-939-6860',
		latlng: new kakao.maps.LatLng(35.887654, 128.616097)
	},
	{
		content: '<div>스피드건물관리</div><br>053-744-7705',
		latlng: new kakao.maps.LatLng(35.876639, 128.590364)
	},
	{
		content: '<div>한맥종합관리(주)</div><br>053-745-4364',
		latlng: new kakao.maps.LatLng(35.876835, 128.623866)
	},
	{
		content: '<div>금부종합관리</div><br>053-566-7482',
		latlng: new kakao.maps.LatLng(35.880179, 128.576769)
	},
	{
		content: '<div>프로크린</div><br>053-473-1119',
		latlng: new kakao.maps.LatLng(35.854998, 128.596676)
	},
	{
		content: '<div>만덕종합관리</div><br>053-742-4206',
		latlng: new kakao.maps.LatLng(35.879786, 128.619739)
	},
	{
		content: '<div>청명C&S</div><br>053-653-1152',
		latlng: new kakao.maps.LatLng(35.860114, 128.567302)
	},
	{
		content: '<div>대성용역</div><br>053-421-9950',
		latlng: new kakao.maps.LatLng(35.864934, 128.595948)
	},
	{
		content: '<div>(주)옐로이</div><br>053-555-5068',
		latlng: new kakao.maps.LatLng(35.846619, 128.600158)
	},
	{
		content: '<div>(주)한마음종합관리</div><br>053-322-2070',
		latlng: new kakao.maps.LatLng(35.889258, 128.602950)
	},
	{
		content: '<div>비오랑코리아</div><br>053-564-4941',
		latlng: new kakao.maps.LatLng(35.873370, 128.560154)
	},
	{
		content: '<div>조은사람들</div><br>053-943-7646',
		latlng: new kakao.maps.LatLng(35.895623, 128.604099)
	},
	{
		content: '<div>라인홈케어</div><br>010-5353-8044',
		latlng: new kakao.maps.LatLng(35.893398, 128.587276)
	},
	{
		content: '<div>드림로즈</div><br>053-423-8745',
		latlng: new kakao.maps.LatLng(35.864637, 128.601155)
	},
	{
		content: '<div>(주)엠에스휴먼택</div><br>053-765-9841',
		latlng: new kakao.maps.LatLng(35.851450, 128.610948)
	},
	{
		content: '<div>(주)세보B.N.S</div><br>053-710-7900',
		latlng: new kakao.maps.LatLng(35.859640, 128.621919)
	},
	{
		content: '<div>에스엔티(주)</div><br>053-422-0797',
		latlng: new kakao.maps.LatLng(35.873911, 128.611526)
	},
	{
		content: '<div>신영산업(주)</div><br>053-429-6276',
		latlng: new kakao.maps.LatLng(35.867033, 128.602727)
	},
	{
		content: '<div>청소도사</div><br>053-651-5454',
		latlng: new kakao.maps.LatLng(35.810292, 128.502132)
	},
	{
		content: '<div>클린업</div><br>010-5670-2810',
		latlng: new kakao.maps.LatLng(35.821428, 128.531658)
	},
	{
		content: '<div>수성크린</div><br>0507-1326-9249',
		latlng: new kakao.maps.LatLng(33.284907, 126.653051)
	},
	{
		content: '<div>맥스클린</div><br>064-747-0878',
		latlng: new kakao.maps.LatLng(33.499976, 126.500796)
	},
	{
		content: '<div>(주)한성종합개발</div><br>064-758-5422',
		latlng: new kakao.maps.LatLng(33.511040, 126.537949)
	},
	{
		content: '<div>콜로리</div><br>064-747-7002',
		latlng: new kakao.maps.LatLng(33.488356, 126.487490)
	},
	{
		content: '<div>(주)한성종합개발</div><br>064-748-5422',
		latlng: new kakao.maps.LatLng(33.531961, 126.593175)
	},
	{
		content: '<div>제주위생방역</div><br>064-711-0346',
		latlng: new kakao.maps.LatLng(33.485873, 126.473356)
	},
	{
		content: '<div>(주)오현개발</div><br>064-727-5559',
		latlng: new kakao.maps.LatLng(33.492172, 126.537214)
	},
	{
		content: '<div>제주클린</div><br>064-747-9511',
		latlng: new kakao.maps.LatLng(33.491134, 126.487274)
	},
	{
		content: '<div>나날글로텍(주)</div><br>064-747-9511',
		latlng: new kakao.maps.LatLng(33.471861, 126.416234)
	},
	{
		content: '<div>에스원환경</div><br>064-712-0788',
		latlng: new kakao.maps.LatLng(33.494166, 126.496461)
	},
	{
		content: '<div>(주)삼익</div><br>064-747-2601',
		latlng: new kakao.maps.LatLng(33.490420, 126.493195)
	},
	{
		content: '<div>링크클린</div><br>064-763-4545',
		latlng: new kakao.maps.LatLng(33.249009, 126.569535)
	},
	{
		content: '<div>벅클린제주방역</div><br>064-721-6684',
		latlng: new kakao.maps.LatLng(33.505914, 126.545453)
	},
	{
		content: '<div>고흥산업</div><br>061-835-6218',
		latlng: new kakao.maps.LatLng(34.605861, 127.292135)
	},
	{
		content: '<div>신광환경개발</div><br>061-832-1564',
		latlng: new kakao.maps.LatLng(34.775399, 127.393038)
	},
	{
		content: '<div>녹동제일기업</div><br>061-842-1544',
		latlng: new kakao.maps.LatLng(34.534594, 127.137828)
	},
	{
		content: '<div>(주)제이엠지</div><br>061-835-1555',
		latlng: new kakao.maps.LatLng(34.589751, 127.270052)
	},
	{
		content: '<div>미래환경</div><br>061-832-6800',
		latlng: new kakao.maps.LatLng(34.600208, 127.302964)
	},
	{
		content: '<div>태흥기업</div><br>061-681-1039',
		latlng: new kakao.maps.LatLng(34.763310, 127.671548)
	},
	{
		content: '<div>청소119</div><br>061-653-0711',
		latlng: new kakao.maps.LatLng(34.747514, 127.700387)
	},
	{
		content: '<div>미소환경</div><br>061-691-7170',
		latlng: new kakao.maps.LatLng(34.780231, 127.644425)
	},
	{
		content: '<div>파란세상청소꼼꼼</div><br>070-8737-2470',
		latlng: new kakao.maps.LatLng(34.755976, 127.729570)
	},
	{
		content: '<div>(주)푸른환경</div><br>061-684-8844',
		latlng: new kakao.maps.LatLng(34.821390, 127.640992)
	},
	{
		content: '<div>은하수카페트청소용역</div><br>061-641-4754',
		latlng: new kakao.maps.LatLng(34.729175, 127.715837)
	},
	{
		content: '<div>조은환경청소</div><br>061-643-2124',
		latlng: new kakao.maps.LatLng(34.758797, 127.644082)
	},
	{
		content: '<div>(주)114청소방역공사</div><br>061-641-7080',
		latlng: new kakao.maps.LatLng(34.741871, 127.726136)
	},
	{
		content: '<div>미소환경</div><br>061-653-7170',
		latlng: new kakao.maps.LatLng(34.766976, 127.677384)
	},
	{
		content: '<div>(유한)대륜</div><br>061-665-0030',
		latlng: new kakao.maps.LatLng(34.746103, 127.745706)
	},
	{
		content: '<div>자연환경</div><br>061-920-9446',
		latlng: new kakao.maps.LatLng(34.751745, 127.707940)
	},
	{
		content: '<div>복지환경</div><br>061-691-4551',
		latlng: new kakao.maps.LatLng(34.772899, 127.651979)
	},
	{
		content: '<div>(유한)부광기업</div><br>061-685-5101',
		latlng: new kakao.maps.LatLng(34.857740, 127.699700)
	},
	{
		content: '<div>깨끗한마을</div><br>061-651-0059',
		latlng: new kakao.maps.LatLng(34.770360, 127.703820)
	},
	{
		content: '<div>대원환경</div><br>061-653-7225',
		latlng: new kakao.maps.LatLng(34.749206, 127.705194)
	},
	{
		content: '<div>크린텍(주)</div><br>061-681-0341',
		latlng: new kakao.maps.LatLng(34.781499, 127.672578)
	},
	{
		content: '<div>청남종합환경</div><br>061-685-0217',
		latlng: new kakao.maps.LatLng(34.771489, 127.639619)
	},
	{
		content: '<div>미화용역공사</div><br>061-686-4673',
		latlng: new kakao.maps.LatLng(34.811243, 127.728883)
	},
	{
		content: '<div>(주)하이팩</div><br>061-683-3345',
		latlng: new kakao.maps.LatLng(34.857189, 127.720423)
	},
	{
		content: '<div>청소싹싹</div><br>1666-2462',
		latlng: new kakao.maps.LatLng(34.746792, 127.650852)
	},
	{
		content: '<div>전남환경</div><br>061-692-4400',
		latlng: new kakao.maps.LatLng(34.761830, 127.668829)
	},
	{
		content: '<div>대흥산업</div><br>061-691-0309',
		latlng: new kakao.maps.LatLng(34.774617, 127.654623)
	},
	{
		content: '<div>청소소독대행신안용역</div><br>061-542-0930',
		latlng: new kakao.maps.LatLng(34.490025, 126.257669)
	},
	{
		content: '<div>경산자활신나는빗자루</div><br>053-812-2636',
		latlng: new kakao.maps.LatLng(35.826835, 128.734116)
	},
	{
		content: '<div>경산어머니회</div><br>053-811-2420',
		latlng: new kakao.maps.LatLng(35.830575, 128.732660)
	},
	{
		content: '<div>경산환경(주)</div><br>053-802-3449',
		latlng: new kakao.maps.LatLng(35.823883, 128.827581)
	},
	{
		content: '<div>둥지청소</div><br>053-814-2929',
		latlng: new kakao.maps.LatLng(35.831953, 128.735816)
	},
	{
		content: '<div>청소한마당</div><br>053-812-1204',
		latlng: new kakao.maps.LatLng(35.826442, 128.723435)
	},
	{
		content: '<div>크린웰</div><br>053-857-0682',
		latlng: new kakao.maps.LatLng(35.876618, 128.822240)
	},
	{
		content: '<div>(주)남부서비스</div><br>053-817-0898',
		latlng: new kakao.maps.LatLng(35.845139, 128.779999)
	},
	{
		content: '<div>청정씨엔비</div><br>053-813-6860',
		latlng: new kakao.maps.LatLng(35.838841, 128.728290)
	},
	{
		content: '<div>토탈종합방제</div><br>053-817-9993',
		latlng: new kakao.maps.LatLng(35.842974, 128.761306)
	},
	{
		content: '<div>동글이</div><br>053-965-2311',
		latlng: new kakao.maps.LatLng(35.820537, 128.761549)
	},
	{
		content: '<div>둥지청소</div><br>053-857-3727',
		latlng: new kakao.maps.LatLng(35.914574, 128.811802)
	},
	{
		content: '<div>코리아방제</div><br>053-812-4844',
		latlng: new kakao.maps.LatLng(35.822308, 128.737030)
	},
	{
		content: '<div>(주)세영씨엠에스</div><br>053-814-8448',
		latlng: new kakao.maps.LatLng(35.813580, 128.733576)
	},
	{
		content: '<div>홈닥터</div><br>053-219-0707',
		latlng: new kakao.maps.LatLng(35.887255, 128.822481)
	},
	{
		content: '<div>홈에어컨</div><br>070-7007-2378',
		latlng: new kakao.maps.LatLng(35.827569, 128.739568)
	},
	{
		content: '<div>부영크리닝</div><br>053-817-5514',
		latlng: new kakao.maps.LatLng(35.814764, 128.762399)
	},
	{
		content: '<div>일함(주)</div><br>053-856-9335',
		latlng: new kakao.maps.LatLng(35.907191, 128.804666)
	},
	{
		content: '<div>크린토피아 경산삼풍점</div><br>053-801-5783',
		latlng: new kakao.maps.LatLng(35.827453, 128.754855)
	},
	{
		content: '<div>휴먼시아크리닝</div><br>053-817-5557',
		latlng: new kakao.maps.LatLng(35.813518, 128.755589)
	},
	{
		content: '<div>월드크린 경산점</div><br>053-802-0322',
		latlng: new kakao.maps.LatLng(35.838682, 128.719934)
	},
	{
		content: '<div>일함구미지사</div><br>053-852-9336',
		latlng: new kakao.maps.LatLng(35.909334, 128.803520)
	},
	{
		content: '<div>대구종합관리(주)</div><br>053-312-5535',
		latlng: new kakao.maps.LatLng(35.915998, 128.547111)
	},
	{
		content: '<div>대한환경</div><br>053-354-4409',
		latlng: new kakao.maps.LatLng(35.951762, 128.552741)
	},
	{
		content: '<div>청소마을</div><br>010-3641-9979',
		latlng: new kakao.maps.LatLng(35.173954, 126.935481)
	},
	{
		content: '<div>청소대행</div><br>062-446-0408',
		latlng: new kakao.maps.LatLng(35.193274, 126.822161)
	},
	{
		content: '<div>차평동청소대행업체</div><br>062-710-5091',
		latlng: new kakao.maps.LatLng(35.156564, 126.853191)
	},
	{
		content: '<div>금호동청소대행업체</div><br>062-710-4093',
		latlng: new kakao.maps.LatLng(35.134864, 126.858090)
	},
	{
		content: '<div>닥트청소대행전문업체</div><br>062-529-6302',
		latlng: new kakao.maps.LatLng(35.163907, 126.905451)
	},
	{
		content: '<div>청소대행</div><br>062-447-0408',
		latlng: new kakao.maps.LatLng(35.123511, 126.919332)
	},
	{
		content: '<div>청소용역대행</div><br>062-263-9256',
		latlng: new kakao.maps.LatLng(35.179110, 126.934822)
	},
	{
		content: '<div>광주청소용역</div><br>062-651-4333',
		latlng: new kakao.maps.LatLng(35.127463, 126.909272)
	},
	{
		content: '<div>광주키다리청소</div><br>010-3641-9979',
		latlng: new kakao.maps.LatLng(35.221324, 126.831344)
	},
	{
		content: '<div>청소왕꼼꼼이</div><br>062-363-1012',
		latlng: new kakao.maps.LatLng(35.142949, 126.875527)
	},
	{
		content: '<div>깔끄미그린청소</div><br>062-945-1504',
		latlng: new kakao.maps.LatLng(35.141956, 126.797842)
	},
	{
		content: '<div>크린청소</div><br>062-376-2256',
		latlng: new kakao.maps.LatLng(35.153866, 126.870429)
	},
	{
		content: '<div>한마음청소</div><br>062-374-8806',
		latlng: new kakao.maps.LatLng(35.147713, 126.866545)
	},
	{
		content: '<div>청소크린하우스</div><br>062-416-7785',
		latlng: new kakao.maps.LatLng(35.193376, 126.858574)
	},
	{
		content: '<div>은금청소</div><br>062-671-2370',
		latlng: new kakao.maps.LatLng(35.132470, 126.900460)
	},
	{
		content: '<div>청소나라북구점</div><br>062-521-7482',
		latlng: new kakao.maps.LatLng(35.166717, 126.898056)
	},
	{
		content: '<div>그린청소용역</div><br>062-444-0306',
		latlng: new kakao.maps.LatLng(35.216659, 126.840035)
	},
	{
		content: '<div>청소크린하우스</div><br>062-446-7785',
		latlng: new kakao.maps.LatLng(35.167559, 126.872307)
	},
	{
		content: '<div>청소나라</div><br>062-372-7482',
		latlng: new kakao.maps.LatLng(35.145384, 126.856171)
	},
	{
		content: '<div>퍼스트그린청소용역</div><br>062-463-6122',
		latlng: new kakao.maps.LatLng(35.171488, 126.831452)
	},
	{
		content: '<div>청소크린하우스</div><br>062-234-7785',
		latlng: new kakao.maps.LatLng(35.171769, 126.928612)
	},
	{
		content: '<div>청소세상</div><br>062-651-6969',
		latlng: new kakao.maps.LatLng(35.137524, 126.891876)
	},
	{
		content: '<div>그린청소용역</div><br>062-381-0306',
		latlng: new kakao.maps.LatLng(35.148192, 126.849304)
	},
	{
		content: '<div>청소119</div><br>062-447-9119',
		latlng: new kakao.maps.LatLng(35.137804, 126.903206)
	},
	{
		content: '<div>으뜸청소</div><br>062-682-7900',
		latlng: new kakao.maps.LatLng(35.136681, 126.855828)
	},
	{
		content: '<div>드림청소개발</div><br>062-973-8155',
		latlng: new kakao.maps.LatLng(35.184958, 126.834885)
	},
	{
		content: '<div>청소119</div><br>062-457-9119',
		latlng: new kakao.maps.LatLng(35.141173, 126.921402)
	},
	{
		content: '<div>청소119</div><br>062-514-4119',
		latlng: new kakao.maps.LatLng(35.163349, 126.934105)
	},
	{
		content: '<div>청소119</div><br>062-953-5119',
		latlng: new kakao.maps.LatLng(35.169243, 126.826988)
	},
	{
		content: '<div>으뜸청소</div><br>062-676-6400',
		latlng: new kakao.maps.LatLng(35.123728, 126.884433)
	},
	{
		content: '<div>그린청소용역</div><br>062-434-0466',
		latlng: new kakao.maps.LatLng(35.201331, 126.822170)
	},
	{
		content: '<div>그린청소용역</div><br>062-383-0306',
		latlng: new kakao.maps.LatLng(35.139254, 126.877288)
	},
	{
		content: '<div>뉴스타종합청소용역</div><br>062-514-7720',
		latlng: new kakao.maps.LatLng(35.183314, 126.871776)
	},
	{
		content: '<div>청소119</div><br>062-449-9119',
		latlng: new kakao.maps.LatLng(35.163791, 126.880963)
	},
	{
		content: '<div>청소꾼청돌이</div><br>062-972-7479',
		latlng: new kakao.maps.LatLng(35.221983, 126.833110)
	},
	{
		content: '<div>믿음청소</div><br>062-955-5399',
		latlng: new kakao.maps.LatLng(35.170403, 126.803250)
	},
	{
		content: '<div>뉴스타종합청소용역</div><br>062-673-7720',
		latlng: new kakao.maps.LatLng(35.115812, 126.908125)
	},
	{
		content: '<div>청소크린하우스</div><br>062-673-7785',
		latlng: new kakao.maps.LatLng(35.124549, 126.896472)
	},
	{
		content: '<div>으뜸청소</div><br>062-574-0096',
		latlng: new kakao.maps.LatLng(35.206909, 126.899628)
	},
	{
		content: '<div>드림개발청소</div><br>062-527-7155',
		latlng: new kakao.maps.LatLng(35.162227, 126.929985)
	},
	{
		content: '<div>퍼스트그린청소용역</div><br>062-419-6122',
		latlng: new kakao.maps.LatLng(35.186642, 126.905609)
	},
	{
		content: '<div>청소나라광산점</div><br>062-971-7482',
		latlng: new kakao.maps.LatLng(35.212171, 126.836945)
	},
	{
		content: '<div>으뜸청소</div><br>062-449-8155',
		latlng: new kakao.maps.LatLng(35.153525, 126.843468)
	},
	{
		content: '<div>청소하는사람들</div><br>062-371-9244',
		latlng: new kakao.maps.LatLng(35.148753, 126.878144)
	},
	{
		content: '<div>현대청소</div><br>062-961-2222',
		latlng: new kakao.maps.LatLng(35.184678, 126.823899)
	},
	{
		content: '<div>대신청소나라</div><br>062-369-7664',
		latlng: new kakao.maps.LatLng(35.149662, 126.880898)
	},
	{
		content: '<div>청소일일구</div><br>062-449-1119',
		latlng: new kakao.maps.LatLng(35.192325, 126.830788)
	},
	{
		content: '<div>드림청소개발</div><br>062-653-8155',
		latlng: new kakao.maps.LatLng(35.140591, 126.860797)
	},
	{
		content: '<div>대신청소나라</div><br>062-457-7005',
		latlng: new kakao.maps.LatLng(35.168965, 126.810987)
	},
	{
		content: '<div>뉴스타종합청소용역</div><br>062-226-7720',
		latlng: new kakao.maps.LatLng(35.161122, 126.923876)
	},
	{
		content: '<div>대신청소나라</div><br>062-416-0770',
		latlng: new kakao.maps.LatLng(35.191157, 126.856918)
	},
	{
		content: '<div>깨끗한마을</div><br>062-224-1005',
		latlng: new kakao.maps.LatLng(35.171302, 126.907954)
	},
	{
		content: '<div>떳다청소방</div><br>062-944-1717',
		latlng: new kakao.maps.LatLng(35.132411, 126.778732)
	},
	{
		content: '<div>깔끄미그린청소</div><br>062-574-1509',
		latlng: new kakao.maps.LatLng(35.206504, 126.897134)
	},
	{
		content: '<div>뉴스타청소세상</div><br>062-433-7720',
		latlng: new kakao.maps.LatLng(35.156783, 126.877332)
	},
	{
		content: '<div>청소119</div><br>062-446-9119',
		latlng: new kakao.maps.LatLng(35.154279, 126.867125)
	},
	{
		content: '<div>깨끗한나라고운</div><br>062-267-1688',
		latlng: new kakao.maps.LatLng(35.190337, 126.928017)
	},
	{
		content: '<div>대명크린</div><br>062-264-1964',
		latlng: new kakao.maps.LatLng(35.164277, 126.933092)
	},
	{
		content: '<div>(주)대광기업</div><br>062-524-7643',
		latlng: new kakao.maps.LatLng(35.182740, 126.895785)
	},
	{
		content: '<div>깨끗한마을</div><br>062-452-6700',
		latlng: new kakao.maps.LatLng(35.201260, 126.875287)
	},
	{
		content: '<div>녹색솔루션</div><br>062-528-1999',
		latlng: new kakao.maps.LatLng(35.168817, 126.903002)
	},
	{
		content: '<div>더조은클린환경</div><br>062-603-2836',
		latlng: new kakao.maps.LatLng(35.116045, 126.862007)
	},
	{
		content: '<div>청인시에스비즈니스글로벌(주)</div><br>062-512-6551',
		latlng: new kakao.maps.LatLng(35.180253, 126.897806)
	},
	{
		content: '<div>광산첨단방역</div><br>062-971-1755',
		latlng: new kakao.maps.LatLng(35.213989, 126.827363)
	},
	{
		content: '<div>동아환경개발</div><br>062-529-6301',
		latlng: new kakao.maps.LatLng(35.162660, 126.905191)
	},
	{
		content: '<div>에코크린365(침대청소전문)</div><br>010-8678-5365',
		latlng: new kakao.maps.LatLng(35.128164, 126.898083)
	},
	{
		content: '<div>(주)그린환경개발</div><br>062-514-0868',
		latlng: new kakao.maps.LatLng(35.168883, 126.910270)
	},
	{
		content: '<div>(주)정도실업</div><br>062-514-2589',
		latlng: new kakao.maps.LatLng(35.160294, 126.905438)
	},
	{
		content: '<div>광주보건환경</div><br>062-365-6251',
		latlng: new kakao.maps.LatLng(35.148955, 126.885896)
	},
	{
		content: '<div>(주)제이앤비맨파워</div><br>062-575-8041',
		latlng: new kakao.maps.LatLng(35.195846, 126.878332)
	},
	{
		content: '<div>(주)엠케이메디피아</div><br>062-368-7000',
		latlng: new kakao.maps.LatLng(35.154301, 126.848087)
	},
	{
		content: '<div>(주)포인텍</div><br>062-959-5454',
		latlng: new kakao.maps.LatLng(35.186366, 126.803561)
	},
	{
		content: '<div>경원문화(주)</div><br>062-513-3663',
		latlng: new kakao.maps.LatLng(35.173079, 126.867523)
	},
	{
		content: '<div>(주)에스존</div><br>062-515-8117',
		latlng: new kakao.maps.LatLng(35.170739, 126.906717)
	},
	{
		content: '<div>(주)파란세상</div><br>062-430-1119',
		latlng: new kakao.maps.LatLng(35.170632, 126.885063)
	},
	{
		content: '<div>청소왕꼼꼼이</div><br>061-333-1012',
		latlng: new kakao.maps.LatLng(35.031319, 126.717678)
	},
	{
		content: '<div>피플코리아</div><br>061-335-2248',
		latlng: new kakao.maps.LatLng(35.033234, 126.719953)
	},
	{
		content: '<div>푸른클리닝</div><br>061-334-3861',
		latlng: new kakao.maps.LatLng(35.024291, 126.714181)
	},
	{
		content: '<div>(유한)일마니</div><br>061-334-3340',
		latlng: new kakao.maps.LatLng(35.046902, 126.841729)
	},
	{
		content: '<div>(주)금성산업</div><br>061-333-4101',
		latlng: new kakao.maps.LatLng(35.030888, 126.721634)
	},
	{
		content: '<div>깨끗한마을</div><br>061-333-0059',
		latlng: new kakao.maps.LatLng(35.036637, 126.716811)
	},
	{
		content: '<div>(주)녹색솔루션</div><br>061-333-3271',
		latlng: new kakao.maps.LatLng(35.036541, 126.716780)
	},
	{
		content: '<div>그린종합방역</div><br>061-552-0265',
		latlng: new kakao.maps.LatLng(34.316821, 126.745531)
	},
	{
		content: '<div>수세미청소용역</div><br>061-555-5579',
		latlng: new kakao.maps.LatLng(34.325091, 126.741587)
	},
	{
		content: '<div>새하얀청소용역</div><br>061-555-1441',
		latlng: new kakao.maps.LatLng(34.315117, 126.760067)
	},
	{
		content: '<div>제일소독환경공사</div><br>061-552-0678',
		latlng: new kakao.maps.LatLng(34.387191, 126.647090)
	},
	{
		content: '<div>(주)페스콘</div><br>061-552-0629',
		latlng: new kakao.maps.LatLng(34.316312, 126.746810)
	},
	{
		content: '<div>청소소독대행신안용역</div><br>061-532-7456',
		latlng: new kakao.maps.LatLng(34.568757, 126.599383)
	},
	{
		content: '<div>제일소독공사</div><br>061-536-9970',
		latlng: new kakao.maps.LatLng(34.573096, 126.594403)
	},
	{
		content: '<div>청소대행</div><br>061-537-3337',
		latlng: new kakao.maps.LatLng(34.567628, 126.608188)
	},
	{
		content: '<div>태흥기업(청소업체)</div><br>061-727-1039',
		latlng: new kakao.maps.LatLng(34.939523, 127.519390)
	},
	{
		content: '<div>청소대행</div><br>061-721-1377',
		latlng: new kakao.maps.LatLng(34.945030, 127.525299)
	},
	{
		content: '<div>청소119</div><br>061-742-5001',
		latlng: new kakao.maps.LatLng(34.946777, 127.513817)
	},
	{
		content: '<div>(주)순천환경</div><br>061-745-2111',
		latlng: new kakao.maps.LatLng(34.992939, 127.513865)
	},
	{
		content: '<div>꼼꼼이청소</div><br>061-904-3400',
		latlng: new kakao.maps.LatLng(34.940764, 127.504199)
	},
	{
		content: '<div>향우산업순천사업관리소</div><br>061-744-4092',
		latlng: new kakao.maps.LatLng(34.945070, 127.509032)
	},
	{
		content: '<div>자연환경</div><br>061-903-9446',
		latlng: new kakao.maps.LatLng(34.961431, 127.525422)
	},
	{
		content: '<div>미소환경</div><br>061-742-7170',
		latlng: new kakao.maps.LatLng(34.942142, 127.497055)
	},
	{
		content: '<div>청호환경공사</div><br>061-744-4758',
		latlng: new kakao.maps.LatLng(34.948515, 127.485919)
	},
	{
		content: '<div>전남환경</div><br>061-725-9985',
		latlng: new kakao.maps.LatLng(34.957815, 127.535718)
	},
	{
		content: '<div>산일기업</div><br>061-754-8881',
		latlng: new kakao.maps.LatLng(34.957987, 127.486549)
	},
	{
		content: '<div>청소119</div><br>061-726-1911',
		latlng: new kakao.maps.LatLng(34.970213, 127.536978)
	},
	{
		content: '<div>(주)에코스엠</div><br>061-744-4003',
		latlng: new kakao.maps.LatLng(34.949710, 127.515067)
	},
	{
		content: '<div>정도환경청소</div><br>061-721-6005',
		latlng: new kakao.maps.LatLng(34.961035, 127.525319)
	},
	{
		content: '<div>(유한)가나환경공사</div><br>061-724-5120',
		latlng: new kakao.maps.LatLng(34.949466, 127.528068)
	},
	{
		content: '<div>(주)청솔</div><br>061-745-1100',
		latlng: new kakao.maps.LatLng(34.951475, 127.514993)
	},
	{
		content: '<div>(유한)전흥기업</div><br>061-743-6353',
		latlng: new kakao.maps.LatLng(34.932627, 127.523995)
	},
	{
		content: '<div>한국개발(주)</div><br>061-724-1945',
		latlng: new kakao.maps.LatLng(34.947189, 127.516605)
	},
	{
		content: '<div>조은환경</div><br>061-722-2124',
		latlng: new kakao.maps.LatLng(34.945294, 127.515980)
	},
	{
		content: '<div>대원환경</div><br>061-725-0225',
		latlng: new kakao.maps.LatLng(34.957973, 127.535752)
	},
	{
		content: '<div>(유한)그린피스환경공사</div><br>061-724-1990',
		latlng: new kakao.maps.LatLng(34.975558, 127.495583)
	},
	{
		content: '<div>그린시스템</div><br>061-726-6000',
		latlng: new kakao.maps.LatLng(34.911392, 127.530430)
	},
	{
		content: '<div>샹크미</div><br>061-724-9750',
		latlng: new kakao.maps.LatLng(34.956144, 127.514809)
	},
	{
		content: '<div>금호환경</div><br>061-742-5004',
		latlng: new kakao.maps.LatLng(34.939541, 127.490090)
	},
	{
		content: '<div>(유한)경진종합개발</div><br>061-742-3022',
		latlng: new kakao.maps.LatLng(34.953331, 127.485111)
	},
	{
		content: '<div>(주)해룡기업</div><br>061-746-4789',
		latlng: new kakao.maps.LatLng(34.887458, 127.576607)
	},
	{
		content: '<div>호남환경공사</div><br>061-722-6611',
		latlng: new kakao.maps.LatLng(34.957551, 127.530773)
	},
	{
		content: '<div>크리니티호남지사</div><br>061-741-7421',
		latlng: new kakao.maps.LatLng(34.948687, 127.504853)
	},
	{
		content: '<div>태흥기업(청소업체)</div><br>061-792-1039',
		latlng: new kakao.maps.LatLng(34.938257, 127.693265)
	},
	{
		content: '<div>중마동청소대행</div><br>061-795-7470',
		latlng: new kakao.maps.LatLng(34.964427, 127.716268)
	},
	{
		content: '<div>조은환경</div><br>061-791-2124',
		latlng: new kakao.maps.LatLng(34.948941, 127.687277)
	},
	{
		content: '<div>깨끗한마을</div><br>061-761-2059',
		latlng: new kakao.maps.LatLng(34.988329, 127.593894)
	},
	{
		content: '<div>바퀴벌레개미119</div><br>061-791-7477',
		latlng: new kakao.maps.LatLng(34.938139, 127.686235)
	},
	{
		content: '<div>미소환경</div><br>061-795-7170',
		latlng: new kakao.maps.LatLng(34.954694, 127.705714)
	},
	{
		content: '<div>클린시티</div><br>061-793-4330',
		latlng: new kakao.maps.LatLng(34.962650, 127.721737)
	},
	{
		content: '<div>대원환경</div><br>061-791-0134',
		latlng: new kakao.maps.LatLng(34.937237, 127.686814)
	},
	{
		content: '<div>국일종합관리(유한)</div><br>061-795-3304',
		latlng: new kakao.maps.LatLng(34.940779, 127.698239)
	},
	{
		content: '<div>(유한)한국방역공사</div><br>061-772-0555',
		latlng: new kakao.maps.LatLng(34.976692, 127.750010)
	},
	{
		content: '<div>로컬홈크린</div><br>061-793-7771',
		latlng: new kakao.maps.LatLng(34.941503, 127.701243)
	},
	{
		content: '<div>이레기업(주)</div><br>061-793-0261',
		latlng: new kakao.maps.LatLng(34.926004, 127.639578)
	},
	{
		content: '<div>환금산업(주)</div><br>061-761-6688',
		latlng: new kakao.maps.LatLng(34.963371, 127.576422)
	},
	{
		content: '<div>동부환경</div><br>061-793-6116',
		latlng: new kakao.maps.LatLng(34.962733, 127.722682)
	},
	{
		content: '<div>광산개발(주)</div><br>061-791-6005',
		latlng: new kakao.maps.LatLng(34.938328, 127.690153)
	},
	{
		content: '<div>(유한)백운</div><br>061-762-7041',
		latlng: new kakao.maps.LatLng(34.976796, 127.591629)
	},
	{
		content: '<div>그린도시환경(주)</div><br>061-762-6650',
		latlng: new kakao.maps.LatLng(34.968531, 127.563893)
	},
	{
		content: '<div>(주)백민</div><br>061-795-5656',
		latlng: new kakao.maps.LatLng(34.944830, 127.695512)
	},
	{
		content: '<div>(주)에이원</div><br>061-792-3113',
		latlng: new kakao.maps.LatLng(34.941812, 127.697073)
	},
	{
		content: '<div>(주)광양해양환경</div><br>061-793-2420',
		latlng: new kakao.maps.LatLng(34.931102, 127.696155)
	},
	{
		content: '<div>(주)신영</div><br>061-762-9661',
		latlng: new kakao.maps.LatLng(34.979968, 127.580821)
	},
	{
		content: '<div>(주)오도</div><br>061-795-5000',
		latlng: new kakao.maps.LatLng(34.942067, 127.699766)
	},
	{
		content: '<div>청소박사</div><br>055-884-7468',
		latlng: new kakao.maps.LatLng(35.072158, 127.747676)
	},
	{
		content: '<div>(주)금성환경</div><br>055-884-6661',
		latlng: new kakao.maps.LatLng(34.967520, 127.800409)
	},
	{
		content: '<div>그린방영공사(합명)</div><br>061-781-8080',
		latlng: new kakao.maps.LatLng(35.208993, 127.469869)
	},
	{
		content: '<div>깨끗한마을</div><br>063-653-0057',
		latlng: new kakao.maps.LatLng(35.383876, 127.129745)
	},
	{
		content: '<div>클린월드</div><br>063-652-7891',
		latlng: new kakao.maps.LatLng(35.375755, 127.134003)
	},
	{
		content: '<div>도깨비방망이</div><br>063-247-7481',
		latlng: new kakao.maps.LatLng(35.836919, 127.097647)
	},
	{
		content: '<div>홈크린입주이사청소</div><br>063-278-0202',
		latlng: new kakao.maps.LatLng(35.829822, 127.132495)
	},
	{
		content: '<div>웰빙크린</div><br>063-232-4752',
		latlng: new kakao.maps.LatLng(35.829961, 127.159274)
	},
	{
		content: '<div>서동환경</div><br>063-287-4040',
		latlng: new kakao.maps.LatLng(35.817573, 127.140391)
	},
	{
		content: '<div>전주환경위생(주)</div><br>063-224-8876',
		latlng: new kakao.maps.LatLng(35.796552, 127.086146)
	},
	{
		content: '<div>청소하는날입주청소</div><br>063-221-2278',
		latlng: new kakao.maps.LatLng(35.795855, 127.119448)
	},
	{
		content: '<div>청소닥터</div><br>063-273-2482',
		latlng: new kakao.maps.LatLng(35.828569, 127.124942)
	},
	{
		content: '<div>미소청소박사</div><br>063-226-1592',
		latlng: new kakao.maps.LatLng(35.814511, 127.112754)
	},
	{
		content: '<div>청소반장</div><br>063-221-7081',
		latlng: new kakao.maps.LatLng(35.828430, 127.112754)
	},
	{
		content: '<div>청소닥터</div><br>063-221-2483',
		latlng: new kakao.maps.LatLng(35.801703, 127.102626)
	},
	{
		content: '<div>스팀청소월드</div><br>063-222-8276',
		latlng: new kakao.maps.LatLng(35.819031, 127.120864)
	},
	{
		content: '<div>청소박사</div><br>063-221-2105',
		latlng: new kakao.maps.LatLng(35.818823, 127.121679)
	},
	{
		content: '<div>청결청소</div><br>063-902-3801',
		latlng: new kakao.maps.LatLng(35.861490, 127.128956)
	},
	{
		content: '<div>무지개청소</div><br>063-247-2822',
		latlng: new kakao.maps.LatLng(35.843289, 127.147125)
	},
	{
		content: '<div>깔끔히청소나라</div><br>063-241-5716',
		latlng: new kakao.maps.LatLng(35.836959, 127.159661)
	},
	{
		content: '<div>청소대장</div><br>063-272-8279',
		latlng: new kakao.maps.LatLng(35.825952, 127.117852)
	},
	{
		content: '<div>한결청소</div><br>063-228-2520',
		latlng: new kakao.maps.LatLng(35.819357, 127.099200)
	},
	{
		content: '<div>청소사랑</div><br>063-231-8285',
		latlng: new kakao.maps.LatLng(35.832895, 127.145956)
	},
	{
		content: '<div>청결청소</div><br>063-901-1708',
		latlng: new kakao.maps.LatLng(35.831621, 127.171462)
	},
	{
		content: '<div>달인의청소</div><br>063-903-2901',
		latlng: new kakao.maps.LatLng(35.787665, 127.140528)
	},
	{
		content: '<div>청소박사</div><br>063-272-5119',
		latlng: new kakao.maps.LatLng(35.874266, 127.138343)
	},
	{
		content: '<div>달인의청소</div><br>063-903-2600',
		latlng: new kakao.maps.LatLng(35.813261, 127.106056)
	},
	{
		content: '<div>굿모닝환경</div><br>063-214-0604',
		latlng: new kakao.maps.LatLng(35.816214, 127.114067)
	},
	{
		content: '<div>미소환경</div><br>063-212-7482',
		latlng: new kakao.maps.LatLng(35.855183, 127.097073)
	},
	{
		content: '<div>달인의청소</div><br>063-214-2900',
		latlng: new kakao.maps.LatLng(35.868365, 127.079837)
	},
	{
		content: '<div>(유한)수성</div><br>063-222-5510',
		latlng: new kakao.maps.LatLng(35.810111, 127.129118)
	},
	{
		content: '<div>(유한)강원종합관리</div><br>063-223-1431',
		latlng: new kakao.maps.LatLng(35.821923, 127.121107)
	},
	{
		content: '<div>(유한)동산실업</div><br>063-236-5533',
		latlng: new kakao.maps.LatLng(35.797707, 127.119165)
	},
	{
		content: '<div>국제환경</div><br>063-224-7004',
		latlng: new kakao.maps.LatLng(35.807158, 127.118194)
	},
	{
		content: '<div>(유한)백제환경</div><br>063-246-2038',
		latlng: new kakao.maps.LatLng(35.846525, 127.152181)
	},
	{
		content: '<div>한국환경방역공사</div><br>063-252-6020',
		latlng: new kakao.maps.LatLng(35.835701, 127.130575)
	},
	{
		content: '<div>전주청소업체.이사청소</div><br>070-4594-0844',
		latlng: new kakao.maps.LatLng(35.841408, 127.134702)
	},
	{
		content: '<div>삼문개발</div><br>063-251-0611',
		latlng: new kakao.maps.LatLng(35.839101, 127.130905)
	},
	{
		content: '<div>이크린월드</div><br>063-246-8274',
		latlng: new kakao.maps.LatLng(35.849284, 127.151698)
	},
	{
		content: '<div>전곡환경</div><br>031-832-8278',
		latlng: new kakao.maps.LatLng(38.032732, 127.069913)
	},
	{
		content: '<div>현대청소</div><br>031-835-0456',
		latlng: new kakao.maps.LatLng(38.027046, 127.065064)
	},
	{
		content: '<div>현대청소</div><br>031-863-4104',
		latlng: new kakao.maps.LatLng(37.893507, 127.047819)
	},
	{
		content: '<div>평화입주청소</div><br>031-827-2474',
		latlng: new kakao.maps.LatLng(37.893421, 127.194732)
	},
	{
		content: '<div>해림청소써비스</div><br>031-535-5253',
		latlng: new kakao.maps.LatLng(37.896018, 127.189750)
	},
	{
		content: '<div>대성환경</div><br>031-534-4757',
		latlng: new kakao.maps.LatLng(37.890590, 127.197265)
	},
	{
		content: '<div>(주)갈산환경</div><br>031-536-3883',
		latlng: new kakao.maps.LatLng(37.993540, 127.315934)
	},
	{
		content: '<div>클린비아</div><br>010-7701-4369',
		latlng: new kakao.maps.LatLng(37.827801, 127.137627)
	},
	{
		content: '<div>신비클리닝</div><br>031-536-2241',
		latlng: new kakao.maps.LatLng(37.896534, 127.196172)
	},
	{
		content: '<div>청소닥터</div><br>063-465-2487',
		latlng: new kakao.maps.LatLng(35.971971, 126.702770)
	},
	{
		content: '<div>홈크린입주이사청소</div><br>063-446-0808',
		latlng: new kakao.maps.LatLng(35.956312, 126.713575)
	},
	{
		content: '<div>무지개청소</div><br>063-446-2833',
		latlng: new kakao.maps.LatLng(35.964958, 126.701800)
	},
	{
		content: '<div>청소달인</div><br>063-468-6610',
		latlng: new kakao.maps.LatLng(35.964222, 126.717459)
	},
	{
		content: '<div>청소대장</div><br>063-467-8279',
		latlng: new kakao.maps.LatLng(35.946044, 126.685596)
	},
	{
		content: '<div>청소작전</div><br>010-6709-8827',
		latlng: new kakao.maps.LatLng(35.965456, 126.737626)
	},
	{
		content: '<div>새만금청소</div><br>063-471-8337',
		latlng: new kakao.maps.LatLng(35.978756, 126.712638)
	},
	{
		content: '<div>새만금청소</div><br>063-442-0082',
		latlng: new kakao.maps.LatLng(35.972644, 126.708555)
	},
	{
		content: '<div>크린엔그린산업(주)</div><br>063-452-5543',
		latlng: new kakao.maps.LatLng(35.973290, 126.737356)
	},
	{
		content: '<div>로또청소박사</div><br>063-471-9200',
		latlng: new kakao.maps.LatLng(35.969727, 126.702640)
	},
	{
		content: '<div>선진환경</div><br>063-471-1458',
		latlng: new kakao.maps.LatLng(35.965696, 126.724220)
	},
	{
		content: '<div>한결청소</div><br>063-467-2502',
		latlng: new kakao.maps.LatLng(35.965696, 126.713611)
	},
	{
		content: '<div>대청환경개발</div><br>063-443-0718',
		latlng: new kakao.maps.LatLng(35.975860, 126.715848)
	},
	{
		content: '<div>(유한)호남산업개발</div><br>063-443-2703',
		latlng: new kakao.maps.LatLng(35.989643, 126.710002)
	},
	{
		content: '<div>(유한)가온누리</div><br>063-452-1102',
		latlng: new kakao.maps.LatLng(35.967565, 126.734253)
	},
	{
		content: '<div>세아위생환경</div><br>063-445-7411',
		latlng: new kakao.maps.LatLng(35.977554, 126.748038)
	},
	{
		content: '<div>최호KD산업</div><br>063-451-0036',
		latlng: new kakao.maps.LatLng(35.970544, 126.739088)
	},
	{
		content: '<div>청정환경개발</div><br>063-442-6321',
		latlng: new kakao.maps.LatLng(35.988658, 126.716809)
	},
	{
		content: '<div>신성기업</div><br>063-463-0670',
		latlng: new kakao.maps.LatLng(35.973726, 126.713977)
	},
	{
		content: '<div>호남기업</div><br>063-442-9900',
		latlng: new kakao.maps.LatLng(35.980741, 126.717839)
	},
	{
		content: '<div>크린토피아</div><br>063-462-8564',
		latlng: new kakao.maps.LatLng(35.967821, 126.697412)
	},
	{
		content: '<div>보미산업</div><br>063-461-3498',
		latlng: new kakao.maps.LatLng(35.973822, 126.720495)
	},
	{
		content: '<div>쇼파나라</div><br>063-463-2474',
		latlng: new kakao.maps.LatLng(35.977287, 126.705278)
	},
	{
		content: '<div>(유한)현대씨엔에스</div><br>063-65-0687',
		latlng: new kakao.maps.LatLng(35.976978, 126.703367)
	},
	{
		content: '<div>앤테크(유한)</div><br>063-442-4433',
		latlng: new kakao.maps.LatLng(35.984740, 126.713548)
	},
	{
		content: '<div>탑클린</div><br>063-542-0098',
		latlng: new kakao.maps.LatLng(35.796092, 126.897818)
	},
	{
		content: '<div>한결청소</div><br>063-546-1520',
		latlng: new kakao.maps.LatLng(35.808657, 126.895115)
	},
	{
		content: '<div>청소닥터</div><br>063-542-5524',
		latlng: new kakao.maps.LatLng(35.802984, 126.888634)
	},
	{
		content: '<div>(유한)효성공영개발</div><br>063-546-2134',
		latlng: new kakao.maps.LatLng(35.794073, 126.886188)
	},
	{
		content: '<div>탑클린</div><br>063-583-7081',
		latlng: new kakao.maps.LatLng(35.687573, 126.732581)
	},
	{
		content: '<div>청소닥터</div><br>063-581-7924',
		latlng: new kakao.maps.LatLng(35.735521, 126.688635)
	},
	{
		content: '<div>대한민국청소</div><br>031-859-4489',
		latlng: new kakao.maps.LatLng(37.892641, 127.054462)
	},
	{
		content: '<div>동두천환경</div><br>031-862-0287',
		latlng: new kakao.maps.LatLng(37.912312, 127.056182)
	},
	{
		content: '<div>리빙하우스</div><br>010-6398-2130',
		latlng: new kakao.maps.LatLng(37.937040, 127.050203)
	},
	{
		content: '<div>현대청소</div><br>031-863-4104',
		latlng: new kakao.maps.LatLng(37.893508, 127.047825)
	},
	{
		content: '<div>채움</div><br>031-866-0866',
		latlng: new kakao.maps.LatLng(37.908765, 127.056005)
	},
	{
		content: '<div>(주)유니클</div><br>031-862-1592',
		latlng: new kakao.maps.LatLng(37.902628, 127.059290)
	},
	{
		content: '<div>(주)미래환경</div><br>031-863-9998',
		latlng: new kakao.maps.LatLng(37.911412, 127.060037)
	},
	{
		content: '<div>함양방역공사</div><br>055-962-7194',
		latlng: new kakao.maps.LatLng(35.510980, 127.742000)
	},
	{
		content: '<div>깨끗한청소박사</div><br>031-934-0342',
		latlng: new kakao.maps.LatLng(37.762358, 126.774793)
	},
	{
		content: '<div>CH깔끄미크린하우스</div><br>031-941-9697',
		latlng: new kakao.maps.LatLng(37.773946, 126.750857)
	},
	{
		content: '<div>노원청소월드</div><br>031-817-1944',
		latlng: new kakao.maps.LatLng(37.736239, 126.825438)
	},
	{
		content: '<div>숲속공기 새집증후군 전문업체</div><br>010-8025-0339',
		latlng: new kakao.maps.LatLng(37.707248, 126.746305)
	},
	{
		content: '<div>(주)크린플러스</div><br>031-821-0029',
		latlng: new kakao.maps.LatLng(37.778217, 127.054213)
	},
	{
		content: '<div>미래환경산업</div><br>010-5851-5433',
		latlng: new kakao.maps.LatLng(37.798362, 127.045754)
	},
	{
		content: '<div>블루청소나라</div><br>031-877-1390',
		latlng: new kakao.maps.LatLng(37.793762, 127.004678)
	},
	{
		content: '<div>양천환경</div><br>031-866-4040',
		latlng: new kakao.maps.LatLng(37.854884, 127.089944)
	},
	{
		content: '<div>청소대장</div><br>031-874-5004',
		latlng: new kakao.maps.LatLng(37.735916, 127.049601)
	},
	{
		content: '<div>민락동입주이사청소</div><br>031-894-7370',
		latlng: new kakao.maps.LatLng(37.743031, 127.086082)
	},
	{
		content: '<div>금오동입주이사청소</div><br>031-894-7353',
		latlng: new kakao.maps.LatLng(37.753979, 127.071011)
	},
	{
		content: '<div>그린청소관리</div><br>031-851-3717',
		latlng: new kakao.maps.LatLng(37.738855, 127.091127)
	},
	{
		content: '<div>(주)미래하우징</div><br>031-841-0682',
		latlng: new kakao.maps.LatLng(37.742066, 127.046355)
	},
	{
		content: '<div>(주)진클리닝</div><br>031-848-0830',
		latlng: new kakao.maps.LatLng(37.744989, 127.050383)
	},
	{
		content: '<div>청소대행</div><br>031-816-0115',
		latlng: new kakao.maps.LatLng(37.635738, 126.846711)
	},
	{
		content: '<div>청소</div><br>031-813-0996',
		latlng: new kakao.maps.LatLng(37.618474, 126.852214)
	},
	{
		content: '<div>클린베스트</div><br>1577-1646',
		latlng: new kakao.maps.LatLng(37.682168, 126.785962)
	},
	{
		content: '<div>(주)선우</div><br>031-938-7500',
		latlng: new kakao.maps.LatLng(37.673724, 126.798906)
	},
	{
		content: '<div>경화환경</div><br>031-970-2662',
		latlng: new kakao.maps.LatLng(37.614762, 126.841197)
	},
	{
		content: '<div>고양위생공사</div><br>031-962-2027',
		latlng: new kakao.maps.LatLng(37.659711, 126.840183)
	},
	{
		content: '<div>워시맨(고양점)</div><br>031-973-6432',
		latlng: new kakao.maps.LatLng(37.619354, 126.828879)
	},
	{
		content: '<div>입주청소상가공장바닥/크린모든청소대행</div><br>031-8049-3397',
		latlng: new kakao.maps.LatLng(37.609840, 126.726302)
	},
	{
		content: '<div>친환경청소대행업</div><br>031-8049-0077',
		latlng: new kakao.maps.LatLng(37.610938, 126.724632)
	},
	{
		content: '<div>더스트제로</div><br>070-7773-6500',
		latlng: new kakao.maps.LatLng(37.644999, 126.706740)
	},
	{
		content: '<div>레오테크(주)</div><br>031-981-3345',
		latlng: new kakao.maps.LatLng(37.644647, 126.667099)
	},
	{
		content: '<div>키다리환경</div><br>1688-2546',
		latlng: new kakao.maps.LatLng(37.625204, 126.705854)
	},
	{
		content: '<div>일호개발</div><br>031-985-0562',
		latlng: new kakao.maps.LatLng(37.630209, 126.703974)
	},
	{
		content: '<div>마이크린</div><br>063-433-2688',
		latlng: new kakao.maps.LatLng(35.786135, 127.421709)
	},
	{
		content: '<div>경남위생관리용역</div><br>055-944-3811',
		latlng: new kakao.maps.LatLng(35.684848, 127.919528)
	},
	{
		content: '<div>(유한)거창늘푸른사람들</div><br>055-941-1396',
		latlng: new kakao.maps.LatLng(35.671598, 127.910939)
	},
	{
		content: '<div>창녕군청소대행업체</div><br>055-521-0910',
		latlng: new kakao.maps.LatLng(35.457525, 128.521712)
	},
	{
		content: '<div>(주)대교산업</div><br>055-532-0973',
		latlng: new kakao.maps.LatLng(35.580551, 128.512014)
	},
	{
		content: '<div>청소닥터</div><br>063-561-5624',
		latlng: new kakao.maps.LatLng(35.439291, 126.709905)
	},
	{
		content: '<div>탑크린</div><br>063-561-0977',
		latlng: new kakao.maps.LatLng(35.431802, 126.742781)
	},
	{
		content: '<div>덕일환경산업</div><br>063-564-0093',
		latlng: new kakao.maps.LatLng(35.428674, 126.699645)
	},
	{
		content: '<div>깨끗한환경</div><br>063-564-6623',
		latlng: new kakao.maps.LatLng(35.433424, 126.699028)
	},
	{
		content: '<div>정일깔끔이쇼파카페트입주청소</div><br>063-561-3350',
		latlng: new kakao.maps.LatLng(35.538007, 126.612393)
	},
	{
		content: '<div>녹색환경</div><br>063-564-5677',
		latlng: new kakao.maps.LatLng(35.436645, 126.706474)
	},
	{
		content: '<div>영광환경산업</div><br>061-353-4110',
		latlng: new kakao.maps.LatLng(35.276744, 126.498625)
	},
	{
		content: '<div>남원청소용역</div><br>063-633-2121',
		latlng: new kakao.maps.LatLng(35.422249, 127.392209)
	},
	{
		content: '<div>백마청소</div><br>063-626-2472',
		latlng: new kakao.maps.LatLng(35.409838, 127.384486)
	},
	{
		content: '<div>새하얀청소방역</div><br>063-625-0168',
		latlng: new kakao.maps.LatLng(35.407547, 127.383956)
	},
	{
		content: '<div>그린청소용역</div><br>063-633-5414',
		latlng: new kakao.maps.LatLng(35.397830, 127.379463)
	},
	{
		content: '<div>남원청소마을</div><br>063-636-3858',
		latlng: new kakao.maps.LatLng(35.414130, 127.391822)
	},
	{
		content: '<div>하나로방역&하나로환경</div><br>061-324-5222',
		latlng: new kakao.maps.LatLng(35.064725, 126.520905)
	},
	{
		content: '<div>미드미크리닝</div><br>010-3333-7273',
		latlng: new kakao.maps.LatLng(37.398319, 126.984636)
	},
	{
		content: '<div>안양청소업체</div><br>031-360-0183',
		latlng: new kakao.maps.LatLng(37.371762, 126.905047)
	},
	{
		content: '<div>행운청소업체</div><br>031-381-0189',
		latlng: new kakao.maps.LatLng(37.406996, 126.955547)
	},
	{
		content: '<div>하얀청소</div><br>031-444-8507',
		latlng: new kakao.maps.LatLng(37.407800, 126.949919)
	},
	{
		content: '<div>청소대행</div><br>031-424-6882',
		latlng: new kakao.maps.LatLng(37.404269, 126.966360)
	},
	{
		content: '<div>동아환경방역공사</div><br>031-442-8007',
		latlng: new kakao.maps.LatLng(37.407255, 126.972983)
	},
	{
		content: '<div>건일스팀청소</div><br>031-386-5469',
		latlng: new kakao.maps.LatLng(37.410141, 126.973558)
	},
	{
		content: '<div>다니엘청소대행</div><br>031-360-7028',
		latlng: new kakao.maps.LatLng(37.391026, 126.976473)
	},
	{
		content: '<div>깔끔한청소대행</div><br>031-450-0405',
		latlng: new kakao.maps.LatLng(37.387531, 126.959082)
	},
	{
		content: '<div>정우기업</div><br>031-441-2191',
		latlng: new kakao.maps.LatLng(37.390590, 126.925903)
	},
	{
		content: '<div>(주)안양위생</div><br>031-468-2861',
		latlng: new kakao.maps.LatLng(37.408108, 126.914018)
	},
	{
		content: '<div>서울종합관리</div><br>02-895-9113',
		latlng: new kakao.maps.LatLng(37.413174, 126.909007)
	},
	{
		content: '<div>(주)지텍</div><br>031-425-0801',
		latlng: new kakao.maps.LatLng(37.379586, 126.972140)
	},
	{
		content: '<div>중앙산업</div><br>031-425-0454',
		latlng: new kakao.maps.LatLng(37.391807, 126.983855)
	},
	{
		content: '<div>(주)빌케어코리아</div><br>02-2051-4348',
		latlng: new kakao.maps.LatLng(37.361854, 126.969093)
	},
	{
		content: '<div>푸른크리닝</div><br>010-2433-4565',
		latlng: new kakao.maps.LatLng(37.344692, 126.968310)
	},
	{
		content: '<div>일사천리환경</div><br>031-429-1516',
		latlng: new kakao.maps.LatLng(37.347483, 126.974926)
	},
	{
		content: '<div>세진토탈크리닝</div><br>031-399-9100',
		latlng: new kakao.maps.LatLng(37.362875, 126.923209)
	},
	{
		content: '<div>닥트청소서비스</div><br>031-477-6820',
		latlng: new kakao.maps.LatLng(37.360887, 126.937106)
	},
	{
		content: '<div>한일정화</div><br>031-451-3334',
		latlng: new kakao.maps.LatLng(37.361447, 126.946419)
	},
	{
		content: '<div>(주)오케이종합관리</div><br>031-458-4977',
		latlng: new kakao.maps.LatLng(37.354121, 126.944833)
	},
	{
		content: '<div>초록환경개발</div><br>031-427-0181',
		latlng: new kakao.maps.LatLng(37.342016, 126.949021)
	},
	{
		content: '<div>(주)굿모닝에어월드</div><br>031-491-8587',
		latlng: new kakao.maps.LatLng(37.351668, 126.734552)
	},
	{
		content: '<div>깨끗한청소박사</div><br>031-497-4030',
		latlng: new kakao.maps.LatLng(37.347338, 126.754385)
	},
	{
		content: '<div>(주)동아환경방역공사</div><br>031-315-8977',
		latlng: new kakao.maps.LatLng(37.416908, 126.812885)
	},
	{
		content: '<div>(주)양지공사</div><br>031-480-3572',
		latlng: new kakao.maps.LatLng(37.374558, 126.877027)
	},
	{
		content: '<div>가능환경</div><br>031-406-3900',
		latlng: new kakao.maps.LatLng(37.316280, 126.861565)
	},
	{
		content: '<div>청소대장안산지점</div><br>031-501-7040',
		latlng: new kakao.maps.LatLng(37.301221, 126.900759)
	},
	{
		content: '<div>건일스팀청소</div><br>031-362-5469',
		latlng: new kakao.maps.LatLng(37.292021, 126.868090)
	},
	{
		content: '<div>그린산업</div><br>031-362-5886',
		latlng: new kakao.maps.LatLng(37.308333, 126.837257)
	},
	{
		content: '<div>안산청소</div><br>031-8042-6673',
		latlng: new kakao.maps.LatLng(37.328299, 126.838940)
	},
	{
		content: '<div>깔끄미</div><br>031-493-7440',
		latlng: new kakao.maps.LatLng(37.329078, 126.803783)
	},
	{
		content: '<div>좋은청소</div><br>031-362-6798',
		latlng: new kakao.maps.LatLng(37.342842, 126.821560)
	},
	{
		content: '<div>청소박사</div><br>031-224-3104',
		latlng: new kakao.maps.LatLng(37.256781, 127.034136)
	},
	{
		content: '<div>이사/입주청소 라이트클린</div><br>010-8098-5482',
		latlng: new kakao.maps.LatLng(37.268215, 127.042353)
	},
	{
		content: '<div>이룸청소박사</div><br>031-244-8784',
		latlng: new kakao.maps.LatLng(37.270300, 127.022661)
	},
	{
		content: '<div>미래크린나라</div><br>031-898-8551',
		latlng: new kakao.maps.LatLng(37.249026, 127.013510)
	},
	{
		content: '<div>청솔환경</div><br>031-245-2557',
		latlng: new kakao.maps.LatLng(37.290558, 127.005096)
	},
	{
		content: '<div>동방씨엔스청소대행(주)</div><br>031-202-5680',
		latlng: new kakao.maps.LatLng(37.265243, 127.071306)
	},
	{
		content: '<div>남양환경</div><br>031-357-7766',
		latlng: new kakao.maps.LatLng(37.209018, 126.817656)
	},
	{
		content: '<div>OK크린</div><br>031-354-9780',
		latlng: new kakao.maps.LatLng(37.170351, 126.876211)
	},
	{
		content: '<div>크린스파크</div><br>010-8220-4606',
		latlng: new kakao.maps.LatLng(37.203846, 127.072193)
	},
	{
		content: '<div>천사크린(주)</div><br>031-224-8285',
		latlng: new kakao.maps.LatLng(37.215171, 126.975096)
	},
	{
		content: '<div>광명크리닝</div><br>031-662-9965',
		latlng: new kakao.maps.LatLng(37.056806, 127.048229)
	},
	{
		content: '<div>(주)엠그린</div><br>031-655-1518',
		latlng: new kakao.maps.LatLng(37.002291, 127.075253)
	},
	{
		content: '<div>한국TSI</div><br>031-653-0721',
		latlng: new kakao.maps.LatLng(37.002053, 127.091490)
	},
	{
		content: '<div>크린하우스</div><br>010-2235-6491',
		latlng: new kakao.maps.LatLng(36.988490, 127.100050)
	},
	{
		content: '<div>(주)명진</div><br>031-618-5541',
		latlng: new kakao.maps.LatLng(36.999533, 127.169220)
	},
	{
		content: '<div>(주)엠테에스</div><br>031-657-8316',
		latlng: new kakao.maps.LatLng(36.998901, 127.169762)
	},
	{
		content: '<div>허브상사</div><br>031-671-2950',
		latlng: new kakao.maps.LatLng(36.986144, 127.265668)
	},
	{
		content: '<div>안성청소전문업체</div><br>031-676-3988',
		latlng: new kakao.maps.LatLng(37.005582, 127.272180)
	},
	{
		content: '<div>(주)늘푸른코리아</div><br>031-675-7202',
		latlng: new kakao.maps.LatLng(37.009138, 127.283683)
	},
	{
		content: '<div>크린원</div><br>031-638-2018',
		latlng: new kakao.maps.LatLng(37.282039, 127.449394)
	},
	{
		content: '<div>엘림홈크리닝</div><br>031-631-3306',
		latlng: new kakao.maps.LatLng(37.282149, 127.436853)
	},
	{
		content: '<div>태진</div><br>031-635-0155',
		latlng: new kakao.maps.LatLng(37.284940, 127.439407)
	},
	{
		content: '<div>에이스코리아</div><br>031-631-3640',
		latlng: new kakao.maps.LatLng(37.278138, 127.436879)
	},
	{
		content: '<div>반짝반짝홈크리닝</div><br>031-637-9353',
		latlng: new kakao.maps.LatLng(37.259871, 127.430913)
	},
	{
		content: '<div>하나TDS</div><br>031-884-9914',
		latlng: new kakao.maps.LatLng(37.299855, 127.629019)
	},
	{
		content: '<div>청소박사</div><br>055-744-8274',
		latlng: new kakao.maps.LatLng(35.191699, 128.091679)
	},
	{
		content: '<div>진주용역</div><br>055-742-9067',
		latlng: new kakao.maps.LatLng(35.196047, 128.072625)
	},
	{
		content: '<div>싹싹한청소</div><br>055-743-7708',
		latlng: new kakao.maps.LatLng(35.183842, 128.073741)
	},
	{
		content: '<div>으뜸청소나라</div><br>055-752-8163',
		latlng: new kakao.maps.LatLng(35.181597, 128.117171)
	},
	{
		content: '<div>크린하우스</div><br>055-763-7402',
		latlng: new kakao.maps.LatLng(35.183772, 128.070479)
	},
	{
		content: '<div>진주환경(주)</div><br>055-752-5933',
		latlng: new kakao.maps.LatLng(35.172968, 128.105498)
	},
	{
		content: '<div>한샘청소대행</div><br>055-745-5207',
		latlng: new kakao.maps.LatLng(35.195065, 128.091937)
	},
	{
		content: '<div>(주)경남환경 중앙지구 사무소</div><br>055-742-6800',
		latlng: new kakao.maps.LatLng(35.197520, 128.077432)
	},
	{
		content: '<div>으뜸청소나라</div><br>055-747-8047',
		latlng: new kakao.maps.LatLng(35.183622, 128.070395)
	},
	{
		content: '<div>영진청소</div><br>055-761-0416',
		latlng: new kakao.maps.LatLng(35.184464, 128.112280)
	},
	{
		content: '<div>대신환경</div><br>055-763-4040',
		latlng: new kakao.maps.LatLng(35.185166, 128.080008)
	},
	{
		content: '<div>인력인력용역공사</div><br>055-748-4225',
		latlng: new kakao.maps.LatLng(35.191268, 128.068163)
	},
	{
		content: '<div>탑환경</div><br>055-748-4225',
		latlng: new kakao.maps.LatLng(35.193443, 128.084299)
	},
	{
		content: '<div>늘푸른사람들</div><br>055-746-0179',
		latlng: new kakao.maps.LatLng(35.182430, 128.110821)
	},
	{
		content: '<div>(주)세스코</div><br>055-755-1011',
		latlng: new kakao.maps.LatLng(35.164890, 128.116658)
	},
	{
		content: '<div>깨끗한나라</div><br>055-748-4354',
		latlng: new kakao.maps.LatLng(35.150996, 128.101895)
	},
	{
		content: '<div>서경개발</div><br>055-747-6956',
		latlng: new kakao.maps.LatLng(35.186148, 128.073914)
	},
	{
		content: '<div>서부용역</div><br>055-745-8013',
		latlng: new kakao.maps.LatLng(35.197682, 128.075049)
	},
	{
		content: '<div>깔끔이</div><br>055-748-0902',
		latlng: new kakao.maps.LatLng(35.185758, 128.088610)
	},
	{
		content: '<div>하얀나라</div><br>055-763-7404',
		latlng: new kakao.maps.LatLng(35.174325, 128.101385)
	},
	{
		content: '<div>새마을환경(주)</div><br>055-602-4982',
		latlng: new kakao.maps.LatLng(35.188508, 128.113633)
	},
	{
		content: '<div>조은환경</div><br>055-755-7482',
		latlng: new kakao.maps.LatLng(35.187340, 128.119043)
	},
	{
		content: '<div>(주)경남환경</div><br>055-761-8083',
		latlng: new kakao.maps.LatLng(35.171405, 128.121391)
	},
	{
		content: '<div>새누리환경개발(주)</div><br>055-762-7414',
		latlng: new kakao.maps.LatLng(35.186255, 128.094750)
	},
	{
		content: '<div>새누리환경개발(주)</div><br>055-762-7480',
		latlng: new kakao.maps.LatLng(35.194013, 128.130883)
	},
	{
		content: '<div>까치청소</div><br>010-5754-7709',
		latlng: new kakao.maps.LatLng(35.200352, 128.069743)
	},
	{
		content: '<div>서광건축</div><br>055-755-8949',
		latlng: new kakao.maps.LatLng(35.160808, 128.109755)
	},
	{
		content: '<div>꼼꼼이기획</div><br>055-761-2408',
		latlng: new kakao.maps.LatLng(35.184670, 128.112102)
	},
	{
		content: '<div>승하환경관리</div><br>055-758-6420',
		latlng: new kakao.maps.LatLng(35.182585, 128.104651)
	},
	{
		content: '<div>화이트 진주 주약점</div><br>055-761-9384',
		latlng: new kakao.maps.LatLng(35.172573, 128.093526)
	},
	{
		content: '<div>사천환경산업</div><br>055-835-4477',
		latlng: new kakao.maps.LatLng(34.929819, 128.084784)
	},
	{
		content: '<div>청소세상</div><br>055-855-9422',
		latlng: new kakao.maps.LatLng(35.085946, 128.087390)
	},
	{
		content: '<div>영광청소용역</div><br>055-835-1751',
		latlng: new kakao.maps.LatLng(34.931835, 128.068379)
	},
	{
		content: '<div>깨끗한나라</div><br>055-855-4354',
		latlng: new kakao.maps.LatLng(35.082208, 128.086061)
	},
	{
		content: '<div>아른건업</div><br>055-854-0084',
		latlng: new kakao.maps.LatLng(35.072241, 128.077079)
	},
	{
		content: '<div>푸른환경</div><br>055-852-2770',
		latlng: new kakao.maps.LatLng(35.068307, 128.078796)
	},
	{
		content: '<div>청우기업(주)</div><br>055-852-2949',
		latlng: new kakao.maps.LatLng(35.068167, 128.062317)
	},
	{
		content: '<div>다모아</div><br>055-832-5493',
		latlng: new kakao.maps.LatLng(34.946778, 128.088405)
	},
	{
		content: '<div>(주)밀양광무개발</div><br>055-356-3566',
		latlng: new kakao.maps.LatLng(35.503082, 128.743850)
	},
	{
		content: '<div>방역공사</div><br>055-356-4665',
		latlng: new kakao.maps.LatLng(35.501268, 128.744011)
	},
	{
		content: '<div>새누리환경개발(주)</div><br>055-356-9222',
		latlng: new kakao.maps.LatLng(35.502172, 128.741553)
	},
	{
		content: '<div>한성개발</div><br>055-356-6658',
		latlng: new kakao.maps.LatLng(35.504618, 128.740437)
	},
	{
		content: '<div>조인컨설팅</div><br>055-353-5384',
		latlng: new kakao.maps.LatLng(35.563738, 128.798455)
	},
	{
		content: '<div>쓰레기종말처리장</div><br>055-356-4623',
		latlng: new kakao.maps.LatLng(35.483816, 128.753682)
	},
	{
		content: '<div>태영에코프랜비</div><br>054-374-9243',
		latlng: new kakao.maps.LatLng(35.650091, 128.727004)
	},
	{
		content: '<div>크린뭴</div><br>054-371-0682',
		latlng: new kakao.maps.LatLng(35.653450, 128.705314)
	},
	{
		content: '<div>청태영</div><br>054-371-1924',
		latlng: new kakao.maps.LatLng(35.649966, 128.753491)
	},
	{
		content: '<div>필성용역</div><br>055-584-9547',
		latlng: new kakao.maps.LatLng(35.276069, 128.409380)
	},
	{
		content: '<div>7080청소업체</div><br>052-246-4425',
		latlng: new kakao.maps.LatLng(35.563383, 129.325504)
	},
	{
		content: '<div>칠공팔공청소업체</div><br>052-708-7088',
		latlng: new kakao.maps.LatLng(35.548602, 129.353267)
	},
	{
		content: '<div>클린앤크리너</div><br>052-265-7479',
		latlng: new kakao.maps.LatLng(35.538304, 129.307131)
	},
	{
		content: '<div>청소전문업체 부경</div><br>052-245-7470',
		latlng: new kakao.maps.LatLng(35.576169, 129.316521)
	},
	{
		content: '<div>청소하는사람들</div><br>052-260-7743',
		latlng: new kakao.maps.LatLng(35.531991, 129.314480)
	},
	{
		content: '<div>현대그린청소용역</div><br>052-258-8040',
		latlng: new kakao.maps.LatLng(35.538636, 129.302640)
	},
	{
		content: '<div>새울산개발유통</div><br>052-227-3633',
		latlng: new kakao.maps.LatLng(35.547772, 129.331832)
	},
	{
		content: '<div>청소하는사람들</div><br>052-293-7756',
		latlng: new kakao.maps.LatLng(35.569361, 129.347347)
	},
	{
		content: '<div>클린앤크리너</div><br>052-296-7477',
		latlng: new kakao.maps.LatLng(35.566704, 129.325912)
	},
	{
		content: '<div>클린앤크리너</div><br>052-282-0345',
		latlng: new kakao.maps.LatLng(35.636398, 129.361523)
	},
	{
		content: '<div>청소하는사람들</div><br>052-248-7754',
		latlng: new kakao.maps.LatLng(35.588518, 129.309558)
	},
	{
		content: '<div>남구가사원</div><br>052-258-0708',
		latlng: new kakao.maps.LatLng(35.544772, 129.310960)
	},
	{
		content: '<div>핸드페어 울산우정점</div><br>052-248-7944',
		latlng: new kakao.maps.LatLng(35.564603, 129.315423)
	},
	{
		content: '<div>스팀지니용역</div><br>052-297-9136',
		latlng: new kakao.maps.LatLng(35.555666, 129.348726)
	},
	{
		content: '<div>명품청소박사</div><br>052-211-5818',
		latlng: new kakao.maps.LatLng(35.571079, 129.224353)
	},
	{
		content: '<div>종합청소개발</div><br>052-274-4438',
		latlng: new kakao.maps.LatLng(35.545414, 129.329758)
	},
	{
		content: '<div>세스코울산지사</div><br>052-222-1181',
		latlng: new kakao.maps.LatLng(35.556988, 129.255065)
	},
	{
		content: '<div>청소하는사람들</div><br>052-285-0456',
		latlng: new kakao.maps.LatLng(35.630318, 129.362631)
	},
	{
		content: '<div>한국종합환경</div><br>052-260-2847',
		latlng: new kakao.maps.LatLng(35.544102, 129.315780)
	},
	{
		content: '<div>월드크린</div><br>052-277-2388',
		latlng: new kakao.maps.LatLng(35.550746, 129.265878)
	},
	{
		content: '<div>일정청소마당</div><br>052-248-5565',
		latlng: new kakao.maps.LatLng(35.578570, 129.246766)
	},
	{
		content: '<div>일정청소마당</div><br>052-263-5556',
		latlng: new kakao.maps.LatLng(35.576044, 129.119214)
	},
	{
		content: '<div>평화방역</div><br>052-242-1177',
		latlng: new kakao.maps.LatLng(35.559770, 129.296409)
	},
	{
		content: '<div>(주)삼정기업</div><br>052-274-2820',
		latlng: new kakao.maps.LatLng(35.543826, 129.337645)
	},
	{
		content: '<div>청소사랑</div><br>052-295-7477',
		latlng: new kakao.maps.LatLng(35.570730, 129.325805)
	},
	{
		content: '<div>(주)신의개발</div><br>052-229-1915',
		latlng: new kakao.maps.LatLng(35.538438, 129.327606)
	},
	{
		content: '<div>아름다운청소</div><br>052-222-5141',
		latlng: new kakao.maps.LatLng(35.556610, 129.325421)
	},
	{
		content: '<div>경남방역공사</div><br>052-281-0555',
		latlng: new kakao.maps.LatLng(35.572310, 129.336589)
	},
	{
		content: '<div>우렁각시</div><br>052-258-7485',
		latlng: new kakao.maps.LatLng(35.543080, 129.306728)
	},
	{
		content: '<div>강남건업</div><br>052-265-8257',
		latlng: new kakao.maps.LatLng(35.532215, 129.313769)
	},
	{
		content: '<div>신풍종합환경</div><br>052-265-6330',
		latlng: new kakao.maps.LatLng(35.543192, 129.305576)
	},
	{
		content: '<div>경일환경</div><br>052-258-1739',
		latlng: new kakao.maps.LatLng(35.541586, 129.321712)
	},
	{
		content: '<div>그린산업</div><br>052-211-0182',
		latlng: new kakao.maps.LatLng(35.554435, 129.303087)
	},
	{
		content: '<div>남울산가사원</div><br>052-225-5955',
		latlng: new kakao.maps.LatLng(35.554028, 129.260847)
	},
	{
		content: '<div>일정청소마당</div><br>052-700-5557',
		latlng: new kakao.maps.LatLng(35.598858, 129.364754)
	},
	{
		content: '<div>(주)가름</div><br>052-265-8770',
		latlng: new kakao.maps.LatLng(35.545391, 129.340666)
	},
	{
		content: '<div>일정청소마당</div><br>052-248-5595',
		latlng: new kakao.maps.LatLng(35.558180, 129.312086)
	},
	{
		content: '<div>그린깔끔이</div><br>052-266-5455',
		latlng: new kakao.maps.LatLng(35.564989, 129.328009)
	},
	{
		content: '<div>그린깔끔이</div><br>052-700-5355',
		latlng: new kakao.maps.LatLng(35.539887, 129.325902)
	},
	{
		content: '<div>삼진공사</div><br>052-265-3020',
		latlng: new kakao.maps.LatLng(35.528153, 129.342210)
	},
	{
		content: '<div>순수공간</div><br>052-260-7578',
		latlng: new kakao.maps.LatLng(35.537792, 129.344613)
	},
	{
		content: '<div>일정청소마당</div><br>052-700-5552',
		latlng: new kakao.maps.LatLng(35.503167, 129.411497)
	},
	{
		content: '<div>육해공환경산업</div><br>052-277-8208',
		latlng: new kakao.maps.LatLng(35.587252, 129.322731)
	},
	{
		content: '<div>녹색환경(주)</div><br>052-296-5774',
		latlng: new kakao.maps.LatLng(35.563343, 129.328447)
	},
	{
		content: '<div>(주)청평</div><br>052-291-1341',
		latlng: new kakao.maps.LatLng(35.577955, 129.348861)
	},
	{
		content: '<div>대성크린텍</div><br>052-227-0900',
		latlng: new kakao.maps.LatLng(35.547067, 129.254548)
	},
	{
		content: '<div>삼정개발(주)</div><br>052-257-5878',
		latlng: new kakao.maps.LatLng(35.527197, 129.345713)
	},
	{
		content: '<div>하이진아이엔씨</div><br>052-244-1725',
		latlng: new kakao.maps.LatLng(35.559889, 129.318159)
	},
	{
		content: '<div>굿모닝에어월드</div><br>052-265-3711',
		latlng: new kakao.maps.LatLng(35.650699, 129.354237)
	},
	{
		content: '<div>고려산업지원(주)</div><br>052-227-5002',
		latlng: new kakao.maps.LatLng(35.552159, 129.321964)
	},
	{
		content: '<div>남울산가사원</div><br>052-246-5955',
		latlng: new kakao.maps.LatLng(35.559142, 129.312695)
	},
	{
		content: '<div>(주)한영</div><br>052-258-7060',
		latlng: new kakao.maps.LatLng(35.522825, 129.351490)
	},
	{
		content: '<div>화인테크</div><br>052-227-0738',
		latlng: new kakao.maps.LatLng(35.562326, 129.330536)
	},
	{
		content: '<div>(주)덕일산업</div><br>052-281-7077',
		latlng: new kakao.maps.LatLng(35.561110, 129.330610)
	},
	{
		content: '<div>대덕기공</div><br>052-268-6959',
		latlng: new kakao.maps.LatLng(35.537814, 129.300041)
	},
	{
		content: '<div>비엔에프테크(주)</div><br>052-260-7264',
		latlng: new kakao.maps.LatLng(35.639013, 129.152738)
	},
	{
		content: '<div>부산입주청소</div><br>010-9654-1841',
		latlng: new kakao.maps.LatLng(35.224481, 129.095187)
	},
	{
		content: '<div>청소대행</div><br>051-752-2250',
		latlng: new kakao.maps.LatLng(35.175176, 129.118283)
	},
	{
		content: '<div>부산홈크리닝</div><br>051-525-7758',
		latlng: new kakao.maps.LatLng(35.195704, 129.133295)
	},
	{
		content: '<div>입주청소전문</div><br>051-746-9227',
		latlng: new kakao.maps.LatLng(35.167388, 129.157546)
	},
	{
		content: '<div>태화청소용역</div><br>051-338-9338',
		latlng: new kakao.maps.LatLng(35.224550, 129.006789)
	},
	{
		content: '<div>모든청소대행</div><br>051-863-1109',
		latlng: new kakao.maps.LatLng(35.173031, 129.087646)
	},
	{
		content: '<div>부산청소</div><br>010-3151-1616',
		latlng: new kakao.maps.LatLng(35.172750, 129.087785)
	},
	{
		content: '<div>청소용역</div><br>051-753-8244',
		latlng: new kakao.maps.LatLng(35.136404, 129.084443)
	},
	{
		content: '<div>매일청소</div><br>051-753-8244',
		latlng: new kakao.maps.LatLng(35.198289, 129.088048)
	},
	{
		content: '<div>부산환경</div><br>051-624-8464',
		latlng: new kakao.maps.LatLng(35.131631, 129.087704)
	},
	{
		content: '<div>모든청소대행</div><br>051-752-0356',
		latlng: new kakao.maps.LatLng(35.175561, 129.098691)
	},
	{
		content: '<div>신진청소용역</div><br>051-868-0655',
		latlng: new kakao.maps.LatLng(35.175982, 129.094399)
	},
	{
		content: '<div>대신청소대행</div><br>051-522-8839',
		latlng: new kakao.maps.LatLng(35.200393, 129.110020)
	},
	{
		content: '<div>해운대청소용역</div><br>051-747-8944',
		latlng: new kakao.maps.LatLng(35.128963, 129.088391)
	},
	{
		content: '<div>청소특공대 부산수영구지사</div><br>1833-7985',
		latlng: new kakao.maps.LatLng(35.143135, 129.110842)
	},
	{
		content: '<div>청소하는날</div><br>051-501-7482',
		latlng: new kakao.maps.LatLng(35.202866, 129.062046)
	},
	{
		content: '<div>대호환경청소용역</div><br>051-527-0739',
		latlng: new kakao.maps.LatLng(35.203262, 129.102346)
	},
	{
		content: '<div>대신청소대행</div><br>051-865-8839',
		latlng: new kakao.maps.LatLng(35.195327, 129.082196)
	},
	{
		content: '<div>두손청소환경</div><br>051-710-0234',
		latlng: new kakao.maps.LatLng(35.168144, 129.062775)
	},
	{
		content: '<div>대신청소대행</div><br>051-759-8839',
		latlng: new kakao.maps.LatLng(35.174097, 129.115940)
	},
	{
		content: '<div>개미청소</div><br>051-626-3550',
		latlng: new kakao.maps.LatLng(35.141547, 129.105987)
	},
	{
		content: '<div>개미청소</div><br>051-556-8555',
		latlng: new kakao.maps.LatLng(35.201279, 129.098704)
	},
	{
		content: '<div>푸른청소</div><br>051-782-1129',
		latlng: new kakao.maps.LatLng(35.200684, 129.130749)
	},
	{
		content: '<div>개미청소</div><br>051-303-7177',
		latlng: new kakao.maps.LatLng(35.155442, 128.997713)
	},
	{
		content: '<div>스피드청소</div><br>051-635-4430',
		latlng: new kakao.maps.LatLng(35.138371, 129.100646)
	},
	{
		content: '<div>그린청소용역</div><br>051-622-5505',
		latlng: new kakao.maps.LatLng(35.152068, 129.110114)
	},
	{
		content: '<div>스피드청소</div><br>051-757-4430',
		latlng: new kakao.maps.LatLng(35.158022, 129.112784)
	},
	{
		content: '<div>하우스크리닝닥터</div><br>051-302-9802',
		latlng: new kakao.maps.LatLng(35.125306, 128.973102)
	},
	{
		content: '<div>부산환경</div><br>051-625-3536',
		latlng: new kakao.maps.LatLng(35.135936, 129.086786)
	},
	{
		content: '<div>청소박사</div><br>051-781-4146',
		latlng: new kakao.maps.LatLng(35.195346, 129.124756)
	},
	{
		content: '<div>개미청소</div><br>051-756-5554',
		latlng: new kakao.maps.LatLng(35.152003, 129.103167)
	},
	{
		content: '<div>미경청소</div><br>051-323-5635',
		latlng: new kakao.maps.LatLng(35.198727, 128.985667)
	},
	{
		content: '<div>스피드청소</div><br>051-784-2282',
		latlng: new kakao.maps.LatLng(35.185112, 129.123015)
	},
	{
		content: '<div>대신청소대행</div><br>051-343-8839',
		latlng: new kakao.maps.LatLng(35.217520, 129.016935)
	},
	{
		content: '<div>명품깔끔이청소나라</div><br>051-851-8030',
		latlng: new kakao.maps.LatLng(35.178523, 129.096242)
	},
	{
		content: '<div>두손청소환경</div><br>051-791-0123',
		latlng: new kakao.maps.LatLng(35.184517, 129.123403)
	},
	{
		content: '<div>깔끔한청소나라</div><br>051-804-7482',
		latlng: new kakao.maps.LatLng(35.164324, 129.040267)
	},
	{
		content: '<div>현대용역</div><br>051-851-0950',
		latlng: new kakao.maps.LatLng(35.182599, 129.081113)
	},
	{
		content: '<div>굿모닝크린</div><br>051-806-0404',
		latlng: new kakao.maps.LatLng(35.163838, 129.065812)
	},
	{
		content: '<div>청소부대</div><br>051-897-3200',
		latlng: new kakao.maps.LatLng(35.170446, 129.042283)
	},
	{
		content: '<div>삼화환경산업</div><br>051-805-6501',
		latlng: new kakao.maps.LatLng(35.162658, 129.058739)
	},
	{
		content: '<div>엘씨종합환경</div><br>051-809-1268',
		latlng: new kakao.maps.LatLng(35.174340, 129.055419)
	},
	{
		content: '<div>나라개발(주)</div><br>051-868-3753',
		latlng: new kakao.maps.LatLng(35.182363, 129.078948)
	},
	{
		content: '<div>신광환경</div><br>051-331-6090',
		latlng: new kakao.maps.LatLng(35.196991, 129.008794)
	},
	{
		content: '<div>(주)비엔비서비스</div><br>051-558-3717',
		latlng: new kakao.maps.LatLng(35.202299, 129.090352)
	},
	{
		content: '<div>(주)휘영</div><br>051-802-0395',
		latlng: new kakao.maps.LatLng(35.160410, 129.060943)
	},
	{
		content: '<div>좋은개발</div><br>051-554-5775',
		latlng: new kakao.maps.LatLng(35.211758, 129.069527)
	},
	{
		content: '<div>청소하는 아빠들이 뭉쳤다</div><br>010-5730-8270',
		latlng: new kakao.maps.LatLng(35.206007, 129.062317)
	},
	{
		content: '<div>성진청소산업</div><br>051-553-1924',
		latlng: new kakao.maps.LatLng(35.198573, 129.084804)
	},
	{
		content: '<div>굿모닝크린</div><br>051-305-0433',
		latlng: new kakao.maps.LatLng(35.191441, 128.989854)
	},
];

for (var i = 0; i < positions.length; i ++) {
// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: positions[i].latlng // 마커의 위치
});

// 마커에 표시할 인포윈도우를 생성합니다 
var infowindow = new kakao.maps.InfoWindow({
    content: positions[i].content // 인포윈도우에 표시할 내용
});

// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
// 이벤트 리스너로는 클로저를 만들어 등록합니다 
// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
return function() {
    infowindow.open(map, marker);
};
}

//인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
return function() {
    infowindow.close();
};
}

/* 아래와 같이도 할 수 있습니다 */
/*
for (var i = 0; i < positions.length; i ++) {
// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: positions[i].latlng // 마커의 위치
});

// 마커에 표시할 인포윈도우를 생성합니다 
var infowindow = new kakao.maps.InfoWindow({
    content: positions[i].content // 인포윈도우에 표시할 내용
});

// 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
// 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
(function(marker, infowindow) {
    // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
    kakao.maps.event.addListener(marker, 'mouseover', function() {
        infowindow.open(map, marker);
    });

    // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
    kakao.maps.event.addListener(marker, 'mouseout', function() {
        infowindow.close();
    });
})(marker, infowindow);
}
*/
</script>
