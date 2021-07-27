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
<h4>백신/예방접종 정보</h4>
<hr>

<a class="btn" href="#vaccineinfo01">우리나라에 들어오는 백신</a>
<a class="btn" href="#vaccineinfo02">예방접종 이후 증상</a>

<hr>
<!-- 윗부분은 목록을 만들고 a 태그로 각 번호의 목록으로 이동하게 만듬 -->

<!-- 각 목록의 내용을 번호를 붙여서 작성 -->
<h5>*백신 접종 현황 (1차 접종 / 백신 접종 완료)*</h5>
<hr>
<h5 id="vaccineinfo01">*우리나라에 들어오는 백신*</h5>
<table border="1" height="60%" width="80%">
	<tr align="center">
		<td>백신이름</td>
		<td>아스트라제네카</td>
		<td>화이자</td>
		<td>모더나</td>
		<td>얀센</td>
	</tr>
	<tr>
		<td align="center">개발국</td>
		<td align="left">영국</td>
		<td align="left">미국/독일</td>
		<td align="left">미국</td>
		<td align="left">미국</td>
	</tr>
		<tr>
		<td align="center">방식</td>
		<td align="left">독감 바이러스 전달체로 활용</td>
		<td align="left">전령 RNA</td>
		<td align="left">전령 RNA</td>
		<td align="left">아데노 바이러스 전달체로 활용</td>
	</tr>
	<tr>
		<td align="center">투여대상</td>
		<td align="left">18세 이상</td>
		<td align="left">16세 이상</td>
		<td align="left">18세 이상</td>
		<td align="left">미정</td>
	</tr>
		<tr>
		<td align="center">예방효과</td>
		<td align="left"><font color="red">62~70%</font><br>
		       영국,브라질 3상 62%, <br>저용량/표준 용량 70%</td>
		<td align="left"><font color="red">95%</font><br>연령, 인종, 민족적 차이 없이 일관</td>
		<td align="left"><font color="red">94.1%</font><br>최소 3개월 항체 유지</td>
		<td align="left"><font color="red">평균 66%</font><br>미국 72%, 남아공 57% <br> 라틴아메리카 66%</td>
	</tr>
		<tr>
		<td align="center">접종횟수</td>
		<td align="left">2회</td>
		<td align="left">2회</td>
		<td align="left">2회</td>
		<td align="left">1회</td>
	</tr>
		<tr>
		<td align="center">보관유통</td>
		<td align="left">6개월동안<br> 냉장상태(2~8℃) 보관, 운반, 취급 가능</td>
		<td align="left">-70℃ 이하의 초저온 '콜드체인' 통해 유통<br>
								  -80℃~-60℃ 6개월<br>2℃~8℃ 5일<br>25℃ 2시간 보관가능</td>
		<td align="left">-25℃~-15℃ 6개월 <br> 2~8℃ 최대 30일간 안정적인 상태유지 <br> 8℃~25℃ 12시간</td>
		<td align="left">2~8℃에서 최소 3개월 <br>-20℃에서 2년 보관</td>
	</tr>
</table>
 <p><a href="#top">맨 위로 이동</a></p>
<hr>
<h5 id="vaccineinfo02">*예방접종 이후*</h5>
<div>
	<h4>1. 예방접종 이후 주의 사항</h4>
	<img src="../../resources/images/vaccination01.jpg">
	<ul>
		<li><font size="4">접종받은 기관에서 15~30분 가량 머무르며 즉각적으로 나타날 수 있는 이상반응의 발생여부를 관찰합니다.</font></li>
		<li><font size="4">예방접종 이후 최소 3일동안은 몸 상태를 주의 깊게 살펴야 합니다.</font></li>
		<li><font size="4">예방접종을 한 당일에는 간단한 샤워는 가능하지만 반식욕, 사우나, 찜질방, 수영 등은 피하고 충분한 휴식을 취합니다.</font></li>
		<li><font size="4">접종 1~2일 후에는 금주하고, 접종 부위는 청결하게 유지하며 긁지 않도록 합니다.</font></li>
		<li><font size="4">만약 예방접종 후 고열, 두드러기, 호흡곤란, 입술 또는 입안의 부종 등 심한 알레르기 반응 등 평소와 다른 증상이
		 있는 경우에는 즉시 접종기관이나 가까운 외료기관을 방문하여 진료를 받아야 합니다.</font></li>
	</ul>
</div>
<hr width="40%" align="left">
<div>
	<h4>2. 예방접종 이후 이상반응</h4>
	<img src="../../resources/images/vaccination02.png">
