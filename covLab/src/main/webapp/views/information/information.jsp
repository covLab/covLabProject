<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Focus Admin: Tab</title>

    <!-- ================= Favicon ================== -->
    <!-- Standard -->
    <link rel="shortcut icon" href="http://placehold.it/64.png/000/fff">
    <!-- Retina iPad Touch Icon-->
    <link rel="apple-touch-icon" sizes="144x144" href="http://placehold.it/144.png/000/fff">
    <!-- Retina iPhone Touch Icon-->
    <link rel="apple-touch-icon" sizes="114x114" href="http://placehold.it/114.png/000/fff">
    <!-- Standard iPad Touch Icon-->
    <link rel="apple-touch-icon" sizes="72x72" href="http://placehold.it/72.png/000/fff">
    <!-- Standard iPhone Touch Icon-->
    <link rel="apple-touch-icon" sizes="57x57" href="http://placehold.it/57.png/000/fff">

    <!-- Styles -->
    <link href="/semi/resources/css/lib/font-awesome.min.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/themify-icons.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/menubar/sidebar.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/helper.css" rel="stylesheet">
    <link href="/semi/resources/css/style.css" rel="stylesheet">

<%@ include file="../common/sidebar.jsp"%>
<%@ include file="../common/topbar.jsp"%>
<style type="text/css">
	.slider {
  width: 1000px;
  height: 550px;
  position: relative;
}
.slide {
  width: 1000px;
  height: 550px;
  background-size: cover;
  border-radius: 10px;
  animation: fade 1.5s;
  display: none;
}
.imga {
  width: 1000px;
  height: 550px;
}

.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  padding: 16px;
  color: black;
  font-size: 4rem;
  transition: 0.6s ease;
  border-radius: 5px;
}
.next {
  right: 0;
}
.prev:hover,
.next:hover {
  background-color: white;
  /*rgba(190, 190, 190, 0.5)*/
}

@keyframes fade {
  from {
    opacity: 0.4;
  }
  to {
    opacity: 1;
  }
}
    

 /* 두번째 버튼 부분 */ 
 .btn {
  text-decoration: none;
  font-size:15pt;  
  background-color: navy;
  color: white;
  padding:10px 20px 10px 20px;
  margin:10px;
  display:inline-block;
  border-radius: 10px;
  transition:all 0.2s;
 }
 .btn:active {
  transform:translateY(5px);
 }
 
 .btn:hover {
 	background:lightgray;
 	color:black;
 	transition:all 0.2s;
 }
 
 
 
</style>


</head>


<body>
    <div class="content-wrap">
        <div class="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8 p-r-0 title-margin-right">
                        <div class="page-header">
                            <div class="page-title">
                                <h1>뉴스 /  백신 정보 <span>게시판</span></h1>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-4 p-l-0 title-margin-left">
                        <div class="page-header">
                            <div class="page-title">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Table-Row-Select</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <section id="main-content">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-title">
                                <!-- 1. 코로나/백신 정보 (자동 슬라이드) -->
                                    <!-- <h4>1. 코로나/백신/QnA</h4> -->

<!-- 자동배너 (이미지 넣고, 수정해야함) -->
<br>
  <div class="slider" >
      <!-- <div class="slide" style="background-image: url(../../resources/images/info_num.jpg);"></div>   -->
      <div class="slide" style="background-image: url(../../resources/images/info_num2.jpeg);">
      	<a href="coronaInfo.jsp"><img src="../../resources/images/info_num2.jpeg" class="imga"></a>
      </div>
      <div class="slide" style="background-image: url(../../resources/images/info_vac.gif);">
      	<a href="vaccinInfo.jsp"><img src="../../resources/images/info_vac.gif" class="imga"></a>
      </div>
      <div class="slide" style="background-image: url(../../resources/images/info_qna2.jpg);">
      	<a href="qna.jsp"><img src="../../resources/images/info_qna2.jpg" class="imga"></a>
      </div>
      <a class="prev" onclick="button_click(-1)">&#10094</a>
      <a class="next" onclick="button_click(1)">&#10095</a>
    </div>
  <hr>
<!-- 2. 코로나/ 백신 정보로 넘어가는 버튼 -->
 <h3>**메뉴 이동**</h3> 
<br>
<a class="btn" href="coronaInfo.jsp">코로나 정보</a>
<a class="btn" href="vaccinInfo.jsp">백신/예방접종 정보</a>
<a class="btn" href="qna.jsp">QnA</a>
<!-- <a class="btn" href="test2.jsp">test2</a> -->
<hr>

<!-- 3. 실시간 뉴스 -->
<h3>**실시간 뉴스**</h3><br>
<a href="https://www.yna.co.kr/view/AKR20210805071200002?input=1195m" class="new">코로나로 힘든 대형마트 입점업체, 임대료 감액 요청할 수 있다</a><br>
<a href="https://biz.chosun.com/it-science/ict/2021/08/05/MTTS3BYF7JE47KXPKWH4LA6WTQ/?utm_source=naver&utm_medium=original&utm_campaign=biz">
네이버·카카오 앱으로 18~49세 코로나 백신 예약</a><br>
<a href="https://www.news1.kr/articles/?4394395">두번째 코로나 수능, 백신 맞아도 마스크…점심때만 3면 칸막이</a><br>
<a href="https://newsis.com/view/?id=NISX20210805_0001538550&cID=13102&pID=13100">코로나19, 실내 공간 감염 위험 4배 높다</a><br>
<a href="https://www.hani.co.kr/arti/society/health/1006519.html">코로나19 신규 확진자 1776명…30일째 1천명대</a><br>
<a href="https://www.yna.co.kr/view/AKR20210804130100017?input=1195m">국내 부모 64.2% "우리 아이 코로나 백신 맞히겠다"</a><br>

  
                                </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /# card -->
                        </div>
                        <!-- /# column -->
                    </div>
                    <!-- /# row -->
                </section>
            </div>
<!-- ---------------------------------------------------------------------------------------- -->


    <!-- jquery vendor -->
    <script src="/semi/resources/js/lib/jquery.min.js"></script>
    <script src="/semi/resources/js/lib/jquery.nanoscroller.min.js"></script>
    <script src="/semi/resources/js/lib/bootstrap.min.js"></script><script src="assets/js/scripts.js"></script>
    <!-- scripit init-->

<!-- 자동배너 부분의 스크립트 -->
 <script>
let currSlide = 1;
showSlide(currSlide);

function button_click(num){
  showSlide((currSlide += num));
}
function showSlide(num){
  const slides = document.querySelectorAll(".slide");
  if(num>slides.length){
    currSlide =1;
  }if(num<1){
    currSlide = slides.length;
  }
  for(let i=0; i<slides.length; i++){
    slides[i].style.display="none";
  }slides[currSlide -1].style.display="block";
}
</script>


</body>
