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
 }
 .btn:active {
  transform:translateY(5px);
 }
<<<<<<< HEAD
=======
 
 .btn:hover {
 	background:lightgray;
 	color:black;
 	transition:all 0.2s;
 }
 
 .t{
 	width: 1000px;
 	height: 250px;
 	background:navy;
 	text-align:center;
 	transition:all 0.2s;
 	
 }
 
 .c1 {
 	font-size:15pt;
 	font-color:white;
 }
  .c2 {
 	font-size:15pt;
 	font-color:white;
 }
  .c3 {
 	font-size:15pt;
 	font-color:white;
 }
  .c4 {
 	font-size:15pt;
 	font-color:white;
 }
  .c5 {
 	font-size:15pt;
 	font-color:white;
 }
  .c6 {
 	font-size:15pt;
 	font-color:white;
 }
  .c7 {
 	font-size:15pt;
 	font-color:white;
 }
  .c8 {
 	font-size:15pt;
 	font-color:white;
 }
  .c9 {
 	font-size:15pt;
 	font-color:white;
 }
 
 
.c1:hover {
 	background:lightgray;
 	color:black;
 	transition:all 0.2s;
 }
.c2:hover {
 	background:lightgray;
 	color:black;
 	transition:all 0.2s;
 }
.c3:hover {
 	background:lightgray;
 	color:black;
 	transition:all 0.2s;
 }
.c4:hover {
 	background:lightgray;
 	color:black;
 	transition:all 0.2s;
 }
.c5:hover {
 	background:lightgray;
 	color:black;
 	transition:all 0.2s;
 }
   .c6:hover {
 	background:lightgray;
 	color:black;
 	transition:all 0.2s;
 }
.c7:hover {
 	background:lightgray;
 	color:black;
 	transition:all 0.2s;
 }
.c8:hover {
 	background:lightgray;
 	color:black;
 	transition:all 0.2s;
 }
.c9:hover {
 	background:lightgray;
 	color:black;
 	transition:all 0.2s;
 }
 
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
 
>>>>>>> 0be9b48c194e881069ede8d8b7f9d10197c2d038
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
                                    <h4>QnA</h4>
<hr>

<<<<<<< HEAD
<a class="btn" href="#qna01">코로나19 백신 개요</a>
<a class="btn" href="#qna02">코로나19 예방접종 사업</a>
<a class="btn" href="#qna03">백신 관련</a>
<a class="btn" href="#qna04">백신의 안전성과 이상반응</a>
<a class="btn" href="#qna05">코로나19 예방접종 관련 피해보상</a>
<a class="btn" href="#qna06">인과성 불충분한 중증 환자 의료비 지원사업</a>
<a class="btn" href="#qna07">75세 이상 어르신 및 노인시설 예방접종</a>
<a class="btn" href="#qna08">시스템및 예방접종 기록</a>
=======
<table border="1"  class="t">
	<tr>
		<td class="c1" ><a href="#qna01">코로나란?</a></td>
		<td class="c2" ><a href="#qna02">코로나의 증상/검사</a></td>
		<td class="c3" ><a href="#qna03">치료 및 예방</a></td>
	</tr>
	<tr>
		<td class="c4" ><a href="#qna04">접촉자 및 확진환자</a></td>
		<td class="c5" ><a href="#qna05">격리 및 격리해제</a></td>
		<td class="c6" ><a href="#qna06">백신 관련</a></td>
	</tr>
	<tr>
		<td class="c7" ><a href="#qna07">예방접종 이상반응</a></td>
		<td class="c8" ><a href="#qna08">코로나19 예방접종 관련 피해보상</a></td>
		<td class="c9" ><a href="#qna09">인과성 불충분한 중증 환자 의료비 지원사업</a></td>
	</tr>
</table>

<a class="btn" href="#qna01">코로나란?</a>
<a class="btn" href="#qna02">코로나의 증상/검사</a>

