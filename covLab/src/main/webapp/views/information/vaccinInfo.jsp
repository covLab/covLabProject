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
 }
 .btn:active {
  transform:translateY(5px);
 }
 
 .btn:hover {
 	background:lightgray;
 	color:black;
 	transition:all 0.2s;
 }
 
 
 /*아코디언 메뉴 부분*/
 dl.faq button {
  margin: 0;
  padding: 0;
  margin-top: 1em;
  font-weight: bold;
  font-size: 110%;
  border: thin solid transparent;
  background-color: transparent;
  padding-left: 0.125em;
}

dl dd {
  margin: 0;
  padding: 0;
  margin-left: 1.5em;
}

dl.faq .desc {
  margin: 0;
  padding: 0.5em;
  font-size: 110%;
  display: none;
  background-color: #fffedb;
}

dl.faq button:hover,
dl.faq button:focus {
  background-color: #eee;
}

dl.faq button:focus {
  border-color: #630;
}

dl.faq button:hover {
  text-decoration: underline;
}

dl.faq button:active {
  background-color: #bbb;
}

dl.faq button[aria-expanded="false"]::before {
  content: url('../images/right-arrow-brown.png');
  padding-right: 0.35em;
}

dl.faq button[aria-expanded="true"]::before {
  content: url('../images/down-arrow-brown.png');
  padding-right: 0.35em;
}

table th {
	background-color:navy;
	color: #fff;
	text-align:center;
	font-size:15pt;
}

table td {
	text-align:left;
	padding:5px;
	border: 1px solid lightgray;
	font-color:black;
}

.a {
	color:white;
}
 
</style>

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
                                    <h4>백신/예방접종 정보</h4>
<hr>

<a class="btn" href="#vaccineinfo02">우리나라에 들어오는 백신</a>
<a class="btn" href="#vaccineinfo03">예방접종 주의사항</a>

<hr>
<!-- 윗부분은 목록을 만들고 a 태그로 각 번호의 목록으로 이동하게 만듬 -->

<!-- 각 목록의 내용을 번호를 붙여서 작성 -->
<h5 id="#vaccineinfo01">1. 백신 접종 현황 (1차 접종 / 백신 접종 완료)</h5>
<p><a href="#top">맨 위로 이동</a></p>
<hr>

<h5 id="vaccineinfo02">2. 우리나라에 들어오는 백신</h5>
<table border="1" height="600" width="1200">
	<tr align="center">
		<th class="a">백신이름</th>
		<th class="a">아스트라제네카</th>
		<th class="a">화이자</th>
		<th class="a">모더나</th>
		<th class="a">얀센</th>
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
<h5 id="vaccineinfo03">3 예방접종 주의사항</h5>
<br>
<div>
	<h4>* 예방접종할 때 주의 사항</h4><br>
	<a href="https://www.youtube.com/watch?v=APOt56usrt4"><img src="../../resources/images/info_video.jpg"></a>
	<br>
	<!-- 아코디언 메뉴 -->
