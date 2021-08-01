<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, reservation.model.vo.Hospital, reservation.model.vo.VaccineData"%>
<%
	ArrayList<Hospital> hps = (ArrayList<Hospital>)request.getAttribute("hps");
	ArrayList<VaccineData> vds = (ArrayList<VaccineData>) request.getAttribute("vds");

/*  String hp_name=((String)request.getAttribute("hp_name"));
	String hp_address=((String)request.getAttribute("hp_address"));
	String hp_phone=((String)request.getAttribute("hp_phone"));
	float hp_latitude=((float)request.getAttribute("hp_latitude"));
	float hp_longitude=((float)request.getAttribute("hp_longitude"));
	int remain=((int)request.getAttribute("remain"));  */
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
	var latitude=0;
	var longitude=0;
	function locationTest() {
		navigator.geolocation.getCurrentPosition(handleLocation, handleError);
	}

	/* 병원 정보 + 백신 정보 담긴 배열 */
	var hospitals = new Array();
	var vaccinedata = new Array();
	var reg_bus_no=null;
	

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
	var sortedLocations = new Array();

	
	// 위치콜백 
	function handleLocation(position) {
		var outDiv = document.getElementById("result");
		// 좌표보기 
		/*                 var posStr = "latitude : " + position.coords.latitude + "<br/>";
		 posStr += "longitude : " + position.coords.longitude; 
		 outDiv.innerHTML = posStr; 
		 */
		// 위치정보 만들고 
		var latitude = position.coords.latitude;
		var longitude = position.coords.longitude; 
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

		var infowindow = new google.maps.InfoWindow();

		var marker, i;

		for (i = 0; i < sortedLocations.length; i++) {
			marker = new google.maps.Marker({
				position : new google.maps.LatLng(sortedLocations[i].hp_latitude,
						sortedLocations[i].hp_longitude),
				map : map,
				icon : "../../resources/images/red_dot_small.png"
			});		
		}

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
		let distance=getDistance(latitude, longitude, hospitals[i].hp_latitude, hospitals[i].hp_longitude)
		hospitals[i].distance= distance;
	}
	
	function sortByDist(arr){
		sortedArr=[];
		sortedArr=arr.sort(function(a,b){
			if (a.distance>b.distance){
				return 1;
			}
			if (a.distance<b.distance){
				return -1;
			}
			return 0;
		});
		return sortedArr;
	}
		
	sortedLocations=sortByDist(hospitals);
	console.log(sortedLocations);

/* 			google.maps.event.addListener(marker, 'click',
					(function(marker, i) {
						return function() {
							infowindow.setContent(hospitals[i][0]);
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
		  const checkboxes = document.getElementsByName("list_order");
		  checkboxes.forEach((cb) => { cb.checked = false })
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
        return dist;
	}
	
	function hpOrder(event) {
		  document.getElementByName('list_order').innerText = 
		    event.target.value;
		}
	
	
</script>
</head>

<body onload="javascript:locationTest();">

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

						<input type='radio' name='list_order' value='dist'
							onclick='hpOrder(event)' />거리순 <input type='radio'
							name='list_order' value='amnt' onclick='hpOrder(event)' />수량순
						<div id='result'></div>


						<select name="list_option_key" onchange="handleOnList(this)">
							<option value="none">=== 선택 ===</option>
							<option value="pfizer">화이자</option>
							<option value="janssen">얀센</option>
							<option value="AZ">아스트라제네카</option>
						</select>
					</form>
					<div class="row">

						<div class="col-lg-3 p-0">
							<!--반복문  -->
							<script>
						
						</script>

							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<span>병원명 </span>
											<script>
											document.write(sortedLocations[0].hp_name);
											</script>

										</div>
									</div>
									<div class="row">
										<div class="col">
											<span>주소</span>
											<script>
												document.write(sortedLocations[0].hp_address);
												</script>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<span>전화번호</span>
											<script>
											document.write(sortedLocations[0].hp_phone);
											</script>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<span>수량 : </span>
											<script>
											document.write(sortedLocations[0].remain);
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
											document.write(sortedLocations[1].hp_name);
											</script>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<span>주소</span>
											<script>
											document.write(sortedLocations[1].hp_address);
											</script>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<span>전화번호</span>
											<script>
											document.write(sortedLocations[1].hp_phone);
											</script>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<span>수량 : </span>
											<script>
											document.write(sortedLocations[1].remain);
											</script>
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


	<%@ include file="../common/script.jsp"%>
</body>


</html>