<a class="btn" href="#qna03">치료 및 예방</a>
<a class="btn" href="#qna04">접촉자 및 확진환자</a>
<a class="btn" href="#qna05">격리 및 격리해제</a>

<a class="btn" href="#qna06">백신 관련</a>
<a class="btn" href="#qna07">예방접종 이상반응</a>

<a class="btn" href="#qna08">코로나19 예방접종 관련 피해보상</a>
<a class="btn" href="#qna09">인과성 불충분한 중증 환자 의료비 지원사업</a>
>>>>>>> 0be9b48c194e881069ede8d8b7f9d10197c2d038
<hr>
<!-- 윗부분은 목록을 만들고 a 태그로 각 번호의 목록으로 이동하게 만듬 -->

<!-- 각 목록의 내용을 번호를 붙여서 작성 -->
<h5 id="qna01">1. 코로나19 백신 개요</h5>
<p>목록 버튼 누르면 작은 목록 나오게 하고 싶은데 어떻게 해야할까?</p>
<p>목록 버튼 누르면 작은 목록 나오게 하고 싶은데 어떻게 해야할까?</p>
<p><a href="#top">맨 위로 이동</a></p>
<hr>
<<<<<<< HEAD
<h5 id="qna02">2. 코로나19 예방접종 사업</h5>
<p>예방접종 하면 좋겠죠.. 건강할거에요.. 그럴거에요...</p>
<p>예방접종 하면 좋겠죠.. 건강할거에요.. 그럴거에요...</p>
=======

