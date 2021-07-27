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
 
</style>

<body>
<h4>QnA</h4>
<hr>

<a class="btn" href="#qna01">코로나란?</a>
<a class="btn" href="#qna02">코로나의 증상/검사</a>
<a class="btn" href="#qna03">임신과 출산</a>
<a class="btn" href="#qna04">치료 및 예방</a>
<a class="btn" href="#qna05">접촉자 및 확진환자</a>
<a class="btn" href="#qna06">격리 및 격리해제</a>
<a class="btn" href="#qna07">백신 관련</a>
<a class="btn" href="#qna08">백신의 안전성과 이상반응</a>
<a class="btn" href="#qna09">코로나19 예방접종 관련 피해보상</a>
<a class="btn" href="#qna10">인과성 불충분한 중증 환자 의료비 지원사업</a>
<a class="btn" href="#qna11">기타</a>
<hr>
<!-- 윗부분은 목록을 만들고 a 태그로 각 번호의 목록으로 이동하게 만듬 -->

<!-- 각 목록의 내용을 번호를 붙여서 작성 -->
<h5 id="qna01">1. 코로나란?</h5>
<dl class="faq">
  <dt>
    <button aria-expanded="false" aria-controls="faq1_desc">
      코로나 바이러스 감염증-19는 어떤 질병인가요?
    </button>
  </dt>
  <dd>
    <p id="faq1_desc" class="desc">
    	◎ 코로나 바이러스 감염증-19(코로나19)는 과거에 발견되지 않았던 새로운 코로나 바이러스인 SARS-CoV-2에 의해 발생하는
    	호흡기 감염병으로, 이 바이러스에 감염되면 무증상부터 중증에 이르기까지 다양한 임상증상이 나타날 수 있습니다.  <br>
    	<br>
    	◎ 이 새로운 바이러스와 질병은 2019년 12월 중국 우한에서 처음 보고되었고, 현재 전 세계에 확산되었습니다.
    </p>
  </dd>
   <dt>
    <button aria-expanded="false" aria-controls="faq2_desc">
      코로나 바이러스는 어떤 바이러스인가요?
    </button>
  </dt>
  <dd>
    <p id="faq2_desc" class="desc">
    	◎ 코로나 바이러스는 동물 및 사람에게 전파될 수 있는 바이러스로 그 중 사람에게 전파가능 함 사람 코로나 바이러스는 기존에
    	6종이 알려져 있습니다.<br>
    	<br>
    	◎ 이 중 4종은 감기와 같은 질병을 일으키는 바이러스이며, 나머지 2종은 각각 MERS-CoV와 SARS-CoV로 알려져있습니다.<br>
    	<br>
    	◎ 이번 유행의 원인 바이러스는 코로나바이러스(SARS-CoV-2)로 공개된 염기서열 분석을 통해 코로나 19 바이러스가 박쥐유래
    	사스 유사 바이러스와 89.1% 일치하는 것을 확인하였습니다.
    </p>
  </dd>
     <dt>
    <button aria-expanded="false" aria-controls="faq3_desc">
      코로나 19는 어떻게 전염되나요?
    </button>
  </dt>
  <dd>
    <p id="faq3_desc" class="desc">
    	◎ 코로나 19를 일으키는 바이러스는 사람에서 사람으로 전파되며 주로 환자와 직접 접촉 또는 호흡기를 통해 배출되는 비말에
    	의해 전염됩니다. 즉, 코로나 19에 감염된 사람이 말을 하거나 기침/재채기/노래 등을 할 떄 생성된 비말이 근처에 있는 사람들의
    	호흡기에 직접 닿거나, 비말이 묻은 손 또는 물건 등을 만진 뒤 눈/코/입을 만질 때 전염될 수 있습니다. <br>
		<br>
    	◎ 또한 공기 감염은 흔하지 않으나 의료기관의 에어로졸 생성 시술이나 밀폐된 공간에서 장시간 호흡기 비말을 만드는 환경 등
    	특수 상황에서 보통 비말이 도달하는 거리(2미터) 이상까지 바이러스 전파가 가능할 수 있습니다. 
    </p>
  </dd>
  <dt>
    <button aria-expanded="false" aria-controls="faq4_desc">
      코로나 19 환자의 대변이나 체액으로도 전염이 가능한가요?
    </button>
  </dt>
  <dd>
    <p id="faq4_desc" class="desc">
    	◎ 환자의 대변에서 코로나19 바이러스가 검출되었다는 보고가 있었지만, 현재까지 환자의 대변으로 인해 코로나 19가 전염된
    	사레는 보고되지 않았습니다. 추가로 물이나 하수오물 같은 환경에서 바이러스가 생존할 수 있다는 증거도 발견되지 않았습니다.<br>
    	<br>
    	◎ 혈액, 뇌척수액, 소변, 타액, 눈물 및 결막 분비물 등의 체액에서도 바이러스가 검출되었다는 보고가 있었지만, 그로 인해 
    	전염된 사례는 보고되지 않았습니다.
    </p>
  </dd>
   <dt>
    <button aria-expanded="false" aria-controls="faq5_desc">
      음식을 통해 코로나 19가 전염될 수 있나요?
    </button>
  </dt>
  <dd>
    <p id="faq5_desc" class="desc">
    	◎ 현재까지 코로나 19가 음식을 통해 전파된다는 증거는 없습니다. <br>
    	<br>
    	◎ 바이러스가 있는 음식의 포장 용기 표면이나 물체를 만진 후 자신의 입/코/눈을 만지면 코로나 19에 걸릴 수 있지만, 
    	물체의 표면에서 이러한 코로나 바이러스의 생존력이 높지 않기 때문에 식품인 포장 용기를 통해 확산될 위험은 매우 낮습니다.<br>
    	<br>
    	◎ 안전을 위해서는 항상 음식을 준비하거나 먹기 전에 비누와 물로 30초 동안 손을 씻는 것이 도움이 될 수 있습니다.
    </p>
  </dd> 
     <dt>
    <button aria-expanded="false" aria-controls="faq6_desc">
      날씨가 따뜻해지면 코로나 19 전파를 막을 수 있나요?
    </button>
  </dt>
  <dd>
    <p id="faq6_desc" class="desc">
    	◎ 일반적으로 코로나 바이러스는 저온의 건조한 환경보다 고온 다습한 환경에서 생존 기간이 더 짧습니다. 하지만 코로나 19 바이러스에
    	대한 직접적인 온도와 관련된 자료와 바이러스 비활성화에 관련된 온도 정보는 아직까지 부족합니다. <br>
    	<br>
    	◎ 제한적이지만, 위도/온도/습도에 따른 코로나 19의 분포 양상이 계절성 호흡기 바이러스의 양상과 비슷하다는 연구 보고가 있었습니다.
    </p>
  </dd> 
       <dt>
    <button aria-expanded="false" aria-controls="faq7_desc">
      카페 등의 다중이용 시설 및 가정에서 냉난방기 가동시, 환기는 얼마나 자주 해야 하나요?
    </button>
  </dt>
  <dd>
    <p id="faq7_desc" class="desc">
    	◎ 코로나19는 비말, 접촉, 공기 전파를 통해 감염 가능하며, 주된 감염경로는 2미터 이내의 비말감염입니다. 공기감염은 흔하지 않지만, 
    	밀폐된 공간에서 장시간 호흡기 비말을 배출하거나 환기가 부적절한 경우 발생 가능하여 집단감염을 일으킬 수 있으므로 실내 오염도를 
    	낮추기 위하여 충분한 환기를 실시하여야 합니다.<br>
    	<br>
    	◎ 환기 시에는 가급적 자연환기 하며, 창문을 개방하여 맞통풍하고, 공조장비 설치 시설은 외부공기 도입량을 가능한 높게 설정하여
    	최대한 외부 공기로 환기하며 가능하면 자연환기와 병행합니다.
    </p>
  </dd> 
 </dl>
