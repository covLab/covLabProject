<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import="java.util.ArrayList, reservation.model.vo.Hospital" -->
<%
//ArrayList <Hospital> hps =(ArrayList<Hospital>)request.getAttribute("hps");
//String hp_name=request.getAttribute("hp_name");

/* hp.setHp_name(rset.getString("hp_name"));
hp.setHp_address(rset.getString("hp_address"));
hp.setHp_phone(rset.getString("hp_phone")); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>백신예약사이트 CovLab</title>
<!--Focus Admin: Creative Admin Dashboard  -->
<%@ include file="../common/stylesheet.jsp"%>
<%@ include file="../common/sidebar.jsp"%>
<%@ include file="../common/topbar.jsp"%>
<!-- GOOGLE FONTS-->

<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<script
	src="http://maps.google.com/maps/api/js?q=seoul&key=AIzaSyCZ8XJruaL1nd6GJOryueJE_Av5O6mU5H0"
	type="text/javascript"></script>

<style>
<!--
.supported {
	width: 300px;
	border: 1px solid #e3e3e3;
	padding: 5px;
	font-family: Arial;
	font-size: 0.9em;
	line-height: 160%;
}
-->
</style>


<script language="javascript">
	// 위치확인 

	function locationTest() {
		navigator.geolocation.getCurrentPosition(handleLocation, handleError);
	}

	// 위치콜백 
	function handleLocation(position) {
		var outDiv = document.getElementById("result");
		// 좌표보기 
		/*                 var posStr = "latitude : " + position.coords.latitude + "<br/>";
		 posStr += "longitude : " + position.coords.longitude; 
		 outDiv.innerHTML = posStr; 
		 */
		// 위치정보 만들고 
		var latlng = new google.maps.LatLng(position.coords.latitude,
				position.coords.longitude);

		// 지도 옵션 
		var mapOption = {
			zoom : 11.5,
			center : latlng,
			mapTypeControl : false,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};

		// 지도만들고 
		var map = new google.maps.Map(document.getElementById("map"), mapOption);

		// 위치표시 
		new google.maps.Marker({
			position : latlng,
			map : map,
			title : "현위치"
		});
		//지도에 표시될 병원 리스트
		var locations = [ [ '강남구보건소	02-3423-5555', 37.5162581, 127.042214 ],
				[ '삼성서울병원	02-3410-2114', 37.4881568, 127.0855952 ],
				[ '연세대학교의과대학강남세브란스병원	02-2019-3114', 37.4927454, 127.0463152 ],
				[ '강동경희대학교의대병원	02-440-7000', 37.5534841, 127.1576468 ],
				[ '강동구보건소	02-3425-8565', 37.5292365, 127.1255395 ],
				[ '성심의료재단강동성심병원	02-2224-2358', 37.5361787, 127.135423 ],
				[ '한국보훈복지의료공단중앙보훈병원	02-2225-1100', 37.5305849, 127.1480435 ],
				[ '강북구보건소	02-901-7706, 02-901-7704', 37.6320834, 127.0387673 ],
				[ '강서구보건소	02-2600-5868', 37.5496053, 126.868277 ],
				[ '이화여자대학교의과대학부속서울병원	1522-7000', 37.5371113, 126.8855845 ],
				[ '관악구보건소	02-879-7131', 37.478434, 126.9511135 ],
				[ '에이치플러스양지병원	02-1877-8875', 37.4842166, 126.9325109 ],
				[ '광진구보건소	02-450-1937', 37.5383735, 127.0824046 ],
				[ '건국대학교병원	02-1588-1533', 36.9789327, 127.9285366 ],
				[ '구로구보건소	02-860-2003', 37.500076, 126.8893241 ],
				[ '고려대학교의과대학부속구로병원	02-2626-1114', 37.4922173, 126.8849478 ],
				[ '금천구보건소	02-2627-2717', 37.4570498, 126.8959514 ],
				[ '한일병원	02-901-3114', 36.9638808, 127.9429038 ],
				[ '보라매병원	02-870-2114', 37.4933373, 126.9246093 ],
				[ '마포구보건소	02-3153-9037', 37.5663123, 126.9020798 ] ];

		var infowindow = new google.maps.InfoWindow();

		var marker, i;

		for (i = 0; i < locations.length; i++) {
			marker = new google.maps.Marker({
				position : new google.maps.LatLng(locations[i][1],
						locations[i][2]),
				map : map,
				icon : "../../resources/images/red_dot_small.png"
			});

			google.maps.event.addListener(marker, 'click',
					(function(marker, i) {
						return function() {
							infowindow.setContent(locations[i][0]);
							infowindow.open(map, marker);
						}
					})(marker, i));
		}
	}
	// 에러콜백 
	function handleError(err) {
		var outDiv = document.getElementById("result");
		if (err.code == 1) {
			outDiv.innerHTML = "사용자가 위치정보 공유를 거부함";
		} else {
			outDiv.innerHTML = "에러발생 : " + err.code;
		}
	}
	//체크박스 값 하나만 선택되게 하는 함수
	function checkOnlyOne(element) {
		  
		  const checkboxes 
		      = document.getElementsByName("list_order");
		  
		  checkboxes.forEach((cb) => {
		    cb.checked = false;
		  })
		  
		  element.checked = true;
		}
</script>
</head>

<body onload="javascript:locationTest();">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans'
		rel='stylesheet' type='text/css' />
</head>
<body>
	<div class="content-wrap">
		<div class="main">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-8 p-r-0 title-margin-right">
						<div class="page-header">
							<div class="page-title">
								<h1>
									안녕하세요. <span>코로나 백신 예약 사이트 Covlab입니다.</span>
								</h1>
							</div>
						</div>
					</div>

					<!-- /# column -->
					<div class="col-lg-4 p-l-0 title-margin-left">
						<div class="page-header">
							<div class="page-title">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
									<li class="breadcrumb-item active">Home</li>
								</ol>
							</div>
						</div>
					</div>
					<!-- /# column -->

				</div>
				<!-- /# row -->
				<section id="main-content">
					<form action="list_option.jsp">
						<input type='checkbox' name='list_order' value='dist'  onclick='checkOnlyOne(this)'/>거리순 <input
							type='checkbox' name='list_order' value='amnt' onclick='checkOnlyOne(this)'/>수량순 <select
							name="list_option_key" onchange="handleOnList(this)">
							<option value="none">=== 선택 ===</option>
							<option value="dist">화이자</option>
							<option value="dist">얀센</option>
							<option value="dist">AZ</option>
						</select>
					</form>
					<div class="row">


						<div class="col-lg-3 p-0">
							<div class="card">
								<div class="card-body">

									<div class="row">
										<div class="col">
											<span>병원명</span>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<span>주소</span>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<span>전화번호</span>
										</div>
									</div>
									<div class="col text-center">
										<a href="detail_reservation.jsp"
											class="btn btn-primary pl-5 pr-5">예약</a>
									</div>
								</div>

							</div>
						</div>
						<div class="col-lg-9 p-0">
							<div id="map" style="width: 95%; height: 600px;"></div>




						</div>

					</div>
			</div>

			<%@ include file="../common/footer.jsp"%>
			</section>
		</div>
	</div>
	</div>




	<%@ include file="../common/script.jsp"%>
</body>


</html>