<!-- qna02 버튼 내용-------------------------------------------------------- -->
<h5 id="qna02">2.코로나의 증상/검사</h5>
 <dl class="faq">
   <dt>
    <button aria-expanded="false" aria-controls="faq9_desc">
      무증상 환자도 다른 사람을 전염시킬 수 있나요?
    </button>
  </dt>
  <dd>
    <p id="faq9_desc" class="desc">
    	◎ 코로나 19의 주요 전파 방법은 코로나 19에 감염된 사람이 숨을 내쉬거나, 기침/재채기를 할 때 생성되는 호흡기 비말이 근처에
    	있는 사람들의 호흡기에 직접 닿거나, 비말이 묻은 손 또는 물건 등을 만진 뒤 눈/코/입을 만질 때 점막을 통해 전염되는 것입니다.<br>
    	<br>
    	◎ 코로나 19의 많은 환자들은 가벼운 증산만을 경험하지만, 증상이 가벼운 환자의 일부는 질환의 초기라서 증상이 약하게 나타나는
    	것일 수 있습니다. 경미한 기침 증상만 있거나, 증상을 잘 느끼지 못하는 사람의 경우에도 전염이 가능하다고 알려져 있습니다.<br>
    	<br>
    	◎ 무증상의 경우에도 전염이 가능하다는 연구가 있으나 아직까지 정확하게 알려지지 않아 추가 연구결과 발표시 공유할 예정입니다.
    </p>
  </dd>
     <dt>
    <button aria-expanded="false" aria-controls="faq10_desc">
      코로나 19에는 어떤 사람들이 더 위험한가요?
    </button>
  </dt>
  <dd>
    <p id="faq10_desc" class="desc">
    	◎ 코로나 19는 아직까지 명확하게 알려지지 않았지만, 지금까지 연구될 결과에 의하면 65세 이상의 노인, 장기요양 시설 생활자,
    	기저질환(만성 폐질환, 천식, 심폐질환, 면역억제자, 비만, 당뇨병, 만성 신장 질환, 만성 간질환, 흡연자 등)을 가진 사람들에게 
    	더 위험할 수 있습니다.
    </p>
  </dd>  
       <dt>
    <button aria-expanded="false" aria-controls="faq11_desc">
      누가 검사 받을 수 있나요?
    </button>
  </dt>
  <dd>
    <p id="faq11_desc" class="desc">
    	◎ 본 지침 상의 사례 정의에 따라 의사환자 및 조사대상 유증상자로 분류되는 경우에는 확진검사를 받을 수 있습니다.<br>
    	<br>
    	◎ 중증응급환자(중증도 등급기준 1 및 2 등급) 또는 6시간 이상 지연할 수 없는 응급수술이 필요한 중증응급의심환자(중증도 등급기준 3등급)의
    	경우 응급 선별검사 또는 확진검사를 받을 수 있습니다. <br>
    	<br>
    	<table border="1">
    		<tr><td>의사환자</td><td>확진환자와 접촉한 후 14일 이내에 코로나 19 임상증상이 나타난 자</td></tr>
    		<tr><td rowspan="3">조사대상 유증상자</td><td>1. 의사의 소견에 따라코로나 19 임상증상으로 코로나 19가 의심되는 자</td></tr>
    		<tr> <td>2. 해외 방문력이 있으며 귀국 후 14일 이내에 코로나 19 임상증상이 있는 자</td></tr>
    		<tr> <td>3. 코로나 19 국내 집단발생과 역학적 연관성이 있어 진단검사가 필요하다고 인정되는 자</td></tr>
    		<tr><td colspan="2">주요 임상증상 : 발열(37.5℃ 이상), 기침, 호흡곤란, 오한, 근육통, 두통, 인후통, 후각/미각 소실 또는 폐렴 등</td></tr>
		</table> <br> <br>
		◎ 다음에 해당하는 경우 적극적 검사 권고 (조사대상 유증상자 1로 신고)<br>
		1. 가족(동거인) 또는 동일시설 생활자가 코로나 19 임상증상이 있는 경우<br>
		2. 해외에서 입국한지 14일 이내의 가족(동거인), 친구, 지인과 접촉한 경우<br>
		3. 지역사회 유행 양상 고려하여 확진자가 발생한 기관 또는 장소 방문력이 있는 경우<br>
		4. 응급선별검사, 신속항원검사 또는 자가검사 결과 양성인 경우
    </p>
  </dd> 
     <dt>
    <button aria-expanded="false" aria-controls="faq12_desc">
      검사는 어디에서 받을 수 있나요?
    </button>
  </dt>
  <dd>
    <p id="faq12_desc" class="desc">
    	◎ 검체 채취가 가능한 선별진료소 및 일반 의료기관에서 검사를 받으실 수 있습니다. <br>
    	<br>
    	◎ 질병관리청 홈페이지에서 진료 가능한 선별진료소를 확인할 수 있습니다.<br>
    	&nbsp; ▶ 질병관리청 홈페이지 -> 코로나 바이러스 감염증-19 -> 선별진료소 및 국민안심병원 찾기<br>
    	<br>
    	◎ 자세한 문의사항은 질병관리청 콜센터(☎1339, 지역번호 + 120) 또는 지역 보건소와 상담해 주시기 바랍니다.
    </p>
  </dd> 
       <dt>
    <button aria-expanded="false" aria-controls="faq13_desc">
      검사는 어떻게 이루어지나요?
    </button>
  </dt>
  <dd>
    <p id="faq13_desc" class="desc">
    	◎ (검체 채취)검체는 의사, 간호사, 임상병리사가 지정된 장소(선별진료소 등)에서 채취합니다. 필수 검체는 상기도 검체이며,
    	하기도 검체는 가래가 있는 환자에서 채취합니다. 검체 채취시 불편감/통증이 있을 수 있습니다.<br>
    	&nbsp; ▶ 간호사와 임상별리사는 의사의 지도하에 시행
    	<br>
    	<table border="1">
    		<tr>
    			<td>상기도 검체</td>
    			<td>비인두 또는 구인두 도말물 채취<br>
    			- (비인두도말) 콧구멍 깊숙이 면봉을 삽입하여 분비물 채취<br>
    			- (구인두도말) 면봉으로 목구멍 안쪽 벽의 분비물을 긁어서 채취</td>
    		</tr>
    		<tr>
    			<td>하기도 검체</td>
    			<td>타액 등이 포함되지 않도록 깊이 기침하여 가래 채취<br>
    			- 가래가 없는 경우는 억지로 맽으면 에어로졸 발생 가능성이 있으므로 가래 유도 금지</td>
    		</tr>
    	</table>
    	<br>
    	◎ (유전자 검사) 검사가 가능한 선별진료소는 직접 검사하고, 그렇지 않은 경우는 수탁검사기관으로 검사를 의뢰합니다.
    </p>
  </dd>   
  <dt>
    <button aria-expanded="false" aria-controls="faq14_desc">
      검사(유전자 검사) 시간은 얼마나 걸리나요?
    </button>
  </dt>
  <dd>
    <p id="faq14_desc" class="desc">
    	◎ 검사는 6시간 정도 소요되지만 검체 이송 및 대기시간 등을 고려하면 검사 후 1~2일 이내에 결과를 확인할 수 있습니다.
    </p>
  </dd> 
  <dt>
    <button aria-expanded="false" aria-controls="faq15_desc">
      코로나 19 PCR 검사에서 음성이 나온 뒤 다시 양성으로 나올 수 있나요?
    </button>
  </dt>
  <dd>
    <p id="faq15_desc" class="desc">
    	◎ PCR 검사가 음성 결과가 나왔다면, 검사 대장자의 검체에서 코로나 19 바이러스가 검출되지 않았음을 의미합니다.<br>
    	<br>
    	◎ 검체의 질이나 양이 부적합한 경우, 감염의 초기나 너무 늦은 시기에 검체가 채취된 경우, 검체가 부적합하게 배송되거나 다루어진
    	경우, 검사의 기술적 오류 등으로 인해 코로나 19 환자에서 결과가 음성으로 나올 수 있습니다. 이후 다시 시행된 검사에서 다시 
    	양성으로 판정 될 수 있습니다.
    </p>
  </dd>   
  
  <dt>
    <button aria-expanded="false" aria-controls="faq16_desc">
      검사 비용은 어떻게 되나요?
    </button>
  </dt>
  <dd>
    <p id="faq16_desc" class="desc">
    	◎ 의사 환자 및 조사대상 유증상자로 신고한 경우는 검사비용의 본인부담금이 발생하지 않습니다. 다만, 일반진찰, X-ray 검사 등
    	다른 진료비용은 본인이 부담합니다.<br>
    	<br>
    	◎ 단, 응급상황에서 실시한 응급용 선별검사 또는 확진검사의 경우 ▶ 환자 본인부담금이 발생합니다.
    	&nbsp;  ▶ KTAS 1.2 등급 또는 KTAS 3 등급 중 6시간 이상 지연할 수 없는 응급수술이 필요한 경우 <br>
    	 <br>
    	◎ 응급용 선별검사의 본인 부담률은 법령에서 정한 해당 환자의 본인 부담률을 따릅니다. <br>
    	&nbsp;  ▶ 사회적 거리두기 단계, 역학적 연관성, 증상 유무, 지역과 관계없이 보건소 선별진료소 및 임시선별진료검사소에서
    	무료로 코로나 19 진단검사 가능
    </p>
  </dd> 
  
   <dt>
    <button aria-expanded="false" aria-controls="faq20_desc">
      선별진료소 검체 채취 시에 보호자가 동행하여 검사를 받을 수 있나요?
    </button>
  </dt>
  <dd>
    <p id="faq20_desc" class="desc">
    	◎ 선별진료소에서 소아, 발달장애인 등 보호자 동행이 필요한 경우 보호자가 검체 채취실에 동행할 수 있으며, 이 경우 보호자는
    	마스크 착용 등 감염예방수칙을 준수하여 동행이 가능합니다.
    </p>
  </dd>
