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
<%@ include file="../common/script.jsp"%>

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
		let latitude = position.coords.latitude;
		let longitude = position.coords.longitude; 
		
		var latlng = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
		 

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
/* 		var locations = [ [ '강남구보건소	02-3423-5555', 37.5162581, 127.042214 ],
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
				[ '마포구보건소	02-3153-9037', 37.5663123, 126.9020798 ] ]; */
		let locations=[
			{hp_name: "강남구보건소", hp_address: "서울 강남구 선릉로 668", hp_phone: "02-3423-5555" ,hp_latitude: 37.5162581, hp_longitude: 127.042214},
			{hp_name: "삼성서울병원", hp_address: "서울 강남구 일원로 81", hp_phone: "02-3410-2114" ,hp_latitude: 37.4881568, hp_longitude: 127.0855952},
			{hp_name: "연세대학교의과대학강남세브란스병원", hp_address: "서울 강남구 언주로 211", hp_phone: "02-2019-3114" ,hp_latitude: 37.4927454, hp_longitude:127.0463152 },
			{hp_name: "강동경희대학교의대병원", hp_address: "서울 강동구 동남로 892", hp_phone: "02-440-7000" ,hp_latitude: 37.5534841, hp_longitude:127.1576468 },
			{hp_name: "강동구보건소", hp_address: "서울 강동구 성내동 541-2", hp_phone: "02-440-7000" ,hp_latitude: 37.5292365, hp_longitude: 127.1255395},
			{hp_name: "성심의료재단강동성심병원", hp_address: "서울 강동구 성안로 150", hp_phone: "02-3425-8565" ,hp_latitude: 37.5361787, hp_longitude: 127.135423},
			{hp_name: "한국보훈복지의료공단중앙보훈병원", hp_address: "서울 강동구 진황도로61길 53", hp_phone: "02-2225-1100" ,hp_latitude: 37.5305849, hp_longitude: 127.1480435},
			{hp_name: "강북구보건소", hp_address: "서울 강북구 한천로 897", hp_phone: "02-901-7706" ,hp_latitude: 37.6320834, hp_longitude: 127.0387673},
			{hp_name: "강서구보건소", hp_address: "서울 강서구 공항대로 561", hp_phone: "02-2600-5868" ,hp_latitude: 37.5496053, hp_longitude: 126.868277},
			{hp_name: "이화여자대학교의과대학부속서울병원", hp_address: "서울특별시 강서구 공항대로 260", hp_phone: "1522-7000" ,hp_latitude: 37.5371113, hp_longitude: 126.8855845 },
			{hp_name: "관악구보건소", hp_address: "서울 관악구 관악로 145", hp_phone: "02-879-7131" ,hp_latitude: 37.478434, hp_longitude: 126.9511135 },
			{hp_name: "에이치플러스양지병원", hp_address: "서울 관악구 남부순환로 1636", hp_phone: "02-1877-8875" ,hp_latitude: 37.4842166, hp_longitude: 126.9325109},
			{hp_name: "광진구보건소	", hp_address: "서울 광진구 자양로 117", hp_phone: "02-450-1937" ,hp_latitude: 37.5383735, hp_longitude: 127.0824046},
			{hp_name: "건국대학교병원", hp_address: "서울 광진구 능동로 120-1", hp_phone: "02-1588-1533" ,hp_latitude: 36.9789327, hp_longitude: 126.8893241},
			{hp_name: "구로구보건소", hp_address: "서울 구로구 구로중앙로28길 66", hp_phone: "02-860-2003" ,hp_latitude:37.500076 , hp_longitude: 126.8893241},
			{hp_name: "고려대학교의과대학부속구로병원", hp_address: "서울 구로구 구로동로 148", hp_phone: "02-2626-1114" ,hp_latitude: 37.4922173, hp_longitude:126.8849478 },
			{hp_name: "금천구보건소", hp_address: "서울 금천구 시흥대로73길 70", hp_phone: "02-2627-2717" ,hp_latitude: 37.4570498, hp_longitude: 126.8959514},
			{hp_name: "한일병원", hp_address: "서울 도봉구 우이천로 308", hp_phone: "02-901-3114" ,hp_latitude: 36.9638808, hp_longitude: 127.9429038},
			{hp_name: "보라매병원", hp_address: "서울 동작구 보라매로5길 20", hp_phone: "02-870-2114" ,hp_latitude: 37.4933373, hp_longitude: 126.9246093},
			{hp_name: "마포구보건소", hp_address: "서울 마포구 월드컵로 212", hp_phone: "02-3153-9037" ,hp_latitude: 37.5663123, hp_longitude: 126.9020798},
		];

		var infowindow = new google.maps.InfoWindow();

		var marker, i;

		for (i = 0; i < locations.length; i++) {
			marker = new google.maps.Marker({
				position : new google.maps.LatLng(locations[i].hp_latitude,
						locations[i].hp_longitude),
				map : map,
				icon : "../../resources/images/red_dot_small.png"
			});
			let distance=getDistance(latitude, longitude, locations[i].hp_latitude, locations[i].hp_longitude)
			locations[i].distance= distance;
		}
			let newLocList = locations.sort(function(a,b){
				if (a.distance>b.distance){
					return 1;
				}
				if (a.distance<b.distance){
					return -1;
				}
				return 0;
			});
			
			console.log(newLocList);
	}
	

/* 			google.maps.event.addListener(marker, 'click',
					(function(marker, i) {
						return function() {
							infowindow.setContent(locations[i][0]);
							infowindow.open(map, marker);
						}
					})(marker, i)); 
		}*/
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
	
	function getDistance(lat1, lon1, lat2, lon2, unit) {
        var radlat1 = Math.PI * lat1/180
        var radlat2 = Math.PI * lat2/180
        var radlon1 = Math.PI * lon1/180
        var radlon2 = Math.PI * lon2/180
        var theta = lon1-lon2
        var radtheta = Math.PI * theta/180
        var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
        dist = Math.acos(dist)
        dist = dist * 180/Math.PI
        dist = dist * 60 * 1.1515
        if (unit=="K") { dist = dist * 1.609344 }
        if (unit=="N") { dist = dist * 0.8684 }
        return dist
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
						<input type='checkbox' name='list_order' value='dist'
							onclick='checkOnlyOne(this)' />거리순 <input type='checkbox'
							name='list_order' value='amnt' onclick='checkOnlyOne(this)' />수량순
						<select name="list_option_key" onchange="handleOnList(this)">
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