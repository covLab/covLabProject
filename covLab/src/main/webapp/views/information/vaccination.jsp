@@ -0,0 +1,165 @@
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Vaccination</title>


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
<h4>예방접종 정보</h4>
<hr>

<a class="btn" href="#vaccination01">예방접종 왜 해야하나?</a>
<a class="btn" href="#vaccination02">예방접종은 언제, 어디서?</a>
<a class="btn" href="#vaccination03">예방접종은 안전한가?</a>
<a class="btn" href="#vaccination04">예방접종 피해 보상</a>
<hr>
<!-- 윗부분은 목록을 만들고 a 태그로 각 번호의 목록으로 이동하게 만듬 -->

<!-- 각 목록의 내용을 번호를 붙여서 작성 -->
<h5>1. 백신 접종 현황 (1차 접종 / 백신 접종 완료)</h5>
<hr>
<h5 id="vaccination01">2. 예방접종 왜 해야하나?</h5>
 <p>-효과 있나? <br> 백신 효과 있을까? 맞기 싫은데 꼭 맞아야 하나?</p>
 <p>여기는 백신 예방접종을 꼭 맞아야 하는 이유에 대한 내용입니다.</p>
 <p>여기는 백신 예방접종을 꼭 맞아야 하는 이유에 대한 내용입니다.</p>
 <p>여기는 백신 예방접종을 꼭 맞아야 하는 이유에 대한 내용입니다.</p>
 <p>여기는 백신 예방접종을 꼭 맞아야 하는 이유에 대한 내용입니다.</p>
 <p>여기는 백신 예방접종을 꼭 맞아야 하는 이유에 대한 내용입니다.</p>
 <p>여기는 백신 예방접종을 꼭 맞아야 하는 이유에 대한 내용입니다.</p>
 <p>여기는 백신 예방접종을 꼭 맞아야 하는 이유에 대한 내용입니다.</p>
 <p>-접종만으로 예방 가능?</p>
 <p>접종만으로 가능할까요? 접종해도 코로나 걸리잖아요...</p>
 <p>접종만으로 가능할까요? 접종해도 코로나 걸리잖아요...</p>
 <p>접종만으로 가능할까요? 접종해도 코로나 걸리잖아요...</p>
 <p>접종만으로 가능할까요? 접종해도 코로나 걸리잖아요...</p>
 <p>접종만으로 가능할까요? 접종해도 코로나 걸리잖아요...</p>
 <p>접종만으로 가능할까요? 접종해도 코로나 걸리잖아요...</p>
 <p><a href="#top">맨 위로 이동</a></p>
<hr>
<h5 id="vaccination02">3. 예방접종 언제, 어디서?</h5>
 <p>-누가 먼저?</p>
 <p>백신은 나이대별로 기간에 맞춰 사전예약을 하면 맞을 수 있어요.</p>
 <p>백신은 나이대별로 기간에 맞춰 사전예약을 하면 맞을 수 있어요.</p>
 <p>백신은 나이대별로 기간에 맞춰 사전예약을 하면 맞을 수 있어요.</p>
 <p>백신은 나이대별로 기간에 맞춰 사전예약을 하면 맞을 수 있어요.</p>
 <p>백신은 나이대별로 기간에 맞춰 사전예약을 하면 맞을 수 있어요.</p>
 <p>백신은 나이대별로 기간에 맞춰 사전예약을 하면 맞을 수 있어요.</p>
 <p>백신은 나이대별로 기간에 맞춰 사전예약을 하면 맞을 수 있어요.</p>
 <p>백신은 나이대별로 기간에 맞춰 사전예약을 하면 맞을 수 있어요.</p>
 <p>백신은 나이대별로 기간에 맞춰 사전예약을 하면 맞을 수 있어요.</p>
 <p>백신은 나이대별로 기간에 맞춰 사전예약을 하면 맞을 수 있어요.</p>
 <p>백신은 나이대별로 기간에 맞춰 사전예약을 하면 맞을 수 있어요.</p>
 <p><a href="#top">맨 위로 이동</a></p>
<hr>
<h5 id="vaccination03">4. 예방접종은 안전한가?</h5>
 <p>백신 부작용 / 대처 방법</p>
 <p>백신 부작용이 아직 확실하지 않으니 긴밀한 확인이 필요합니다.</p>
 <p>백신 부작용이 아직 확실하지 않으니 긴밀한 확인이 필요합니다.</p>
 <p>백신 부작용이 아직 확실하지 않으니 긴밀한 확인이 필요합니다.</p>
 <p>백신 부작용이 아직 확실하지 않으니 긴밀한 확인이 필요합니다.</p>
 <p>백신 부작용이 아직 확실하지 않으니 긴밀한 확인이 필요합니다.</p>
 <p>백신 부작용이 아직 확실하지 않으니 긴밀한 확인이 필요합니다.</p>
 <p>백신 부작용이 아직 확실하지 않으니 긴밀한 확인이 필요합니다.</p>
 <p>백신 부작용이 아직 확실하지 않으니 긴밀한 확인이 필요합니다.</p>
 <p>백신 부작용이 아직 확실하지 않으니 긴밀한 확인이 필요합니다.</p>
 <p>백신 부작용이 아직 확실하지 않으니 긴밀한 확인이 필요합니다.</p>
 <p><a href="#top">맨 위로 이동</a></p>
<hr>
<h5 id="vaccination04">5. 예방접종 피해 국가 보상체계</h5>
<p>백신 맞고 아프면 국가에게 보상을 받을 수 있습니다</p>
<p>백신 맞고 아프면 국가에게 보상을 받을 수 있습니다</p>
<p>백신 맞고 아프면 국가에게 보상을 받을 수 있습니다</p>
<p>백신 맞고 아프면 국가에게 보상을 받을 수 있습니다</p>
<p>백신 맞고 아프면 국가에게 보상을 받을 수 있습니다</p>
<p>백신 맞고 아프면 국가에게 보상을 받을 수 있습니다</p>
<p>백신 맞고 아프면 국가에게 보상을 받을 수 있습니다</p>
<p>백신 맞고 아프면 국가에게 보상을 받을 수 있습니다</p>
<p>백신 맞고 아프면 국가에게 보상을 받을 수 있습니다</p>
<p>백신 맞고 아프면 국가에게 보상을 받을 수 있습니다</p>
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