</dl>
<p><a href="#top">맨 위로 이동</a></p>
<hr>

<!-- qna03 버튼 내용-------------------------------------------------------- -->
<h5 id="qna03">3. 치료 및 예방</h5>
<dl class="faq">
  <dt>
    <button aria-expanded="false" aria-controls="faq25_desc">
      코로나 19의 치료법이 있나요?
    </button>
  </dt>
  <dd>
    <p id="faq25_desc" class="desc">
    	◎ 대증 치료로 코로나 바이러스 감염증-19의 증상을 완화시킬 수 있지만, 아직까지 질병을 예방하거나 치료하는 것으로 확실하게
    	밝혀진 특이 치료제는 없습니다. <br>
    	<br>
    	◎ 최근 FDA에서 "렘데시비르" 라는 약이 치료제로 긴급승인 되어 사용 중입니다.
    </p>
  </dd>
  
   <dt>
    <button aria-expanded="false" aria-controls="faq26_desc">
      코로나 19에서 회복되면 면역이 생기나요?
    </button>
  </dt>
  <dd>
    <p id="faq26_desc" class="desc">
    	◎ 아직까지 코로나 19에 감염되었던 사람이 다시 감염될 수 잇는지에 대한 정보는 부족합니다. 재감염이 가능한지에 대한 연구가
    	전세계 여러곳에서 진행중입니다.
    </p>
  </dd>
  
    <dt>
    <button aria-expanded="false" aria-controls="faq27_desc">
      코로나 19에로 확진되면 국가에서 치료비를 지원해주나요?
    </button>
  </dt>
  <dd>
    <p id="faq27_desc" class="desc">
    	◎ [감염병의 예방 및 관리에 관한 법률]에 의해 국가 빛 지자체에서 부담합니다.<br>
    	<br>
    	◎ 단, 담당의사/지자체의 지시에 협조하지 않은 경우 격리입원치료비 지원이 제한됩니다.
    </p>
  </dd>
 </dl>
 <p><a href="#top">맨 위로 이동</a></p>
