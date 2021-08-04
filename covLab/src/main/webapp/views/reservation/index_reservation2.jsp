<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, reservation.model.vo.Hospital, reservation.model.vo.VaccineData"%>
<%
<<<<<<< HEAD
//ArrayList <Hospital> hps =(ArrayList<Hospital>)request.getAttribute("hps");
//String hp_name=request.getAttribute("hp_name");

/* hp.setHp_name(rset.getString("hp_name"));
hp.setHp_address(rset.getString("hp_address"));
hp.setHp_phone(rset.getString("hp_phone")); */
=======
	ArrayList<Hospital> hps = (ArrayList<Hospital>)request.getAttribute("hps");
	ArrayList<VaccineData> vds = (ArrayList<VaccineData>) request.getAttribute("vds");

/*  String hp_name=((String)request.getAttribute("hp_name"));
	String hp_address=((String)request.getAttribute("hp_address"));
	String hp_phone=((String)request.getAttribute("hp_phone"));
	float hp_latitude=((float)request.getAttribute("hp_latitude"));
	float hp_longitude=((float)request.getAttribute("hp_longitude"));
	int remain=((int)request.getAttribute("remain"));  */
>>>>>>> 0be9b48c194e881069ede8d8b7f9d10197c2d038
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

<<<<<<< HEAD
=======
	/* 병원 정보 + 백신 정보 담긴 배열 */
	var hospitals = new Array();
	var vaccinedata = new Array();
	var reg_bus_no=null;
	/* 선택한 병원의 사업자 등록번호 */
	var chosen_hp=null;

	<%
	for (Hospital hp: hps) {
	%>
		var obj={};
		obj.reg_bus_no="<%=hp.getReg_bus_no()%>";
		obj.hp_name="<%=hp.getHp_name()%>";
		obj.hp_address="<%=hp.getHp_address()%>";
		obj.hp_phone="<%=hp.getHp_phone()%>";
		obj.hp_latitude=<%=hp.getHp_latitude()%>;
		obj.hp_longitude=<%=hp.getHp_longitude()%>;
		obj.remain=0;
		hospitals.push(obj);
	<%
	}
	%>
	/* 병원 정보 + 백신 정보 */
	<%
	for (VaccineData vd: vds) {
	%>
		reg_bus_no="<%=vd.getReg_bus_no()%>";
		var i=0;
		while (i<hospitals.length){
			if (reg_bus_no == hospitals[i].reg_bus_no){
				hospitals[i].remain="<%=vd.getRemain()%>";
				break;
			}
			else i+=1;
		}
	<%
	}
	%>
	/* 병원 정보 + 백신 정보 + 거리 정보 담긴 배열 */
	var sortedLocations = [];
	/* 라디오 버튼 값에 따라 정렬하는 함수*/
	function hpOrder(list) {
		/* var order_opt = document.getElementByName('list_order');
		document.getElementByName('list_order').innerText = event.target.value; */
		var order_opt = $(":radio[name='list_order']:checked").val();
		if (order_opt == 'amnt') {
			sortedLocations=sortByAmnt(list);
		}
		if (order_opt == 'dist') {
			sortedLocations=sortByDist(list);
		}
	}
>>>>>>> 0be9b48c194e881069ede8d8b7f9d10197c2d038
	// 위치콜백 
	function handleLocation(position) {
		var outDiv = document.getElementById("result");

		// 위치정보 만들고 
<<<<<<< HEAD
		var latlng = new google.maps.LatLng(position.coords.latitude,
				position.coords.longitude);
=======
		var latitude = position.coords.latitude;
		var longitude = position.coords.longitude;
		var latlng = new google.maps.LatLng(latitude, longitude);
>>>>>>> 0be9b48c194e881069ede8d8b7f9d10197c2d038

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
<<<<<<< HEAD
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

=======
>>>>>>> 0be9b48c194e881069ede8d8b7f9d10197c2d038
		var infowindow = new google.maps.InfoWindow();
		var marker, i;
		for (i = 0; i < hospitals.length; i++) {
			marker = new google.maps.Marker({
<<<<<<< HEAD
				position : new google.maps.LatLng(locations[i][1],
						locations[i][2]),
=======
				position : new google.maps.LatLng(hospitals[i].hp_latitude,
						hospitals[i].hp_longitude),
>>>>>>> 0be9b48c194e881069ede8d8b7f9d10197c2d038
				map : map,
				title : hospitals[i].hp_name,
				label : hospitals[i].remain
			/* icon : "../../resources/images/red_dot_small.png" */
			});
<<<<<<< HEAD

			google.maps.event.addListener(marker, 'click',
					(function(marker, i) {
						return function() {
							infowindow.setContent(locations[i][0]);
							infowindow.open(map, marker);
						}
					})(marker, i));
		}
	}
=======
			if (marker) {
				marker.addListener("click", function() {
					map.setZoom(15);
					map.setCenter(this.getPosition());
					chosen_hp = hospital[i].reg_bus_no;
				});
			}
		}
		const infoWindow = new google.maps.InfoWindow();

		/* sortedLocations=locations.sort(function(a,b){
			if (a.distance>b.distance){
				return 1;
			}
			if (a.distance<b.distance){
				return -1;
			}
			return 0;
		});
		return sortedLocations; */
	}
	for (i = 0; i < hospitals.length; i++) {
		let distance = getDistance(latitude, longitude,
				hospitals[i].hp_latitude, hospitals[i].hp_longitude);
		hospitals[i].distance = distance;
	}

	function sortByDist(arr) {
		sortedArr = [];
		sortedArr = arr.sort(function(a, b) {
			if (a.distance > b.distance) {
				return 1;
			}
			if (a.distance < b.distance) {
				return -1;
			}
			return 0;
		});
		return sortedArr;
	}

	function sortByAmnt(arr) {
		sortedArr = [];
		sortedArr = arr.sort(function(a, b) {
			if (a.remain < b.remain) {
				return 1;
			}
			if (a.remain > b.remain) {
				return -1;
			}
			return 0;
		});
		return sortedArr;
	}

	
	console.log(chosen_hp);
	/* 			google.maps.event.addListener(marker, 'click',
	 (function(marker, i) {
	 return function() {
	 infowindow.setContent(hospitals[i][0]);
	 infowindow.open(map, marker);
	 }
	 })(marker, i)); 
	 }*/
