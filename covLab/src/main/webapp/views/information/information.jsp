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
<style>
/* 자동배너 부분 */
html, body { box-sizing: border-box; padding: 0; margin: 0; text-align: center; }
    *, *:before, *:after { box-sizing: inherit; }
    .clearfix:after { content: ''; display: block; clear: both; float: none; }
    .title { margin-bottom: 0; text-align: center; font-size: 30px; color: #333; }
    .link, .link:visited { display: inline-block; margin: 20px 0; color: #555; text-decoration: none; font-weight: bold; }
    .link:hover, .link:focus { color: #9fd6c2; }
    /* container - body */
    #container { width: 1000px; margin: auto; }
    .slide_wrap { position: relative; width: 400px; margin: auto; padding-bottom: 30px; }
    .slide_box { width: 100%; margin: auto; overflow-x: hidden; }
    /*밑에가 슬라이드 이미지 칸에 대한 부분*/
    .slide_content { display: table; float: left; width: 400px; height: 400px; }
    /*밑에가 슬라이드 내의 글자*/
    .slide_content > p { display: table-cell; vertical-align: middle; text-align: center; font-size: 100px; font-weight: bold; color: #555; }
    .slide_content.slide01 { background: #ddbdff; }
    .slide_content.slide02 { background: #9fd6c2; }
    .slide_content.slide03 { background: #abe2f7; }
    .slide_content.slide04 { background: #f08c78; }
    /* .slide_content.slide05 { background: #fbdb65; } */
    .slide_btn_box > button { position: absolute; top: 50%; margin-top: -45px; width: 60px; height: 60px; font-size: 16px; color: white; background: navy; border: 1px solid #ddd; cursor: pointer; }
    .slide_btn_box > .slide_btn_prev { left: -100px; }
    .slide_btn_box > .slide_btn_next { right: -100px; }
    .slide_pagination { position: absolute; left: 50%; bottom: 0; list-style: none; margin: 0; padding: 0; transform: translateX(-50%); }
    .slide_pagination .dot { display: inline-block; width: 15px; height: 15px; margin: 0 5px; overflow: hidden; background: #ddd; border-radius: 50%; transition: 0.3s; }
    .slide_pagination .dot.dot_active { background: #333; }
    .slide_pagination .dot a { display: block; width: 100%; height: 100%; }
 
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
  text-shadow:0px -2px black;
 }
 .btn:active {
  transform:translateY(5px);
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
                                    <h4>자동 배너, 코로나 확진자 수/백신접종현황/예방접종 사전예약 날짜/QnA</h4>

<!-- 자동배너 (이미지 넣고, 수정해야함) -->
  <div id="container">
    <div class="slide_wrap">
      <div class="slide_box">
        <div class="slide_list clearfix">
          <div class="slide_content slide01">
            <p>1</p>
          </div>
          <div class="slide_content slide02">
            <p>2</p>
          </div>
          <div class="slide_content slide03">
            <p>3</p>
          </div>
          <div class="slide_content slide04">
            <p>4</p>
          </div>
        </div>
        <!-- // .slide_list -->
      </div>
      <!-- // .slide_box -->
      <div class="slide_btn_box">
        <button type="button" class="slide_btn_prev">이전</button>
        <button type="button" class="slide_btn_next">다음</button>
      </div>
      <!-- // .slide_btn_box -->
      <ul class="slide_pagination"></ul>
      <!-- // .slide_pagination -->
    </div>
    <!-- // .slide_wrap -->
  </div>
  <!-- // .container -->
  <hr>
  
  <!-- 2. 코로나/ 백신 정보로 넘어가는 버튼 -->
<h4>버튼을 클릭하면 해당 페이지로 이동함</h4>
<br>
<a class="btn" href="coronaInfo.jsp">코로나 정보</a>
<a class="btn" href="vaccinInfo.jsp">백신/예방접종 정보</a>
<a class="btn" href="qna.jsp">QnA</a>
<hr>

<!-- 3. 실시간 뉴스 -->
<h4>크롤링으로 실시간 뉴스 가져오기</h4>
  
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
    (function () {
      const slideList = document.querySelector('.slide_list');  // Slide parent dom
      const slideContents = document.querySelectorAll('.slide_content');  // each slide dom
      const slideBtnNext = document.querySelector('.slide_btn_next'); // next button
      const slideBtnPrev = document.querySelector('.slide_btn_prev'); // prev button
      const pagination = document.querySelector('.slide_pagination');
      const slideLen = slideContents.length;  // slide length
      const slideWidth = 400; // slide width
      const slideSpeed = 300; // slide speed
      const startNum = 0; // initial slide index (0 ~ 4)
      
      slideList.style.width = slideWidth * (slideLen + 2) + "px";
      
      // Copy first and last slide
      let firstChild = slideList.firstElementChild;
      let lastChild = slideList.lastElementChild;
      let clonedFirst = firstChild.cloneNode(true);
      let clonedLast = lastChild.cloneNode(true);

      // Add copied Slides
      slideList.appendChild(clonedFirst);
      slideList.insertBefore(clonedLast, slideList.firstElementChild);

      // Add pagination dynamically
      let pageChild = '';
      for (var i = 0; i < slideLen; i++) {
        pageChild += '<li class="dot';
        pageChild += (i === startNum) ? ' dot_active' : '';
        pageChild += '" data-index="' + i + '"><a href="#"></a></li>';
      }
      pagination.innerHTML = pageChild;
      const pageDots = document.querySelectorAll('.dot'); // each dot from pagination

      slideList.style.transform = "translate3d(-" + (slideWidth * (startNum + 1)) + "px, 0px, 0px)";

      let curIndex = startNum; // current slide index (except copied slide)
      let curSlide = slideContents[curIndex]; // current slide dom
      curSlide.classList.add('slide_active');

      /** Next Button Event */
      slideBtnNext.addEventListener('click', function() {
        if (curIndex <= slideLen - 1) {
          slideList.style.transition = slideSpeed + "ms";
          slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 2)) + "px, 0px, 0px)";
        }
        if (curIndex === slideLen - 1) {
          setTimeout(function() {
            slideList.style.transition = "0ms";
            slideList.style.transform = "translate3d(-" + slideWidth + "px, 0px, 0px)";
          }, slideSpeed);
          curIndex = -1;
        }
        curSlide.classList.remove('slide_active');
        pageDots[(curIndex === -1) ? slideLen - 1 : curIndex].classList.remove('dot_active');
        curSlide = slideContents[++curIndex];
        curSlide.classList.add('slide_active');
        pageDots[curIndex].classList.add('dot_active');
      });

      /** Prev Button Event */
      slideBtnPrev.addEventListener('click', function() {
        if (curIndex >= 0) {
          slideList.style.transition = slideSpeed + "ms";
          slideList.style.transform = "translate3d(-" + (slideWidth * curIndex) + "px, 0px, 0px)";
        }
        if (curIndex === 0) {
          setTimeout(function() {
            slideList.style.transition = "0ms";
            slideList.style.transform = "translate3d(-" + (slideWidth * slideLen) + "px, 0px, 0px)";
          }, slideSpeed);
          curIndex = slideLen;
        }
        curSlide.classList.remove('slide_active');
        pageDots[(curIndex === slideLen) ? 0 : curIndex].classList.remove('dot_active');
        curSlide = slideContents[--curIndex];
        curSlide.classList.add('slide_active');
        pageDots[curIndex].classList.add('dot_active');
      });

      /** Pagination Button Event */
      let curDot;
      Array.prototype.forEach.call(pageDots, function (dot, i) {
        dot.addEventListener('click', function (e) {
          e.preventDefault();
          curDot = document.querySelector('.dot_active');
          curDot.classList.remove('dot_active');
          
          curDot = this;
          this.classList.add('dot_active');

          curSlide.classList.remove('slide_active');
          curIndex = Number(this.getAttribute('data-index'));
          curSlide = slideContents[curIndex];
          curSlide.classList.add('slide_active');
          slideList.style.transition = slideSpeed + "ms";
          slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 1)) + "px, 0px, 0px)";
        });
      });
    })();
  </script>


</body>