<hr>

<!-- qna04 버튼 내용-------------------------------------------------------- -->
<h5 id="qna04">4. 접촉자 및 확진환자</h5>
<dl class="faq">
  <dt>
    <button aria-expanded="false" aria-controls="faq28_desc">
      접촉자 범위는 어떻게 설정하나요?
    </button>
  </dt>
  <dd>
    <p id="faq28_desc" class="desc">
    	◎ 접촉자 범위는 시/도 즉각대응팀이 노출정도를 평가하여 판단하게 됩니다. <br>
    	<br>
    	◎ 접촉자는 확진환자의 증상 및 마스크 착용 여부, 노출력(접촉 장소/접촉기간 등) 등을 고려하여 증상발생 2일전(무증상자의
    	경우 검체 채취일 기준 2일 전) 부터 접촉자의 범위를 설정하고 있습니다.
    </p>
  </dd>
  
   <dt>
    <button aria-expanded="false" aria-controls="faq29_desc">
      접촉자가 되면 어떻게 되나요?
    </button>
  </dt>
  <dd>
    <p id="faq29_desc" class="desc">
    	◎ 확진자와의 최종으로 접촉한 날로부터 14일동안 격리(자가, 시설, 병원)를 실시합니다. <br>
    	<br>
    	◎ 시/도지사 또는 시장/군수/구청장은 접촉자에게 격리통지서를 발부하고, 생활수칙을 안내하여, 1:1로 담당자를 지정하여
    	격리 해제시까지 매일 2회 유선 연락하여 발열 또는 호흡기 증상여부를 확인합니다.
    </p>
  </dd>
  
   <dt>
    <button aria-expanded="false" aria-controls="faq30_desc">
      자가격리 시 주의할 사항은 무엇인가요?
    </button>
  </dt>
  <dd>
    <p id="faq30_desc" class="desc">
    	◎ 자가격리 대상자는 독립된 공간에서 혼자 생활하며, 방문은 닫은채로 창문을 열어 자주 환기시키고, 가능한 혼자만 사용할 수 
    	있는 화장실과 세면대가 있는 공간을 사용하여야 합니다. <br>
    	<br>
    	◎ 공용화장실, 세면대를 사용한다면 사용 후 소독 후 다른 사람이 사용하도록 합니다. <br>
    	<br>
    	◎ 자가격리 대상자의 생활 준수사항으로는 개인용 수건, 식기류, 휴대전화 등 개인물품을 사용하도록 하고 있으며 의복 및 침구류는
    	단독 세탁하고 식사는 혼자서 하며 식기류 등은 별로 분리하여 씻어야 합니다.
    </p>
  </dd>
  
   <dt>
    <button aria-expanded="false" aria-controls="faq31_desc">
      자택 내 독립된 공간 확보가 안 될 경우 어떻게 격리하나요?
    </button>
  </dt>
  <dd>
    <p id="faq31_desc" class="desc">
    	◎ 자택 내 독립된 공간 확보가 어렵거나 추가적인 도움이 필요한 경우에는 지자체에서 적절한 격리 장소에 시설격리를 하도록
    	하고 있습니다.
    </p>
  </dd>
  
   <dt>
    <button aria-expanded="false" aria-controls="faq32_desc">
      자가격리를 하면 생활지원을 해 주나요?
    </button>
  </dt>
  <dd>
    <p id="faq32_desc" class="desc">
    	◎ 자가격리에 따른 생활지원, 유급휴가 등을 지원하고 있습니다. 자세한 사항은 관할 읍, 면, 동사무소에 문의하시기 바랍니다.
    	&nbsp; ▶ 단, 해외 입국자 격리 시 생활지원비는 미지원이나 격리기간 중 생필품 지원 등 최소생활이 보장될 수 있도록 지원함.
    </p>
  </dd>
  
   <dt>
    <button aria-expanded="false" aria-controls="faq33_desc">
      자가격리 중 외출한 사람들에 대한 법적 처벌기준이 있나요?
    </button>
  </dt>
  <dd>
    <p id="faq33_desc" class="desc">
    	◎ [감염병의 예방 및 관리에 관한 법률] 제 79조의 3에 따라 1년 이하의 징역 또는 1천만원 이하의 벌금형에 처할 수 있습니다.
    </p>
  </dd>
  
   <dt>
    <button aria-expanded="false" aria-controls="faq34_desc">
      외국인인데, 자가격리 중이지만 증상도 없고, 본국으로 돌아가고 싶은데 출국할 수 있나요?
    </button>
  </dt>
  <dd>
    <p id="faq34_desc" class="desc">
    	◎ 집/숙소에서 자가격리 중인 장기체류 외국인은 공익적/인도주의적 사유(임종/장레식)등 해당 지자체장이 승인하는 사유에 
    	해당하는 경우, 진단검사(입국 후 1일 이내 검사)에서 음성이면 출국 가능합니다.<br>
    	<br>
    	◎ 임시 생활시설에서 시설격리 중인 단기체류 외국인은 원칙적으로 중도 출국이 제한됩니다. 다만, 건강상의 이유나 
    	인도주의적 사유(임종/장례식) 등 인도적 사유 발생으로 국적국가 또는 출발 국가로 출국하는 경우 시설 단장의 승인 하에 
    	출국이 가능합니다.
    </p>
  </dd>