<dl class="faq">
  <dt>
    <button aria-expanded="false" aria-controls="faq1_desc">
      예방접종 받기 위해 주의할 사항은 무엇인가요?
    </button>
  </dt>
  <dd>
    <p id="faq1_desc" class="desc">
    	◎ 건강 상태가 좋을 때 코로나19 백신을 접종받아야 하며, 접종 시 희사 예진을 통해 금기/제외 사항등을 확인하여 예방접종
    	가능여부를 판단해야 합니다. <br>
    	<br>
    	◎ 다음과 같은 경우는 코로나19 예방접종을 받아서는 안됩니다.<br>
    	&nbsp; - 코로나 19 백신 구성 성분에 대한 아나필락시스 같은 심각한 알레르기 반응이 나타난 경우<br> 
    	&nbsp; - 1차 코로나19 예방접종 후 아나필락시스와 같은 심각한 알레르기 반응이 나타난 경우, 첫번째 백신과 동일 백신으로 
    	접종 금지<br>
    	&nbsp; - 1차 바이러스 벡터 코로나19 백신(아스트라제네카, 얀센) 접종 후 혈소판감소성, 혈전증이 발생한 경우, 바이러스 벡터
    	코로나 19 백신 접종 금지<br>
    	&nbsp; - 모세혈관 누출 증후군의 병력이 있는 경우, 아스트라제네카 코로나19 백신 접종 금지<br><br>
    	◎ 다음과 같은 경우는 코로나19 예방접종을 연기합니다.<br>
    	&nbsp; - 코로나19 감염이 의심되는 경우 선별진료소 등을 통해 신속히 진단검사를 받아야 하며, 결과가 나올때까지
    	예방접종을 연기합니다.<br> 
    	&nbsp; - 격리중인 코로나19 환자 및 접촉자는 격리해제 될 때까지 예방접종을 연기합니다.<br> 
    	&nbsp; - 발열(37.5℃ 이상) 등 급성병증이 있는 경우 증상이 없어질때까지 예방접종을 연기합니다. 
    </p>
  </dd>
  
  <dt>
    <button aria-expanded="false" aria-controls="faq2_desc">
      코로나19 접종 후 주의 사항은 무엇인가요?
    </button>
  </dt>
  <dd>
    <p id="faq2_desc" class="desc">
    	◎ 접종 후 15~30분 동안 접종기관에 머무르며 이상반응이 나타나는지 관찰합니다.<br>
    	&nbsp; - 특별한 알레르기가 없었던 경우는 접종 후 15분간 관찰합니다.<br>
    	&nbsp; - 과거에 음식, 약물 등의 알레르기 경험이 있었던 경우에는 30분간 관찰합니다.<br>
    	<br>
    	◎ 귀가 후 최소 3시간 이상 안정을 취하며 이상반응이 나타나는지 주의 깊게 관찰하며, 접종 후 최소 4주간은 특별한 관심을 
    	가지고 관찰하며, 평소와 다른 신체 증상이 나타나면 바로 의사의 진료를 받도록 합니다. <br>
    	<br>
    	◎ 접종당일과 다음날은 과격한 운동 및 음주를 삼가고, 접종당일은 간단한 샤워는 가능하지만 반식욕, 사우나, 찜질방, 수영 등은 피하고, 접종부위는 청결히 유지합니다. <br>
    	<br>
    	◎ 만약 예방접종 후 고열, 두드러기, 호흡곤란, 입술 또는 입안의 부종 등 심한 알레르기 반응 등 평소와 다른 증상이
		 있는 경우에는 즉시 접종기관이나 가까운 외료기관을 방문하여 진료를 받아야 합니다.
    </p>
  </dd>
  
</dl>

</div>
<br>
<p><a href="#top">맨 위로 이동</a></p>

<hr width="40% "align="left">
<div>
	<h4>* 예방접종 이후 이상반응</h4><br>
	<img src="../../resources/images/vaccination02.png" ><br>
	<br>
