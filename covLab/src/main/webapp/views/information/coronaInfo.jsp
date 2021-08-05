<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>CoronaInfo</title>


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
 }
 .btn:active {
  transform:translateY(5px);
 }
 
 .btn:hover {
 	background:lightgray;
 	color:black;
 	transition:all 0.2s;
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
}

.a {
	color:white;
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
									<h4>코로나 정보</h4>
										<hr border=2>
										<a class="btn" href="#coronainfo02">코로나19란?</a>
										<a class="btn" href="#coronainfo03">코로나의 증상</a>
									  	<a class="btn" href="#coronainfo04">코로나의 예방법</a>
									  	<hr>
									  	<br>
	<h3 id="coronainfo01">1. 확진자 수 (클릭시 이동)</h3>
	<a href="http://ncov.mohw.go.kr/"><img src="../../resources/images/캡처.PNG"></a>
		<hr>
<h3 id="coronainfo02">2. 코로나19란?</h3>
<p class="ta_r mgt36">* 현재까지 알려진 정보(2021년 3월 2일 기준) </p>
                        <h4 class="s_title_1">코로나바이러스감염증-19(COVID-19) 정보</h4>
						<div class="data_table">
						  <table border=2>
						    <caption>
						      <span class="hdn">코로나바이러스감염증-19 기본정보표 - 병원체, 전파 경로, 잠복기, 진단 기준, 증상, 치료, 치명률로 구성</span>
					        </caption>
						    <colgroup>
						      <col style="width:10%" />
						      <col style="width:60%" />
					        </colgroup>
						    <tr>
						      <th class="a" scope="row" ><center>병원체</center></th>
						      <td class="ta_l"><ul class="s_listin_mdot mgt0" >
						        <li align="left" >1. Severe Acute Respiratory Syndrome-Coronavirus-2(SARS-CoV-2)</li>
						        <li align="left">2. Coronaviridae family, Betacoronavirus genus Sarbecovirus subgenus에 속함</li>
						        </ul></td>
					        </tr>
						    <tr>
						      <th class="a" scope="row"><center>전파 경로</center></th>
						      <td class="ta_l"><ul class="s_listin_mdot mgt0">
						        <li align="left">1. 주된 전파경로는 감염자의 호흡기 침방울(비말)에 의한 전파</li>
						        <li align="left">2. 사람 간에 전파되며, 대부분의 감염은 감염자가 기침, 재채기, 말하기, 노래 등을할 때 발생한 호흡기 침방울(비말)을다른사람이 밀접접촉(주로 2m 이내)하여 발생</li>
						        <li align="left">3. 현재까지 연구결과에 의하면, 비말 이외, 표면접촉*, 공기 등을 통해서도 전파가 가능하나, 공기전파는 의료기관의에어로졸 생성 시술**, 밀폐된공간에서 장시간 호흡기 비말을 만드는환경***등 특정 환경에서 제한적으로 전파되는 것으로 알려짐
						          <p class="mgt12">* 감염된 사람과의 직접 접촉(악수 등) 또는 매개체(오염된 물품이나 표면)를 만진 후, 손을 씻기 전 눈, 코, 입 등을 만짐으로 바이러스 전파 </p>
						          <p class="mgt8">** 에어로졸 생성 시술: 기관지 내시경 검사, 객담 유도, 기관삽관, 심폐소생술, 개방된 객담 흡입, 흡입기 등</p>
						          <p class="mgt8">*** 환기가 부적절하게 이루어진 노래방, 커피숍, 주점, 실내 운동시설 등에서 감염자와 같이있거나 감염자가 떠난 즉시 그 밀폐공간을 방문한 경우</p>
					            </li>
						        </ul></td>
					        </tr>
						    <tr>
						      <th class="a" scope="row"><center>잠복기</center></th>
						      <td class="ta_l"><ul class="s_listin_mdot mgt0">
						        <li align="left">1~14일(평균 5~7일)</li>
						        </ul></td>
					        </tr>
						    <tr>
						      <th class="a" scope="row"><center>진단 기준</center></th>
						      <td class="ta_l"><ul class="s_listin_mdot mgt0">
						        <li align="left">환자 : 임상양상에 관계없이 진단을 위한 검사기준에 따라 코로나19 감염이 확인된 자</li>
						        <li align="left">진단을 위한 검사 기준
						          <ul>
						            <li align="left">코로나19 유전자(PCR) 검출</li>
						            <li align="left">바이러스 분리</li>
					              </ul>
					            </li>
						        </ul></td>
					        </tr>
						    <tr>
						      <th class="a" scope="row"><center>증상</center></th>
						      <td class="ta_l"><ul class="s_listin_mdot mgt0">
						        <li align="left">주요증상 및 징후
						          <ul>
						            <li align="left">- 임상 증상은 무증상, 경증, 중등증, 중증까지 다양</li>
						            <li align="left">- 주요 증상으로는 발열(37.5℃ 이상), 기침, 호흡곤란, 오한, 근육통, 두통, 인후통, 후각·미각소실
						              <p>- 그 외에 피로, 식욕감소, 가래, 소화기증상(오심, 구토, 설사 등), 혼돈, 어지러움, 콧물이나 코막힘, 객혈, 흉통, 결막염, 피부 증상 등이 다양하게 나타남</p>
					                </li>
					              </ul>
					            </li>
						        </ul></td>
					        </tr>
						    <tr>
						      <th class="a" scope="row"><center>치료</center></th>
						      <td class="ta_l"><ul class="s_listin_mdot mgt0">
						        <li align="left">- 특이치료제는 없으며 증상에 따른 해열제, 수액공급, 진해제 등 대증치료</li>
						        <li align="left">- 호흡 곤란 시 산소를 공급하고 필요한 경우에는 기계호흡이나 체외막 산소공급 등의 처치를 시행</li>
						        <li align="left">- 산소 치료가 필요한 환자에서 렘데시비르의 효과가 일부 확인되어 우리나라를 포함한 여러 나라에서 긴급 승인이 되었거나, 긴급 승인을 준비 중임특이적인 항바이러스제 없음</li>
						        </ul></td>
					        </tr>
						    <tr>
						      <th class="a" scope="row"><center>치명률</center></th>
						      <td class="ta_l"><ul class="s_listin_mdot mgt0">
						        <li align="left">전세계 치명률은 지역, 인구집단연령 구조, 감염 상태 및 기타 요인에 의해 0.1~25%로 다양함</li>
						        <li align="left">전세계 치명률은 0.00%~1.63% (중위값 0.27%)로 보정 후 0.00~1.54%(중위값 0.23%)(Bulletin of the World Health Organization. 2021)(https://www.who.int/bulletin/volumes/99/1/20-265892/en/)</li>
						        </ul></td>
					        </tr>
					      </table>
						</div>   
<p><a href="#top">맨 위로 이동</a></p>
<hr>
<!-- ---------------------------------------------------------------------------------- -->
<h3 id="coronainfo03">3. 코로나19의 증상</h3>
	<ul>
		<li><font size="4">
			<p> <li>◎ 코로나19의 주요 증상으로는 발열 (37.5℃ 이상), 기침, 호흡곤란, 오한, 근육통, 두통, 인후통, 후각/미각 손실</li></p>
			<p> <li>◎  그 외에 피로, 식욕감소, 가래, 소화기증상(오심, 구토, 설사 등), 혼돈, 어지러움, 콧물이나 코막힘, 객혈, 흉통,
	     	결막염, 피부 증상 등이 다양하게 나타남</li></p>
			<p> <li>◎ 대부분의 환자들(약80%)은 특별한 치료 없이 회복되나, 5명 중 1명 정도는 중증으로 진행할 수 있으니, 고령자나 고혈압,
			심폐질환, 당뇨병이나 암과 같은 기저질환이 있는 사람들은 중점으로 진행될 가능성이 높음</li>
			</p></font>
			<table border="1" width="600" height="200"> [참고. 우리나라 코로나19 확진자 병원입원시 주요증상]
				<tr>
					<th class="a" >주요증상</th>
					<th class="a" >비율(%)</th>
					<th class="a" >주요증상</th>
					<th class="a" >비율(%)</th>
					<th class="a" >주요증상</th>
					<th class="a" >비율(%)</th>
				</tr>
				<tr>
					<td>기침</td>
					<td>41.8%</td>
					<td>근육통</td>
					<td>16.5%</td>
					<td>설사</td>
					<td>9.2%</td>
				</tr>
				<tr>
					<td>객담</td>
					<td>28.9%</td>
					<td>인후염</td>
					<td>15.7%</td>
					<td>구토/오심</td>
					<td>43.% </td>
				</tr>
				<tr>
					<td>발열 (≥ 37.5℃)</td>
					<td>21.1%</td>
					<td>호흡곤란</td>
					<td>11.9%</td>
					<td>피로/권태</td>
					<td>4.2%</td>
				</tr>
				<tr>
					<td>두통</td>
					<td>17.2%</td>
					<td>콧물</td>
					<td>11%</td>
					<td>증상없음</td>
					<td>26.7%</td>
				</tr>
			</table>
		</li>
	</ul>
</div>
<p><a href="#top">맨 위로 이동</a></p>
<hr>

<h3 id="coronainfo04">4. 코로나19 예방법</h3>
	<ul>
		<li><font size="4">
			<p> <li>식약처에서 승인된 코로나 19 <a href="vaccinInfo.jsp#vaccineinfo02"><u>백신</u></a></li></p>
			<p> <li>올바른 손씻기</li></p>
			<p> <li>기침 예절 준수</li></p>
			<p> <li>씻지 않은 손으로 눈, 코, 입 만지지 않기</li></p>
			<p> <li>주위환경을 자주 소독하고 환기하기</li>
			</p></font>
		</li>
	</ul>
</div>
<p><a href="#top">맨 위로 이동</a></p>
<hr>

<!-- ---------------------------------------------------------------------------------- -->									
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
            
            
<!-- ----------------------------------------------------------------------------------- -->

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