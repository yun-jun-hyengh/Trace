<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.carousel-item {
  height: 65vh;
  min-height: 350px;
  background: no-repeat center center scroll;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
#floatMenu{
	position : absolute;
	width : 100px;
	height : 229px;
	right : 150px;
	top : 70px;
	background-color : #0000FF;
	color : #fff;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>jajangso</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <!-- Masthead-->
        
        <header class="masthead text-white text-center">
           <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
      <!-- Slide One - Set the background image for this slide in the line below -->
      <div class="carousel-item active" style="background-image: url('https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80')">
        <div class="carousel-caption d-none d-md-block">
          <h3 class="display-4">자취생저장소</h3>
          <p class="lead">처음 오신분들 환영합니다.</p>
        </div>
      </div>
      <!-- Slide Two - Set the background image for this slide in the line below -->
      <div class="carousel-item" style="background-image: url('https://cdn.pixabay.com/photo/2019/05/28/00/14/breakfast-4234067_960_720.jpg')">
        <div class="carousel-caption d-none d-md-block">
          <h3 class="display-4">꿀 Tip!</h3>
          <p class="lead">Cook & Interior.</p>
        </div>
      </div>
      <!-- Slide Three - Set the background image for this slide in the line below -->
      <div class="carousel-item" style="background-image: url('https://picjumbo.com/wp-content/uploads/pumpkin-soup-2210x1473.jpg')">
        <div class="carousel-caption d-none d-md-block">
          <h3 class="display-4">My Life</h3>
          <p class="lead">홈페이지를 통해서 꾸며봅시다.</p>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
  </div>
       	
 	</header>
        
        <!-- 자취방 꾸미기 -->
        <section class="page-section portfolio" id="portfolio">
            <div class="container">
                <!-- Portfolio Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">자취방 꾸미기</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <br><br>
              	<!-- Portfolio Grid Items-->
                <div class="row">
	                    <!-- Portfolio Item 1-->
	                    <div class="col-md-6 col-lg-4 mb-5">
	                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal1">
	                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
	                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
	                            </div>
	                            <img class="img-fluid" src="assets/img/portfolio/room1.jpg" alt="" />
	                        </div>
	                    </div>
	                    <!-- Portfolio Item 2-->
	                    <div class="col-md-6 col-lg-4 mb-5">
	                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal2">
	                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
	                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
	                            </div>
	                            <img class="img-fluid" src="assets/img/portfolio/room2.jpg" alt="" />
	                        </div>
	                    </div>
	                    <!-- Portfolio Item 3-->
	                    <div class="col-md-6 col-lg-4 mb-5">
	                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal3">
	                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
	                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
	                            </div>
	                            <img class="img-fluid" src="assets/img/portfolio/room3.jpg" alt="" />
	                        </div>
	                    </div>
	                    <!-- Portfolio Item 4-->
	                    <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
	                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal4">
	                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
	                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
	                            </div>
	                            <img class="img-fluid" src="assets/img/portfolio/room4.jpg" alt="" />
	                        </div>
	                    </div>
	                    <!-- Portfolio Item 5-->
	                    <div class="col-md-6 col-lg-4 mb-5 mb-md-0">
	                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal5">
	                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
	                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
	                            </div>
	                            <img class="img-fluid" src="assets/img/portfolio/room5.jpg" alt="" />
	                        </div>
	                    </div>
	                    <!-- Portfolio Item 6-->
	                    <div class="col-md-6 col-lg-4">
	                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal6">
	                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
	                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
	                            </div>
	                            <img class="img-fluid" src="assets/img/portfolio/room6.jpg" alt="" />
	                        </div>
	                    </div>
               	</div>
               	
           </div>
     </section>
        
        <!-- 날씨 -->
        <section class="page-section bg-primary text-white mb-0" id="about">
            <div class="container" id="weather_info">
                <!-- About Section Heading-->
                <h1 class="city"></h1>
                <section>
                	<p class="w_id"></p>
                	<figure class="icon">
                	</figure>
                	<p class="temp"></p>
                	<aside>
                		<p class="temp_max">max</p>
                		<p class="temp_min">min</p>
                	</aside>
                </section>
                <img class="load_img" src="loading.gif" width="50px">
            </div>
        </section>
        
        <!-- 박스오피스 영화순위 -->
        <section class="page-section" id="contact">
            <div class="container">
                <!-- Contact Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">박스오피스 영화순위</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Contact Section Form-->
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19.-->
                        <form id="contactForm" name="myform" novalidate="novalidate">
                            <input type="text" class="form-control" name="txtYear" id="txtYear" size="6" placeholder="년"><br>
                            <select id="selMon" class="form-control">
                            	<option value="01">1월</option>
                            	<option value="02">2월</option>
                            	<option value="03">3월</option>
                            	<option value="04">4월</option>
                            	<option value="05">5월</option>
                            	<option value="06">6월</option>
                            	<option value="07">7월</option>
                            	<option value="08">8월</option>
                            	<option value="09">9월</option>
                            	<option value="10">10월</option>
                            	<option value="11">11월</option>
                            	<option value="12">12월</option>
                            </select>&nbsp;&nbsp;
                            
                            <select id="selDay" class="form-control">
                            	<option value="01">1일</option>
                            	<option value="02">2일</option>
                            	<option value="03">3일</option>
                            	<option value="04">4일</option>
                            	<option value="05">5일</option>
                            	<option value="06">6일</option>
                            	<option value="07">7일</option>
                            	<option value="08">8일</option>
                            	<option value="09">9일</option>
                            	<option value="10">10일</option>
                            	<option value="11">11일</option>
                            	<option value="12">12일</option>
                            	<option value="13">13일</option>
                            	<option value="14">14일</option>
                            	<option value="15">15일</option>
                            	<option value="16">16일</option>
                            	<option value="17">17일</option>
                            	<option value="18">18일</option>
                            	<option value="19">19일</option>
                            	<option value="20">20일</option>
                            	<option value="21">21일</option>
                            	<option value="22">22일</option>
                            	<option value="23">23일</option>
                            	<option value="24">24일</option>
                            	<option value="25">25일</option>
                            	<option value="26">26일</option>
                            	<option value="27">27일</option>
                            	<option value="28">28일</option>
                            	<option value="29">29일</option>
                            	<option value="30">30일</option>
                            	<option value="31">31일</option>                           
                            </select>
                            <br>
                            <div class="col-sm-12 text-center">
                            	<input type="button" value="영화순위보기" id="bt1" class="btn btn-primary btn-lg">
                            </div>
                            <br>
                            <div id="msg">	
                            </div>
                            <div class='cardClear'></div>
                            <div class="box3"></div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Copyright Section-->
        <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->
        <div class="scroll-to-top d-lg-none position-fixed">
            <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top"><i class="fa fa-chevron-up"></i></a>
        </div>
        <!-- 인테리어 모달창 -->
        
        <!-- Portfolio Modal 1-->
        <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-labelledby="portfolioModal1Label" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"><i class="fas fa-times"></i></span>
                    </button>
                    <div class="modal-body text-center">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0" id="portfolioModal1Label">Log Cabin</h2>
                                    <!-- Icon Divider-->
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mb-5" src="assets/img/portfolio/room1.jpg" alt="" />
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                                    <button class="btn btn-primary" data-dismiss="modal">
                                        <i class="fas fa-times fa-fw"></i>
                                        Close Window
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio Modal 2-->
        <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-labelledby="portfolioModal2Label" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"><i class="fas fa-times"></i></span>
                    </button>
                    <div class="modal-body text-center">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0" id="portfolioModal2Label">Tasty Cake</h2>
                                    <!-- Icon Divider-->
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mb-5" src="assets/img/portfolio/room2.jpg" alt="" />
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                                    <button class="btn btn-primary" data-dismiss="modal">
                                        <i class="fas fa-times fa-fw"></i>
                                        Close Window
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio Modal 3-->
        <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-labelledby="portfolioModal3Label" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"><i class="fas fa-times"></i></span>
                    </button>
                    <div class="modal-body text-center">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0" id="portfolioModal3Label">Circus Tent</h2>
                                    <!-- Icon Divider-->
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mb-5" src="assets/img/portfolio/room3.jpg" alt="" />
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                                    <button class="btn btn-primary" data-dismiss="modal">
                                        <i class="fas fa-times fa-fw"></i>
                                        Close Window
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio Modal 4-->
        <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-labelledby="portfolioModal4Label" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"><i class="fas fa-times"></i></span>
                    </button>
                    <div class="modal-body text-center">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0" id="portfolioModal4Label">Controller</h2>
                                    <!-- Icon Divider-->
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mb-5" src="assets/img/portfolio/room4.jpg" alt="" />
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                                    <button class="btn btn-primary" data-dismiss="modal">
                                        <i class="fas fa-times fa-fw"></i>
                                        Close Window
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio Modal 5-->
        <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-labelledby="portfolioModal5Label" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"><i class="fas fa-times"></i></span>
                    </button>
                    <div class="modal-body text-center">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0" id="portfolioModal5Label">Locked Safe</h2>
                                    <!-- Icon Divider-->
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mb-5" src="assets/img/portfolio/room5.jpg" alt="" />
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                                    <button class="btn btn-primary" data-dismiss="modal">
                                        <i class="fas fa-times fa-fw"></i>
                                        Close Window
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio Modal 6-->
        <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-labelledby="portfolioModal6Label" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"><i class="fas fa-times"></i></span>
                    </button>
                    <div class="modal-body text-center">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0" id="portfolioModal6Label">Submarine</h2>
                                    <!-- Icon Divider-->
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mb-5" src="assets/img/portfolio/room6.jpg" alt="" />
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                                    <button class="btn btn-primary" data-dismiss="modal">
                                        <i class="fas fa-times fa-fw"></i>
                                        Close Window
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 플로팅 배너 -->
        <div style="height:200px;">
        
        </div>
        <div id="floatMenu">
        	<a href="${cpath}/diart"><img src="assets/img/portfolio/dir.jpg"></a>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <script src="assets/mail/jqBootstrapValidation.js"></script>
        <script src="assets/mail/contact_me.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.3/jquery.min.js"></script> 
    <script>
		// API 요청 URL 변수
		var url = 'http://api.openweathermap.org/data/2.5/weather?q=seoul&APPID=e11462160015cffa69954c9f67741b7b';

		$.getJSON(url, function(data){

			// 날씨 데이터 객체
			var sys = data.sys; 			// 국가명, 일출/일몰			
			var city = data.name; 			// 도시명
			var weather = data.weather; 	// 날씨 객체
			var main = data.main;  			// 온도 기압 관련 객체
	 
			var wmain = weather[0].main; 	// 구름 상태(Cloudiness)
			var w_id = weather[0].id; 		// 날씨상태 id 코드
			var icon = weather[0].icon;		// 날씨 아이콘 정보
			var country = sys.country;  	// 국가명
			var temp = main.temp; 			// 현재 온도
			var temp_min = main.temp_min 	// 최저 온도
			var temp_max = main.temp_max 	// 최고 온도

			// 날씨 정보 표시
			$('#about').append( wmain + ', ' + icon + ' '
				+ '현재 온도: ' + parseInt(temp-273.15) + ' '
				+ '최저 온도: ' + parseInt(temp_min-273.15) + ' '
				+ '최고 온도: ' + parseInt(temp_max-273.15) + ' '
				+ country + ' ' + city + ' ' + w_id + ' ' + '<br>');

			// 날씨 아이콘 표시
			var icon_url = 'http://openweathermap.org/img/w/' + icon;
			$('#about').append("<img src='" + icon_url + ".png'>");
			
			// 날씨 정보 표시
			$('#weather_info > .city').html(city + "/" + country);			
			$('#weather_info  .icon').html("<img src='" + icon_url + ".png'>");
			$('#weather_info .w_id').html(wmain);
			$('#weather_info .temp_min').html(parseInt(temp_min-273.15) + '&deg;' + ' min');
			$('#weather_info .temp_max').html( parseInt(temp_max-273.15) + '&deg;' + ' max');
			$('#weather_info  .temp').html(parseInt(temp-273.15) + '&deg;');
			
			// 데이터 로딩 후 로딩이미지 제거
			$('#weather_info .load_img').hide();	

		});	// end getJSON()

	</script>
	<script>
	    // 오늘 날짜를 화면에 표시
	    function init(){
	        // 오늘 날짜 가져오기
	        var newDate = new Date();
	
	        // 년도
	        $("#textYear").val(newDate.getFullYear());
	
	        // 월
	        var mon = newDate.getMonth() + 1;
	        if(newDate.getMonth() < 10){
	            mon = "0" + mon;
	        }
	        $("#selMon").val(mon);
	        var d = newDate.getDate() - 1;
	        if(newDate.getDate() < 10){
	            d = "0" + d;
	        }
	        console.log(d)
	        $("#selDay").val(d);
	    }
	    $(document).ready(function(){
	        // 오늘 날짜가 기본으로 나타나도록
	        init();
	        $("#bt1").click(function(){
	            var url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=430156241533f1d058c603178cc3ca0e";
	            url = url + "&targetDt=" + $("#txtYear").val() + $("#selMon").val() + $("#selDay").val();
	            $("#msg").text("");
	            // ajax통신
	            $.ajax({
	                type : "GET", // 요청방식
	                url : url, // 주소
	                success : function(data) {
	                    // 출력 변수
	                    var str = "";
	                    if($(data).find("dailyBoxOffice").text() == ""){
	                        alert("일일자료가 존재하지 않습니다");
	                        return;
	                    }
	                    $(data).find("dailyBoxOffice").each(function (){
	                        str = str + $(this).find("rank").text() + "위 (";
	                        rankInten = parseInt($(this).find("rankInten").text());
	                        if(rankInten > 0){
	                            str = str + "▲" + rankInten + " ) :"
	                        }
	                        else if(rankInten < 0){
	                            str = str + "▼" + Math.abs(rankInten) + " ) :"
	                        }
	                        else{
	                            str = str + rankInten + " ) :"
	                        }
	                        str = str + $(this).find("movieNm").text() + "<br>";
	                    });
	                    $("#msg").append(str);
	                }, // 성공
	                error : function() {
	                    alert("값을 가지고 올 수 없습니다");
	                }  // 실패
	            });
	
	        });
	    });
</script>
<script>
	$(document).ready(function(){
		var floatPosition = parseInt($("#floatMenu").css('top'));
		$(window).scroll(function(){
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";
			$("#floatMenu").stop().animate({
				"top" : newPosition
			}, 500);
		}).scroll();
	});
</script>
<jsp:include page="footer.jsp" />
</html>