<p><a href="#top">맨 위로 이동</a></p>
<hr>

<h5 id="qna02">2.코로나의 증상/검사</h5>
 <dl class="faq">
  <dt>
    <button aria-expanded="false" aria-controls="faq8_desc">
      코로나 19의 증상은 어떤것이 있나요?
    </button>
  </dt>
  <dd>
    <p id="faq8_desc" class="desc">
    	◎ 코로나 19의 가장 흔한 증상은 발열, 마른 기침, 피로이며 그 외에 후각 및 미각 소실, 근육통, 인후통, 콧물, 코막힘, 두통, 결막염,
    	설사, 피부 증상 등 다영한 증상이 나타날 수 있습니다.<br>
    	<br>
    	◎ 이러한 증상은 보통 경미하고 점진적으로 나타납니다. 사람에 따라 감염되어도 매우 약한 증상만 나타날 수 있습니다.<br>
    	<br>
    	◎ 대부분의 환자들(약 80%)은 특별한 치료없이 회복되나, 5명 중 1명 정도는 중증으로 진행 할 수 있습니다. 고령자나 고혈압, 
    	심폐질환, 당뇨병이나 암과 같은 기저질환이 있는 사람들은 중증으로 진행 될 가능성이 높습니다.
    </p>
  </dd>
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
     
 <table border="1">
 	<tr>
 		<td>▶ 코로나 19 진단 검사비 지급절차<br>
 		&nbsp; 1. (사례정의 해당건 검사지원) 코로나 19 대응 지침에 따른 사례의 경우<br>
 		&nbsp; 2. (선제적 검사 지원) 일정규모 집단 발생시, <br>
 		&nbsp; 3. 보건소, 선별 진료소 및 임시 선별검사소 대상진단
 		</td>
 	</tr>
 </table>
  
  
</dl>
  
  
  
  </dl>
<p><a href="#top">맨 위로 이동</a></p>
<hr>

<h5 id="qna03">3. 백신 관련</h5>

<p><a href="#top">맨 위로 이동</a></p>
<hr>

<h5 id="qna04">4. 백신의 안전성과 이상반응</h5>

<p><a href="#top">맨 위로 이동</a></p>
<hr>

<h5 id="qna05">5. 코로나19 예방접종 관련 피해보상</h5>

<p><a href="#top">맨 위로 이동</a></p>
<hr>

<h5 id="qna06">6. 인과성 불충분한 중증 환자 의료비 지원사업</h5>

<p><a href="#top">맨 위로 이동</a></p>
<hr>

<h5 id="qna07">7. 75세 이상 어르신 및 노인시설 예방접종</h5>

<p><a href="#top">맨 위로 이동</a></p>
<hr>

<h5 id="qna08">8. 시스템및 예방접종 기록</h5>

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