>>>>>>> 0be9b48c194e881069ede8d8b7f9d10197c2d038
	// 에러콜백 
	function handleError(err) {
		var outDiv = document.getElementById("result");
		if (err.code == 1) {
			outDiv.innerHTML = "사용자가 위치정보 공유를 거부함";
		} else {
			outDiv.innerHTML = "에러발생 : " + err.code;
		}
	}
<<<<<<< HEAD
	//체크박스 값 하나만 선택되게 하는 함수
	function checkOnlyOne(element) {
		  
		  const checkboxes 
		      = document.getElementsByName("list_order");
		  
		  checkboxes.forEach((cb) => {
		    cb.checked = false;
		  })
		  
		  element.checked = true;
		}
=======

	function getDistance(lat1, lon1, lat2, lon2) {
		var radlat1 = Math.PI * lat1 / 180
		var radlat2 = Math.PI * lat2 / 180
		var radlon1 = Math.PI * lon1 / 180
		var radlon2 = Math.PI * lon2 / 180
		var theta = lon1 - lon2
		var radtheta = Math.PI * theta / 180
		var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1)
				* Math.cos(radlat2) * Math.cos(radtheta);
		dist = Math.acos(dist)
		dist = dist * 180 / Math.PI
		dist = dist * 60 * 1.1515
		dist = dist * 1.609344
		return dist;
	}
>>>>>>> 0be9b48c194e881069ede8d8b7f9d10197c2d038
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
<<<<<<< HEAD
						<input type='checkbox' name='list_order' value='dist'  onclick='checkOnlyOne(this)'/>거리순 <input
							type='checkbox' name='list_order' value='amnt' onclick='checkOnlyOne(this)'/>수량순 <select
							name="list_option_key" onchange="handleOnList(this)">
							<option value="none">=== 선택 ===</option>
							<option value="dist">화이자</option>
							<option value="dist">얀센</option>
							<option value="dist">AZ</option>
						</select>
=======

						<input type='radio' name='list_order' value='dist'
							onclick='hpOrder(hospitals);console.log(sortedLocations);' />거리순 <input type='radio' name='list_order'
							value='amnt' onclick='hpOrder(hospitals);console.log(sortedLocations);' />수량순

						<div id='result'>


							<select name="list_option_key" onchange="handleOnList(this)">
								<option value="none">=== 전체 ===</option>
								<option value="pfizer">화이자</option>
								<option value="janssen">얀센</option>
								<option value="AZ">아스트라제네카</option>
							</select>
>>>>>>> 0be9b48c194e881069ede8d8b7f9d10197c2d038
					</form>
					<div class="row">


						<div class="col-lg-3 p-0">
							<div class="card">
								<div class="card-body">

									<div class="row">
										<div class="col">
<<<<<<< HEAD
											<span>병원명</span>
=======
											<span>병원명 </span>
											<script>
												document
														.write(sortedLocations[0].hp_name);
											</script>

										</div>
									</div>
									<div class="row">
										<div class="col">
											<span>주소</span>
											<script>
												document
														.write(sortedLocations[0].hp_address);
											</script>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<span>전화번호</span>
											<script>
												document
														.write(sortedLocations[0].hp_phone);
											</script>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<span>수량 : </span>
											<script>
												document
														.write(sortedLocations[0].remain);
											</script>
										</div>
									</div>
									<div class="col text-center">
										<a href="detail_reservation.jsp"
											class="btn btn-primary pl-5 pr-5">예약</a>
									</div>
								</div>
							</div>


							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<span>병원명 </span>
											<script>
												document
														.write(sortedLocations[1].hp_name);
											</script>
>>>>>>> 0be9b48c194e881069ede8d8b7f9d10197c2d038
										</div>
									</div>
									<div class="row">
										<div class="col">
											<span>주소</span>
<<<<<<< HEAD
=======
											<script>
												document
														.write(sortedLocations[1].hp_address);
											</script>
>>>>>>> 0be9b48c194e881069ede8d8b7f9d10197c2d038
										</div>
									</div>
									<div class="row">
										<div class="col">
											<span>전화번호</span>
<<<<<<< HEAD
=======
											<script>
												document
														.write(sortedLocations[1].hp_phone);
											</script>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<span>수량 : </span>
											<script>
												document
														.write(sortedLocations[1].remain);
											</script>
>>>>>>> 0be9b48c194e881069ede8d8b7f9d10197c2d038
										</div>
									</div>
									<div class="col text-center">
										<a href="detail_reservation.jsp"
											class="btn btn-primary pl-5 pr-5">예약</a>
									</div>
								</div>
							</div>
						</div>
<<<<<<< HEAD
						<div class="col-lg-9 p-0">
							<div id="map" style="width: 95%; height: 600px;"></div>




=======


						<div class="col-lg-9 p-0">
							<div id="map" style="width: 95%; height: 600px;"></div>
>>>>>>> 0be9b48c194e881069ede8d8b7f9d10197c2d038
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


