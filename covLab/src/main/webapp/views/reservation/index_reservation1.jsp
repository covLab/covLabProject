<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"
   import="java.util.ArrayList, reservation.model.vo.Hospital, reservation.model.vo.VaccineData"%>
<%
	ArrayList<Hospital> hps = (ArrayList<Hospital>)request.getAttribute("hps");
	ArrayList<VaccineData> vds = (ArrayList<VaccineData>) request.getAttribute("vds");
	int listCount = ((Integer) request.getAttribute("listCount")).intValue();
	int startPage = ((Integer) request.getAttribute("startPage")).intValue();
	int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer) request.getAttribute("maxPage")).intValue();
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
	int startRow = ((Integer) request.getAttribute("startRow")).intValue();
	int endRow = ((Integer) request.getAttribute("endRow")).intValue();
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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

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
   var sortedLocations = [];

	/* 병원 정보 + 백신 정보 담긴 배열 */
	var hospitals = new Array();
	var vaccinedata = new Array();
	var reg_bus_no=null;
	/* 선택한 병원의 사업자 등록번호 */
	var chosen_hp=null;

	const request = new XMLHttpRequest();
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
	for (i = 0; i < hospitals.length; i++) {
		let distance = getDistance(latitude, longitude,
				hospitals[i].hp_latitude, hospitals[i].hp_longitude);
		hospitals[i].distance = distance;
	}
	sortedLocations = sortByDist(hospitals);
	/* 병원 정보 + 백신 정보 + 거리 정보 담긴 배열 */
	

	/*거리순 정렬 함수*/
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
	/*수량순 정렬 함수*/
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
	
	// 위치콜백 
	function handleLocation(position) {
		var outDiv = document.getElementById("result");

      // 위치정보 만들고 
      var latitude = position.coords.latitude;
      var longitude = position.coords.longitude;
      
      var latlng = new google.maps.LatLng(latitude, longitude);

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

      for (i = 0; i < hospitals.length; i++) {
         marker = new google.maps.Marker({
            position : new google.maps.LatLng(hospitals[i].hp_latitude,
                  hospitals[i].hp_longitude),
            map : map,
            title : hospitals[i].hp_name,
            label : hospitals[i].remain
         /* icon : "../../resources/images/red_dot_small.png" */
         });
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


   // 에러콜백 
   function handleError(err) {
      var outDiv = document.getElementById("result");
      if (err.code == 1) {
         outDiv.innerHTML = "사용자가 위치정보 공유를 거부함";
      } else {
         outDiv.innerHTML = "에러발생 : " + err.code;
      }
   }

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
	
	function locationTest() {
		navigator.geolocation.getCurrentPosition(handleLocation, handleError);
		console.log(sortedLocations);
		
	}
	
	function getOrderOpt(){
		var orderopt = null;
		request.open("Post","/semi/hosporder?orderopt="+encodeURIComponent(document.getElementById('orderOpt').value),true);
		request.onreadystatechange=orderProcess;
	}

	function orderProcess(){
		console.log({orderOpt: $("#orderOpt").val()});
		$.ajax({
			url: "/semi/hosporder",
			type: "post",
			data: {orderOpt:$('input[name=list_order]:checked').val()},
			success : function(data){
				console.log(data);
				var table =document.getElementById("ajaxTable");
				table.innerHTML="";
				if (data=='dist'){
					sortByDist(hospitals);
				}
				if (data=='amnt'){
					sortByAmnt(hospitals);
				}
				for(i=<%=startRow%>-1;i<<%=endRow%>;i++){
					table.insertRow();
					
					const hospname=table.insertRow();
					hospname.insertCell(0).innerText="병원명";
					hospname.insertCell(1).innerText=sortedLocations[i].hp_name;
					
					const hospaddress=table.insertRow();			
					hospaddress.insertCell(0).innerText="주소";
					hospaddress.insertCell(1).innerText=sortedLocations[i].hp_address;
					
					const hospphone=table.insertRow();
					hospphone.insertCell(0).innerText="전화번호";
					hospphone.insertCell(1).innerText=sortedLocations[i].hp_phone;
					
					const hospremain=table.insertRow();
					hospremain.insertCell(0).innerText="잔여수량";
					hospremain.insertCell(1).innerText=sortedLocations[i].remain;
					
					const btn=table.insertRow();
					btn.innerHTML="<input type=\"button\" value=\"예약\" onClick=\"location.href=\'+\"detail_reservation.jsp\"+\'\">";
				}
			}
		})
		
	}

</script>
</head>

<body onload="javascript:orderProcess();locationTest();">

	<div class="content-wrap">
		<div class="main">
			<div class="container-fluid">
				<section id="main-content">
					<div>
						<div></div>
						<input type='radio' name='list_order' value='dist' checked='checked' onclick='orderProcess();' /> 거리순 
						<input type='radio' name='list_order' value='amnt' onclick='orderProcess();' />수량순 
						       
						<select name="list_option_key" onchange="handleOnList(this)">
							<option value="none">===백신종류===</option>
							<option value="pfizer">화이자</option>
							<option value="janssen">얀센</option>
							<option value="AZ">아스트라제네카</option>
						</select>
						<div class="row">
							<div class="col-lg-3 p-0">
							<table id="ajaxTable" style="width: 100%" bgcolor="white"></table>
								
								<div style="text-align:center;" class="jsgrid-pager">
							<% if(currentPage <= 1){ %>
									[맨처음] &nbsp;
							<% }else{ %>
									<a href="/semi/indexres?page=1">[맨처음]</a> &nbsp;
							<% } %>
							<!-- 이전 페이지 그룹으로 이동 -->
							<% if((currentPage -10 ) < startPage && (currentPage - 10) > 1){ %>
									<a href="/semi/indexres?page=<%= startPage - 10 %>">[이전그룹] </a> &nbsp;
							<% }else{ %>
									[이전그룹] &nbsp;
							<% } %>
							
							<!-- 현재 페이지 그룹의 페이지 숫자 출력 -->
							<% for(int p = startPage; p<= endPage; p++){ 
									if (p == currentPage){%>
										<font color="blue" size="4">[<%= p %>]</font>
									<% }else{ %>
										<a href="/semi/indexres?page=<%= p %>"><%= p %></a>
							<% }} %>
							&nbsp;
							<!-- 다음 페이지 그룹으로 이동 -->
							<% if((currentPage +10 ) > endPage && (currentPage + 10) < maxPage){ %>
									<a href="/semi/indexres?page=<%= endPage + 10 %>">[다음그룹] </a> &nbsp;
							<% }else{ %>
									[다음그룹] &nbsp;
							<% } %>
							
							<% if(currentPage >= maxPage){ %>
									[맨끝] &nbsp;
							<% }else{ %>
									<a href="/semi/indexres?page=<%= maxPage %>">[맨끝]</a> &nbsp;
							<% } %>
							
							
						</div>
							</div>


                     <div class="col-lg-9 p-0">
                        <div id="map" style="width: 95%; height: 600px;"></div>
                     </div>
                  </div>
               </div>
               <!-- </div> -->


               <%@ include file="../common/footer.jsp"%>
            </section>
         </div>
      </div>
   </div>

   <%@ include file="../common/script.jsp"%>
</body>


</html>