<table border="1" width="1300" height="600">
	<tr>
		<th class="a" align="center">발열증상</th>
		<td><ul>
			<li>⊙ 접종 후 39℃미만의 발열증상은 정상적인 면역반응일 가능성이 높습니다.</li>
			<li>⊙ 단, 접종 후 39℃ 이상의 고열이 나거나, 2일 이상 증상이 지속될 경우에는 의사의 진료가 필요합니다.</li>
			<li>⊙ 1단계 : 38.4℃ 이하 / 2단계 : 38.5℃~38.9℃ / 3단계 : 38.9℃~40℃ / 4단계 : 40.1 이상</li>
			</ul></td>
	</tr>
	<tr>
		<th class="a" align="center">접종부위 통증</th>
		<td><ul>
			<li>⊙ 접종 당일에서 다음날까지는 접종부위가 불편하고 뻐근한 느낌이 들며, 예방접종 이후 나타날 수 있는 염증반응 입니다.</li>
			<li>⊙ 1단계 : 통증이 나타나지만 약을 복용할 정도는 아님</li>
			<li>⊙ 2단계 : 1~2일 약물을 먹어야 팔을 움직이는데 지장이 없음</li>
			<li>⊙ 3단계 : 3일 이상 통증이 지속되거나 약을 먹어도 통증 조절이 안도어 팔을 움직이기 어려운 경우</li>
			<li>&nbsp; &nbsp;(3단계는 의사의 진료가 필요합니다.)</li>
		</ul></td>
	</tr>
	<tr>
		<th class="a" align="center">접종 부위 붓기/발적증상</th>
		<td><ul>
			<li>⊙ 접종 부위에 피부색으 변화 없이 부은 느낌이 들거나 실제 부었더라도 활동에 지장이 없는 경우 수일 내 자연적으로
			호전되는 접종 반응 중 하나입니다.</li>
			<li>⊙ 1단계 : 직경 5cm 이하</li>
			<li>⊙ 2단계 : 직경 5.1cm~10cm, 움직이기 불편한 경우</li>
			<li>⊙ 3단계 : 직경 10cm 이상으로 부었거나 활동이 어려운 경우</li>
			<li>⊙ 4단계 : 접종 부위 피부색이 검게 또는 보라색 등 어둡게 변한 경우</li>
			<li>&nbsp; &nbsp;(4단계는 의사의 진료가 필요합니다.)</li>
			<li>⊙ 단계와 상관없이 이러한 증상이 3일 이상 지속되거나 접종부위의 피부색이 검게 또는 보라색으로 어둡게 변한다면
			의사의 진료가 필요합니다.</li>
		</ul></td>
	</tr>
	<tr><td align="center" colspan="2">
	⊙ 접종 후 예상 가능한 국소반응으로 접종부위 통증/붓기/발적 등이 있으며, 전신반응으로 발열/피로감/두통/근육통/메스꺼움/
	구토 등이 나타날 수 있습니다.<br>
	&nbsp; &nbsp; (접종 후 흔히 나타나는 반응으로 대부분 2~3일 이내 증상이 사라집니다.)<br>
	⊙ 드물게 호흡곤란, 얼굴의 붓기, 눈/입술/입안의 부종, 몸 전체의 발진, 빠른 심장박동, 현기증, 쇼크 등의 증상을 동반한
	아나필락시스와 같은 심각한 알레르기 반응이 나타날 수 있습니다. <br>
	</td></tr>
</table>
</div>
<br>


<div>
	<h4>** 백신별 예방접종 후 이상반응 **</h4>
		<table border="1" width="1300" height="700">
			<tr>
				<th class="a" rowspan="3">구분</th>
				<th class="a" colspan="2">전달체 백신(바이러스 벡터)</th>
				<th class="a" colspan="2">핵산 백신(mRNA)</th>
			</tr>
			<tr>
				<td>아스트라제네카</td>
				<td>얀센</td>
				<td>화이자</td>
				<td>모더나</td>
			</tr>
			<tr>
				<td>2021.02.10/05.21 허가</td>
				<td>2021.04.07 허가</td>
				<td>2021.03.05 허가</td>
				<td>2021.05.21허가</td>
			</tr>
			<tr>
				<td>매우 흔하게 (≥1/10)</td>
				<td>주사부위 압통,<br>
				주사부위 통증,<br>
				주사부위 온감,<br>
				주사부위 소양증/멍<br>
				오심, 피로, 병감(권태),<br>
				오한, 두통, 열감(발열),<br>
				근육통, 관절통</td>
				<td>주사부위 통증, 오심, 피로 <br>
				근육통, 두통</td>
				<td>주사부위 통증, <br>
				주사부위 종창, 설사, 피로,<br>
				오한, 발열, 관절통, 근육통,<br>
				두통</td>
				<td>주사부위 압통,<br>
				주사부위 종창, 림프절병증,<br>
				오심/구토, 피로, 오한, 발열,<br>
				근육통, 두통, 관절통</td>
			</tr>
			<tr>
				<td>흔하게 (≥ 1/100 이고 ＜ 1/10)</td>
				<td>주사부위 종창,<br>
				주사부위 홍반, 구토, 설사,<br>
				사지통증, 열(발열),<br>
				인플루엔자 유사 질병 </td>
				<td>주사부위 홍반,<br>
				주사부위 종창, 발열, 오한,<br>
				관절통, 기침</td>
				<td>주사부위 발적, 구토,<br>
				오심, 통증</td>
				<td>주사부위 홍반,<br>
				주사부위 두드러기,<br>
				주사부위 발진, 발진</td>
			</tr>
			<tr>
				<td>흔하지 않게 (≥ 1/1,000 이고 ＜ 1/100)</td>
				<td>림프절병증, 복통, 식욕감소,<br>
				어지러움, 졸림, 다한증,<br>
				소양증, 발진, 두드러기</td>
				<td>발진, 다한증, 무력증, 권태,<br>
				근육쇠약, 사지통증, 등통증,<br>
				진전, 재채기, 구인두 통증</td>
				<td>주사부위 소양증/온감/부종/홍반,<br>
				림프절비대, 상복부통증, 불면, 사지통증<br>
				권태 무력증, 코막힘, 발진, 인플루엔자 유사증상,<br>
				식욕감퇴, 등허리 통증, 근골격경직,<br>
				어지러움, 기면, 구인두 통증, 다한증, 야간발한</td>
				<td>주사부위 소양증</td>
			</tr>
			<tr>
				<td>드물게 (≥ 1/10,000 이고 ＜ 1/1,000)</td>
				<td></td>
				<td>과민성, 두드러기</td>
				<td>급성말초 안면마비</td>
				<td>급성말초 안면마비 안면종창</td>
			</tr>
			<tr>
				<td>매우 드물게(＜ 1/10,000)</td>
				<td>혈소판감소성 혈전증 (TTS)</td>
				<td>혈소판감소성 혈전증 (TTS)</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>빈도불명</td>
				<td>아나필락시스, 과민증, <br>
				혈관부종</td>
				<td>아나필락시스</td>
				<td>아나필락시스</td>
				<td>아나필락시스, 과민증</td>
			</tr>
			<tr>
				<td>안전성 서한항목</td>
				<td>모세혈관 누출 증후군</td>
				<td>모세혈관 누출 증후군</td>
				<td>심근염/심낭염</td>
				<td>심근염/심낭염</td>
			</tr> 
			<tr>
				<td>국외 안전성 평가</td>
				<td>길랑-바레증후군</td>
				<td>길랑-바레증후군</td>
				<td></td>
				<td></td>
			</tr>	
		</table>
