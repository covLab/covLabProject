@@ -0,0 +1,128 @@
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>VaccineInfo</title>


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
<h4>백신 정보</h4>
<hr>

<a class="btn" href="#vaccineinfo01">우리나라에 들어오는 백신</a>
<a class="btn" href="#vaccineinfo02">백신의 유통과 운송</a>

<hr>
<!-- 윗부분은 목록을 만들고 a 태그로 각 번호의 목록으로 이동하게 만듬 -->

<!-- 각 목록의 내용을 번호를 붙여서 작성 -->
<h5 id="vaccineinfo01">1. 우리나라에 들어오는 백신 (백신 종류, 회사, 유통기간... 등)</h5>
 <p>- 화이자</p>
 <p>그나마 효과가 높은데 괜찮을까? 이것도 심장근육에 종양 생긴다잖아...</p>
 <p>그나마 효과가 높은데 괜찮을까? 이것도 심장근육에 종양 생긴다잖아...</p>
 <p>- 모더나</p>
 <p>얘나 화이자나 비슷한거 같은데.. </p>
 <p>얘나 화이자나 비슷한거 같은데.. </p>
 <p>- 아스트라제네카</p>
 <p>왜 젊은층에서만 혈전증이 생기는거야? 백신이 나이를 알아?</p>
 <p>왜 젊은층에서만 혈전증이 생기는거야? 백신이 나이를 알아?</p>
 <p>- 얀센</p>
 <p>이거 왜 맞으라 해준거냐 ㅡㅡ 효과도 제일 낫고 믿음도 안가고.. 타이레놀로 돈버나..?</p>
 <p>이거 왜 맞으라 해준거냐 ㅡㅡ 효과도 제일 낫고 믿음도 안가고.. 타이레놀로 돈버나..?</p>
 <p><a href="#top">맨 위로 이동</a></p>
<hr>
<h5 id="vaccineinfo02">2. 백신의 유통, 운송체계</h5>
<p>냉동해서 아주 안전하게 운반하고 있어요. 운받은 믿어도 될것 같아요.</p>
<p>냉동해서 아주 안전하게 운반하고 있어요. 운받은 믿어도 될것 같아요.</p>
<p>냉동해서 아주 안전하게 운반하고 있어요. 운받은 믿어도 될것 같아요.</p>
<p>냉동해서 아주 안전하게 운반하고 있어요. 운받은 믿어도 될것 같아요.</p>
<p>냉동해서 아주 안전하게 운반하고 있어요. 운받은 믿어도 될것 같아요.</p>
<p>냉동해서 아주 안전하게 운반하고 있어요. 운받은 믿어도 될것 같아요.</p>
<p>냉동해서 아주 안전하게 운반하고 있어요. 운받은 믿어도 될것 같아요.</p>
<p>냉동해서 아주 안전하게 운반하고 있어요. 운받은 믿어도 될것 같아요.</p>
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