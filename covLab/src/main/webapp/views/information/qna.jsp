@@ -0,0 +1,205 @@
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>QnA</title>


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
</head>

<style>
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

<body>
<h4>QnA</h4>
<hr>

<a class="btn" href="#qna01">코로나19 백신 개요</a>
<a class="btn" href="#qna02">코로나19 예방접종 사업</a>
<a class="btn" href="#qna03">백신 관련</a>
<a class="btn" href="#qna04">백신의 안전성과 이상반응</a>
<a class="btn" href="#qna05">코로나19 예방접종 관련 피해보상</a>
<a class="btn" href="#qna06">인과성 불충분한 중증 환자 의료비 지원사업</a>
<a class="btn" href="#qna07">75세 이상 어르신 및 노인시설 예방접종</a>
<a class="btn" href="#qna08">시스템및 예방접종 기록</a>
<hr>
<!-- 윗부분은 목록을 만들고 a 태그로 각 번호의 목록으로 이동하게 만듬 -->

<!-- 각 목록의 내용을 번호를 붙여서 작성 -->
<h5 id="qna01">1. 코로나19 백신 개요</h5>
<p>목록 버튼 누르면 작은 목록 나오게 하고 싶은데 어떻게 해야할까?</p>
<p>목록 버튼 누르면 작은 목록 나오게 하고 싶은데 어떻게 해야할까?</p>
<p><a href="#top">맨 위로 이동</a></p>
<hr>
<h5 id="qna02">2. 코로나19 예방접종 사업</h5>
<p>예방접종 하면 좋겠죠.. 건강할거에요.. 그럴거에요...</p>
<p>예방접종 하면 좋겠죠.. 건강할거에요.. 그럴거에요...</p>
<p><a href="#top">맨 위로 이동</a></p>
<hr>
<h5 id="qna03">3. 백신 관련</h5>
<p>백신이 점점 업그레이드 좀 됐으면 좋겠어요.</p>
<p>백신이 점점 업그레이드 좀 됐으면 좋겠어요.</p>
<p><a href="#top">맨 위로 이동</a></p>
<hr>
<h5 id="qna04">4. 백신의 안전성과 이상반응</h5>
<p>백신은 안전하지 않은것 같지만.. 괜찮아지길 바래요.. 이상있음 병원가야 합니다...</p>
<p>백신은 안전하지 않은것 같지만.. 괜찮아지길 바래요.. 이상있음 병원가야 합니다...</p>
<p>백신은 안전하지 않은것 같지만.. 괜찮아지길 바래요.. 이상있음 병원가야 합니다...</p>
<p><a href="#top">맨 위로 이동</a></p>
<hr>
<h5 id="qna05">5. 코로나19 예방접종 관련 피해보상</h5>
<p>코로나로 피해를 받으셨으면 보상을 받으세요. 보상해줍니다.</p>
<p>코로나로 피해를 받으셨으면 보상을 받으세요. 보상해줍니다.</p>
<p>코로나로 피해를 받으셨으면 보상을 받으세요. 보상해줍니다.</p>
<p><a href="#top">맨 위로 이동</a></p>
<hr>
<h5 id="qna06">6. 인과성 불충분한 중증 환자 의료비 지원사업</h5>
<p>인과성 자료가 부족해도 보상 받을 수 있습니다.</p>
<p>인과성 자료가 부족해도 보상 받을 수 있습니다.</p>
<p><a href="#top">맨 위로 이동</a></p>
<hr>
<h5 id="qna07">7. 75세 이상 어르신 및 노인시설 예방접종</h5>
<p>어르신들께서 건강하시길 바랍니다.</p>
<p>어르신들께서 건강하시길 바랍니다.</p>
<p><a href="#top">맨 위로 이동</a></p>
<hr>
<h5 id="qna08">8. 시스템및 예방접종 기록</h5>
<p>예방접종 하면 기록이 생깁니다.</p>
<p>예방접종 하면 기록이 생깁니다.</p>
<p><a href="#top">맨 위로 이동</a></p>
<hr>

                <!-- /# row -->
                <section id="main-content">
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="extra-area-chart"></div>
                            <div id="morris-line-chart"></div>
                            <div class="footer">
                                <p>2018 © Admin Board. -
                                    <a href="#">example.com</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
  
    <!-- jquery vendor -->
    <script src="/semi/resources/js/lib/jquery.min.js"></script>
    <script src="/semi/resources/js/lib/jquery.nanoscroller.min.js"></script>
    <!-- nano scroller -->
    <script src="/semi/resources/js/lib/menubar/sidebar.js"></script>
    <script src="/semi/resources/js/lib/preloader/pace.min.js"></script>
    <!-- sidebar -->
    
    <!-- bootstrap -->


    <script src="/semi/resources/js/lib/bootstrap.min.js"></script><script src="assets/js/scripts.js"></script>
    <!-- scripit init-->



</body>

</html>