</dl> 
>>>>>>> 0be9b48c194e881069ede8d8b7f9d10197c2d038
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
<<<<<<< HEAD
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
=======

<!-- qna07 버튼 내용-------------------------------------------------------- -->
<h5 id="qna07">7. 예방접종 이상반응</h5>
<dl class="faq">
  
  <dt>
    <button aria-expanded="false" aria-controls="faq50_desc">
      코로나 19 예방접종 후 열이 나고 피로감이 생겼는데 어떻게 해야 하나요?
    </button>
  </dt>
  <dd>
    <p id="faq50_desc" class="desc">
    	◎ 예방접종 후 발열, 피로감, 접종부위 통증, 발적 등 이상반응이 나타날 수 있고, 2~3일 내에 증상이 사라집니다.<br>
    	<br>
    	◎ 다만 이러한 상태가 48시간 이상 지속되는 경우 의료기관을 방문하시기 바랍니다.
    </p>
  </dd> 
  
  <dt>
    <button aria-expanded="false" aria-controls="faq51_desc">
      예방접종 후 해열/진통제는 무엇을 복용해야 하나요?
    </button>
  </dt>
  <dd>
    <p id="faq51_desc" class="desc">
    	◎ 해열/진통제를 복용하는 경우 가급적 염증을 제거하는 효과가 없는 아세트아미노펜 성분의 의약품을 복용하시기 바랍니다.<br>
    	<br>
    	◎ 아세트아미노펜 성분에 대한 알레르기 반응 이력이 있는 경우 다른 성분의 해열진통제 복용에 대해 의사와 상담하시기 바랍니다.
    </p>
  </dd>
  
  <dt>
    <button aria-expanded="false" aria-controls="faq52_desc">
      아나필락시스 증상은 어떠하고, 처치는 어떻게 하야 하나요?
    </button>
  </dt>
  <dd>
    <p id="faq52_desc" class="desc">
    	◎ 아나필락시스느 매우 드물지만, 갑자기 발생하는 심각한 알레르기 반응으로 피부, 호흡기, 순환기, 신경계 및 위장관계 증상이 
    	나타납니다.<br>
    	&nbsp; - 피부가 전신적으로 붉어지거나 두드러기가 생김, 얼굴 부종<br>
    	&nbsp; - 목이 붓고 조이는 것 같음, 말하기 힘들고 목소리가 잠김, 숨이 차고 쌕쌕거림<br>
    	&nbsp; - 어지럽거나 의식이 없음, 창백하거나 늘어짐<br>
    	<br>
    	◎ 아나필락시스는 생명을 위협할 수도 있으므로 빠른 응급처치가 필요하며, 위 증상이 나타나면 즉시 119로 연락하거나 
    	가까운 응급실로 내원하시기 바랍니다.
    </p>
  </dd>  