</div>
<br>
<br>
<p><a href="#top">맨 위로 이동</a></p>


<div>
<hr width="40%" align="left">
	<h4>* 이상반응 나타날 시 대처법</h4><br>
	<img src="../../resources/images/vaccination06.png">
	<br>
	<br>
	<ul>
		<li><font size="4">
			<p> ● 이상반응이 의심되는 경우 예방접종 도우미 누리집(https://nip.kdca.go.kr)을 통해 접종 받은 자 또는 보호자가 이상반응을
			체크하고 대응방법을 안내 받을 수 있습니다. <br>
			<br>
			● 코로나 19 백신 접종 후 이상반응 발생시 증상완화를 위한 조치 <br>
			&nbsp; - 예방접종 후 접종부위 통증이 있는 경우 통증 부위에 깨끗한 수건 등으로 냉찜질을 해주시기 바랍니다.<br>
			&nbsp; - 접종 후 발열이 있는 경우에는 수분을 충분히 섭취하고 쉬어 주시기 바라며, 발열로 인한 불편함이 있는 경우에는
			해열/진통제가 도움이 될 수 있습니다.<br><br>
			● 다음과 같은 증상 발생시 의사의 진료를 받아야 합니다.
			<table border="1" width="1000" height="400">
			 <tr><th class="a">⊙ 다음과 같은 경우에는 접종기관 또는 가까운 의료기관을 방문하여 진료 받으셔야 합니다.<br></th></tr>
			 <tr><td>&nbsp; - 바이러스 벡터 백신(아스트라제네카, 얀센) 접종 후 아래의 증상이 있는 경우 <br>
			 &nbsp;&nbsp; -  심하거나 2일 이상 지속적인 두통이 발생하며, 진통제에 반응하지 않거나 조절되지 않는 경우 또는
			 구토를 동반하거나 시야가 흐려지는 경우<br>
			 &nbsp;&nbsp; - 호흡곤란, 흉통, 지속적인 복부 통증, 팔/다리 붓기와 같은 증상이 나타난 경우<br>
			 &nbsp;&nbsp; - 접종부위가 아닌 곳에서 멍이나 출형이 생긴 경우<br>
			 &nbsp;&nbsp; - 급격한 팔/다리의 부종, 갑작스러운 체중증가<br>
			 &nbsp; - mRAN 백신(화이자, 모더나) 접종 후 아래의 증상이 새롭게 발생하거나 악화되어 지속되는 경우 <br>
			 &nbsp;&nbsp; - 가슴통증, 압박감, 불편감, 호흡곤란이나 숨가쁨, 호흡시 통증, 심장이 빠르게 뛰거나 두근거림, 실신<br>
			 &nbsp; - 기타 의사의 진료가 필요한 경우 <br>
			 &nbsp;&nbsp; - 코로나 19 예방접종 후 갑자기 기운이 떨어지거나 평소와 다른 이상증상이 나타난 경우<br>
			 &nbsp;&nbsp; - 접종 부위의 통증/붓기/발적이 48시간 이후에도 악화되는 경우<br>
			 </td></tr>
			<tr><th class="a">⊙ 다음과 같은 경우에는 119로 연락하거나 가까운 응급실로 내원하시기 바랍니다.<br></th></tr>
			 <tr><td>&nbsp; - 예방접종 후 숨쉬기 곤란하거나 심하게 어지러운 경우<br>
			 &nbsp; - 입술/얼굴이 붓거나 온몸에 심한 두드러기 증상이 나타나는 경우<br>
			 &nbsp; - 갑자기 의식이 없거나 쓰러지는 경우
			 </td></tr><br>
			 <br>
			 
			</p></font>
			</table>
		</li>
	</ul>
</div>
<p><a href="#top">맨 위로 이동</a></p>
<hr>
  
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
            
<!-- -------------------------------------------------------------------------------- -->









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

<!-- 아코디언메뉴 부분 -->
<script>
/*
*   This content is licensed according to the W3C Software License at
*   https://www.w3.org/Consortium/Legal/2015/copyright-software-and-document
*
*   File:   ButtonExpand.js
*
*   Desc:   Checkbox widget that implements ARIA Authoring Practices
*           for a menu of links
*/

/*
*   @constructor ButtonExpand
*
*
*/
var ButtonExpand = function (domNode) {

  this.domNode = domNode;

  this.keyCode = Object.freeze({
    'RETURN': 13
  });
};

ButtonExpand.prototype.init = function () {

  this.controlledNode = false;

  var id = this.domNode.getAttribute('aria-controls');

  if (id) {
    this.controlledNode = document.getElementById(id);
  }

  this.domNode.setAttribute('aria-expanded', 'false');
  this.hideContent();

  this.domNode.addEventListener('keydown',    this.handleKeydown.bind(this));
  this.domNode.addEventListener('click',      this.handleClick.bind(this));
  this.domNode.addEventListener('focus',      this.handleFocus.bind(this));
  this.domNode.addEventListener('blur',       this.handleBlur.bind(this));

};

ButtonExpand.prototype.showContent = function () {

  if (this.controlledNode) {
    this.controlledNode.style.display = 'block';
  }

};

ButtonExpand.prototype.hideContent = function () {

  if (this.controlledNode) {
    this.controlledNode.style.display = 'none';
  }

};

ButtonExpand.prototype.toggleExpand = function () {

  if (this.domNode.getAttribute('aria-expanded') === 'true') {
    this.domNode.setAttribute('aria-expanded', 'false');
    this.hideContent();
  }
  else {
    this.domNode.setAttribute('aria-expanded', 'true');
    this.showContent();
  }

};

/* EVENT HANDLERS */

ButtonExpand.prototype.handleKeydown = function (event) {

  console.log('[keydown]');

  switch (event.keyCode) {

    case this.keyCode.RETURN:

      this.toggleExpand();

      event.stopPropagation();
      event.preventDefault();
      break;

    default:
      break;
  }

};

ButtonExpand.prototype.handleClick = function (event) {
  this.toggleExpand();
};

ButtonExpand.prototype.handleFocus = function (event) {
  this.domNode.classList.add('focus');
};

ButtonExpand.prototype.handleBlur = function (event) {
  this.domNode.classList.remove('focus');
};

/* Initialize Hide/Show Buttons */

window.addEventListener('load', function (event) {

  var buttons =  document.querySelectorAll('button[aria-expanded][aria-controls]');

  for (var i = 0; i < buttons.length; i++) {
    var be = new ButtonExpand(buttons[i]);
    be.init();
  }

}, false);
</script>


</body>

</html>