<table border="1">
	<tr>
		<td>발열증상</td>
		<td><ul>
			<li>접종 후 39℃미만의 발열증상은 정상적인 면역반응일 가능성이 높습니다.</li>
			<li>단, 접종 후 39℃ 이상의 고열이 나거나, 2일 이상 증상이 지속될 경우에는 의사의 진료가 필요합니다.</li>
			<li>1단계 : 38.4℃ 이하 / 2단계 : 38.5℃~38.9℃ / 3단계 : 38.9℃~40℃ / 4단계 : 40.1 이상</li>
			</ul></td>
	</tr>
	<tr>
		<td>접종부위 통증</td>
		<td><ul>
			<li>접종 당일에서 다음날까지는 접종부위가 불편하고 뻐근한 느낌이 들며, 예방접종 이후 나타날 수 있는 염증반응 입니다.</li>
			<li>1단계 : 통증이 나타나지만 약을 복용할 정도는 아님</li>
			<li>2단계 : 1~2일 약물을 먹어야 팔을 움직이는데 지장이 없음</li>
			<li>3단계 : 3일 이상 통증이 지속되거나 약을 먹어도 통증 조절이 안도어 팔을 움직이기 어려운 경우</li>
			<li>(3단계는 의사의 진료가 필요합니다.)</li>
		</ul></td>
	</tr>
	<tr>
		<td>접종 부위 붓기 또는 발적 증상</td>
		<td><ul>
			<li>접종 부위에 피부색으 변화 없이 부은 느낌이 들거나 실제 부었더라도 활동에 지장이 없는 경우 수일 내 자연적으로
			호전되는 접종 반응 중 하나입니다.</li>
			<li>1단계 : 직경 5cm 이하</li>
			<li>2단계 : 직경 5.1cm~10cm, 움직이기 불편한 경우</li>
			<li>3단계 : 직경 10cm 이상으로 부었거나 활동이 어려운 경우</li>
			<li>4단계 : 접종 부위 피부색이 검게 또는 보라색 등 어둡게 변한 경우</li>
			<li>(4단계는 의사의 진료가 필요합니다.)</li>
			<li>단계와 상관없이 이러한 증상이 3일 이상 지속되거나 접종부위의 피부색이 검게 또는 보라색으로 어둡게 변한다면
			의사의 진료가 필요합니다.</li>
		</ul></td>
	</tr>
</table>




	<ul>	
		<li><font size="4">발열증상		
			<p>접종 후 39℃미만의 발열증상은 정상적인 면역반응일 가능성이 높습니다.<br>
			단, 접종 후 39℃ 이상의 고열이 나거나, 2일 이상 증상이 지속될 경우에는 의사의 진료가 필요합니다.<br>
			1단계 : 38.4℃ 이하 / 2단계 : 38.5℃~38.9℃ / 3단계 : 38.9℃~40℃ / 4단계 : 40.1 이상</p></font></li>
		<li><font size="4">접종부위 통증
			<p>접종 당일에서 다음날까지는 접종부위가 불편하고 뻐근한 느낌이 들며, 예방접종 이후 나타날 수 있는 염증반응 입니다.<br>
			1단계 : 통증이 나타나지만 약을 복용할 정도는 아님 <br>
			2단계 : 1~2일 약물을 먹어야 팔을 움직이는데 지장이 없음<br>
			3단계 : 3일 이상 통증이 지속되거나 약을 먹어도 통증 조절이 안도어 팔을 움직이기 어려운 경우<br>
			(3단계는 의사의 진료가 필요합니다.)</p></font></li>
		<li><font size="4">접종 부위 붓기 또는 발적 증상
			<p>접종 부위에 피부색으 변화 없이 부은 느낌이 들거나 실제 부었더라도 활동에 지장이 없는 경우 수일 내 자연적으로
			호전되는 접종 반응 중 하나입니다. <br>
			1단계 : 직경 5cm 이하 <br>
			2단계 : 직경 5.1cm~10cm, 움직이기 불편한 경우<br>
			3단계 : 직경 10cm 이상으로 부었거나 활동이 어려운 경우<br>
			4단계 : 접종 부위 피부색이 검게 또는 보라색 등 어둡게 변한 경우<br>
			(4단계는 의사의 진료가 필요합니다.)<br>
			단계와 상관없이 이러한 증상이 3일 이상 지속되거나 접종부위의 피부색이 검게 또는 보라색으로 어둡게 변한다면
			의사의 진료가 필요합니다.</p></font></li>
</div>
<div>
<hr width="40%" align="left">
	<h4>3. 이상반응 나타날 시 대처법</h4>
	<img src="../../resources/images/vaccination06.png">
	<ul>
		<li><font size="4"><p>이상반응이 일상생활을 방해하지 않는 정도일 경우에는 의료기관을 방문하여 진료를 받을 수 있습니다.<br>
		하지만 아나필락시스 등의 심한 알레르기 반응이 나타날 경우에는 즉시 119로 연락하여 가까운 응급실로 내원해야 합니다.</p></font></li>
	</ul>
</div>
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