</dl> 
<p><a href="#top">맨 위로 이동</a></p>
<hr>

<!-- qna08 버튼 내용-------------------------------------------------------- -->
<h5 id="qna08">8. 코로나 19 예방접종 관련 피해보상</h5>
<dl class="faq">
  <dt>
    <button aria-expanded="false" aria-controls="faq53_desc">
      코로나19 예방접종 후 발생한 피해에 대한 보상은 어떤 종류가 있나요?
    </button>
  </dt>
  <dd>
    <p id="faq53_desc" class="desc">
    	◎ 진료비 및 정액간병비, 장애일시 보상금, 사망일시 보상금 및 장제비가 포함됩니다.
    </p>
  </dd>
  
  <dt>
    <button aria-expanded="false" aria-controls="faq54_desc">
      국가예방접종 피해보상은 언제까지 신청해야 하나요?
    </button>
  </dt>
  <dd>
    <p id="faq54_desc" class="desc">
    	◎ 국가예방접종 피해보상은 [감염병 예방 및 관리에 관한 법률] 시행령 제 29조에 따라 이상반응 발생일로부터 5년 이내에
    	신청해야 합니다. 사망의 경우 사망일로부터 장애진단을 받은 경우는 진단일로부터 5년 이내에 신청해야 합니다.
    </p>
  </dd>
  
  <dt>
    <button aria-expanded="false" aria-controls="faq55_desc">
      코로나19 1차 예방접종 후 이상반응으로 피해보상을 받은 사람이, 2차 예방접종 후 동일한 이상반응으로 피해보상을 신청할
      경우 재보상이 가능한가요?
    </button>
  </dt>
  <dd>
    <p id="faq55_desc" class="desc">
    	◎ 네, 보상이 가능합니다.<br>
    	&nbsp; ※ 다만, 1/2차 에방접종 피해보상 신처금액 합산 총액이 30만원 이상인 경우에는, 2차 예방접종 피해보상 신청금액이
    	30만원 미만이라도 2차 예방접종 피해보상 신청시 기존 본인부담금 30만원 이상 피해보상 절차를 적용받게 됩니다.
    </p>
  </dd>
  
  <dt>
    <button aria-expanded="false" aria-controls="faq56_desc">
      예방접종 후 이상반응으로 인한 피해보상 신청을 본인이 아닌 타인이 대신 해주어도 되나요?
    </button>
  </dt>
  <dd>
    <p id="faq56_desc" class="desc">
    	◎ 안됩니다. 보상신청의 경우 보상대상자 본인이 신청하거나, 보상대상자가 미성년자일 경우 친권자 또는 후견인이 보상신청을
    	대행할 수 있습니다.
    </p>
  </dd>  
</dl> 
<p><a href="#top">맨 위로 이동</a></p>
<hr>

<!-- qna09 버튼 내용-------------------------------------------------------- -->
<h5 id="qna09">9. 의료비 지원사업</h5>
<dl class="faq">
  <dt>
    <button aria-expanded="false" aria-controls="faq57_desc">
      코로나19 예방접종 후 인과성 불충분한 중증 환자 의료비 지원사업이란 무엇인가요?
    </button>
  </dt>
  <dd>
    <p id="faq57_desc" class="desc">
    	◎ 코로나19 예방접종 후 중환자실 입원치료 도는 이에 준하는 질병이 발생하였으나, 백신과 이상반응에 대한 인과성 근거자료가
    	부족하여 피해보상이 어려운 중증화자의 치료비를 지원하여 경제적 부담을 경감하기 위한 한시적 사업입니다. <br>
    	<br>
    </p>
  </dd>
  
  <dt>
    <button aria-expanded="false" aria-controls="faq58_desc">
      코로나19 예방접종 후 인과성 불충분한 중증 환자 의료비 지원사업의 대상은 누구인가요?
    </button>
  </dt>
  <dd>
    <p id="faq58_desc" class="desc">
    	◎ 코로나 19 예방접종 후 중환자실 입원치료 또는 이에 준하는 질병이 초래되었으나, 예방접종 피해조사반 도는 피해보상전문위원회
    	검토결과 인과성 인정을 위한 근거자료 불충분으로 피해보상에서 제외된 환자를 대상으로 하며, 이대 소득/재산여건은 고려되지 않습니다.
    	<br><br>
    	◎ 다만, 백신보다는 다른 이유에 의한 경우, 명백히 인과성이 없는 경우는 지원 대상이 아닙니다.
    </p>
  </dd>
  
  <dt>
    <button aria-expanded="false" aria-controls="faq59_desc">
      코로나19 예방접종 후 인과성 불충분한 중증 환자 의료비 지원을 받았더라도 추가로 피해보상 신청을 할 수 있나요?
    </button>
  </dt>
  <dd>
    <p id="faq59_desc" class="desc">
    	◎ 신청 가능합니다. 근거자료 축적 등 인과성 근거가 확인되어 인과성이 추가적으로 인정되면 선 지원된 진료비는 제외 후 
    	보상됩니다.<br><br>
    	◎ 다만, 동일한 진료 내역에 대해 긴급복지 등 타 사업과 중복 수혜를 받은 경우 환수됩니다.
    </p>
  </dd>
  
  <dt>
    <button aria-expanded="false" aria-controls="faq60_desc">
      1차로 지원받았으니, 치료가 끝나지 않아 계속 진료비가 발생하는 경우 추가로 지급이 되나요?
    </button>
  </dt>
  <dd>
    <p id="faq60_desc" class="desc">
    	◎ 추가적으로 신청 가능하나, 1인당 1,000만원 한도에서 지원됩니다.
    </p>
  </dd>  
</dl> 
>>>>>>> 0be9b48c194e881069ede8d8b7f9d10197c2d038
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



</body>

</html>