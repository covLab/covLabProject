<%@page import="java.sql.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="reservation.model.vo.Reservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="reservation.model.vo.Hospital"%>
<%
ArrayList<Reservation> list_resTime = (ArrayList<Reservation>) request.getAttribute("list_resTime");
Hospital hp = (Hospital) request.getAttribute("hp");
Reservation res = new Reservation();
ArrayList<Object> joinvacVacData = (ArrayList<Object>) request.getAttribute("joinvacVacData");
int checkRes = Integer.parseInt(request.getAttribute("checkRes").toString());
int checkSubRes = Integer.parseInt(request.getAttribute("checkSubRes").toString());
float lat = Float.parseFloat(request.getAttribute("lat").toString());
float lng = Float.parseFloat(request.getAttribute("lng").toString());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>백신예약사이트 CovLab</title>
<!--Focus Admin: Creative Admin Dashboard  -->
<%@ include file="../common/topbar.jsp"%>
<%@ include file="../common/sidebar.jsp"%>
<%@ include file="../common/script.jsp"%>
<%@ include file="../common/stylesheet.jsp"%>

<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<script
	src="http://maps.google.com/maps/api/js?q=seoul&key=AIzaSyCZ8XJruaL1nd6GJOryueJE_Av5O6mU5H0"
	type="text/javascript"></script>




<script type="text/javascript">

$(function() {
    //input을 datepicker로 선언
    $("#datepicker").datepicker({
       format: "yy/mm/dd",   //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
       startDate: '0',   //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
       autoclose : true,   //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
       calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
       clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
       daysOfWeekDisabled : [0,6],   //선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
       disableTouchKeyboard : false,   //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
       immediateUpdates: true,   //사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
       templates : {
           leftArrow: '&laquo;',
           rightArrow: '&raquo;'
       }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
       showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
       title: "날짜선택",   //캘린더 상단에 보여주는 타이틀
       todayHighlight : true,   //오늘 날짜에 하이라이팅 기능 기본값 :false 
       toggleActive : true,   //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
       weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
       language : "ko",   //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
       buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
       maxDate:"6"
    });                    
    
    //초기값을 오늘 날짜로 설정해줘야 합니다.
   $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
    
/*    function ct(){
	   var currTime = new Date();
	   alert(currTime);
	   if(carrTime.getHours <= 0)
	   	return 0;
   }
   $("#time1").timepicker({
   
      step: 30,            //시간간격 : 5분
      minTime : ct(),
      maxTime : "18:00",
      timeFormat: "H:i"    //시간:분 으로표시
   
   
   });
   $(document).ready(function(){
   
      $("#time1").timepicker('setTime', new Date());
   
   }); */
});

function getTimeStamp(date) {

    var d = date;
    var s =
        leadingZeros(d.getFullYear(), 4) + '-'+
        leadingZeros(d.getMonth() + 1, 2) + '-'+
        leadingZeros(d.getDate(), 2);

    return s;
}

function leadingZeros(n, digits) {

    var zero = '';
    n = n.toString();

    if (n.length < digits) {
        for (i = 0; i < digits - n.length; i++)
            zero += '0';
    }
    return zero + n;
}
$(function(){
		
	$('.selectTime').click(function(){
		
		
		var cv = $(this).text();

		$('#timeBox').text(cv);
		$('#timeBox').click();
		
		
		<%-- var today = $('#datepicker').datepicker("getDate");
		
		
		 
		alert(getTimeStamp(today));
		
		var list_date = [];
		<% for (Reservation date : list_resTime) {%>
			
			var sdate = '<%= date.getIoc_date()%>';
			var toDate = new Date(sdate);
			
			alert(getTimeStamp(toDate));
			
			list_date.push(toDate);
		<% } %>
		
		for(int i=0 ; i < list_date.length ; i++ ){
			alert("같음");
		} --%>	
	});
});
    

function reservationDatePopup(){
    var url = "/semi/reservationDatePopup";
    var name = "reservationDatePopup";
    var option = "width = 500, height = 500, top = 300, left = 800, location = no"
    window.open(url, name, option);
}

function termsPopup(){
	
  	var fnm = document.info;
	var date = $('#datepicker').datepicker("getDate");
	var sDate = getTimeStamp(date);

  	var time = $('#timeBox').text();
  	alert(time);
	var ioc_date = sDate+' '+time;
  
	fnm.ioc_date.value = ioc_date;
	fnm.resType.value = event.srcElement.value;
	
	fnm.vac_name.value = $("select[name=vac_name]").val();
		
	if(time == "시간대를 선택해주세요."){
		var url = "/semi/error";
		var name = "errorPage";
		var target = "errorPage";
		
	}else{
		if(fnm.resType.value == "self"){
		    var url = "/semi/tpop";
		    var name = "termsPopupPage";
		    var target = "termsPopupPage";
		}else{
			var url = "/semi/movesub";
		    var name = "subMemInfoPopupPage";
		    var target = "subMemInfoPopupPage";
		}
	}
	 var option = "width = 500, height = 500, top = 300, left = 800, location = no"
	 
	 fnm.action = url; 
	 fnm.target = target;
	 window.open('', name, option);
	 fnm.submit();
}


function cancelRes(){
	var fnm = document.info;
	
	//데이트피커 날짜 받아오기
	var date = $('#datepicker').datepicker("getDate");
	
	//날짜값 0000/00/00 형태로 변환
	var sDate = getTimeStamp(date);
	
	//timeBox(선택한 시간) 값 담기
	var time = $('#timeBox').text();
	
	//날짜값과 선택한 시간값을 합치기
	var ioc_date = sDate+' '+time;
	
	//파라미터 전송을 위해 ioc_date 담기
	fnm.ioc_date.value = ioc_date;
	
	//파라미터 전송을 위해 선택한 백신 이름값 덤기
	fnm.vac_name.value = $("select[name=vac_name]").val();
	
	//선택한 버튼의 타입 담기
	fnm.resType.value = event.srcElement.value;
	
	var url = "/semi/cpop";
	var name = "cancelPopupPage";
	var option = "width = 500, height = 500, top = 300, left = 800, location = no"
	
	fnm.action = url;
	fnm.target = "cancelPopupPage";
	
	window.open('', name, option);
	fnm.submit();
}
//위치콜백 
function handleLocation(position) {
	var outDiv = document.getElementById("result");

	// 위치정보 만들고 
	var latitude = <%=lat%>;
	console.log(latitude);
	var longitude = <%=lng%>;
	
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
	var chosen_hp;

}
//에러콜백 
function handleError(err) {
	var outDiv = document.getElementById("result");
	if (err.code == 1) {
		outDiv.innerHTML = "사용자가 위치정보 공유를 거부함";
	} else {
		outDiv.innerHTML = "에러발생 : " + err.code;
	}
}


</script>
<style type="text/css">
input:focus {
	outline: none;
}

.inputBox {
	border: none;
}

#areaBox {
	overflow: hidden;
	resize: none;
	border: none;
	outline: none;
}
</style>
</head>
<body onload="javascript:handleLocation();">
	<div class="content-wrap">
		<div class="main">
			<div class="container-fluid ">
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

					<!-- /# column -->
				</div>
				<!-- /# row -->
				<section id="main-content">
					<div class="row">

						<div class="col-lg-3 p-0 ">
							<div class="card h-100 m-0">
								<div class="card-header">
									<h5 class="card-title text-center" id="hp_name"><%=hp.getHp_name()%></h5>
								</div>
								<div class="card-body d-flex align-items-center">

									<form action="" method="post" name="info" autocomplete="off">
										<div class="form-group">
											<label for="hp_address">주소 : </label>
											<textarea name="hp_address" readonly id="areaBox"
												style="display: block;"><%=hp.getHp_address()%>
                                 </textarea>
										</div>
										<div class="form-group">
											<label class="text-label" for="hp_phone">전화번호 : </label><input
												class="control-form" type="text" name="hp_phone"
												id="areaBox" value="<%=hp.getHp_phone()%>" readonly
												class="inputBox">
										</div>
										<div class="form-group">
											<label for="">백신 : </label> <select name="vac_name"
												class="select2-selection select2-selection--single">
												<%
												for (Object obj : joinvacVacData) {
												%>
												<option
													class="select2-results__option select2-results__option--highlighted"
													value="" selected disabled hidden>선택해주세요.</option>
												<%
												if (!((ArrayList<String>) obj).isEmpty()) {
												%>
												<option
													class="select2-results__option select2-results__option--highlighted"
													value=<%=((ArrayList<String>) obj).get(2)%>><%=((ArrayList<String>) obj).get(2)%>
													-
													<%=((ArrayList<String>) obj).get(0)%>개
												</option>
												<%
												}
												%>
												<%
												}
												%>
											</select>
										</div>

										<div class="form-group">
											<p>
												날짜를 선택해주세요. <input class="form-control" type="text"
													id="datepicker" name="areaBox">
											</p>
											<div class="panel-group" id="accordion">
												<div class="panel panel-default">
													<div class="panel-heading">
														<p class="panel-title">
															<label>시간 선택: </label> <a data-toggle="collapse"
																data-parent="#accordion" href="#collapse1" id="timeBox">시간대를
																선택해주세요.</a>
														</p>
													</div>

													<div id="collapse1" class="panel-collapse collapse in">
														<div class="card">
															<div class="card-title text-center">오전</div>
															<hr>
															<ul class="nav">
																<li class="nav-item mr-1 ml-1 p-1"><a href="#"
																	class="panel-body"><span
																		class="lg-3 text-success font-weight-bold selectTime selectTime">9:00</span></a>
																</li>
																<li class="nav-item mr-1 ml-1 p-1"><a href="#"
																	class="panel-body"><span
																		class="lg-3 text-success font-weight-bold selectTime">9:30</span></a>
																</li>
																<li class="nav-item mr-1 ml-1 p-1"><a href="#"
																	class="panel-body"><span
																		class="lg-3 text-success font-weight-bold selectTime">10:00</span></a>
																</li>
																<li class="nav-item mr-1 ml-1 p-1"><a href="#"
																	class="panel-body"><span
																		class="lg-3 text-success font-weight-bold selectTime">10:30</span></a>
																</li>
																<li class="nav-item mr-1 ml-1 p-1"><a href="#"
																	class="panel-body"><span
																		class="lg-3 text-success font-weight-bold selectTime">11:00</span></a>
																</li>
																<li class="nav-item mr-1 ml-1 p-1"><a href="#"
																	class="panel-body"><span
																		class="lg-3 text-success font-weight-bold selectTime">11:30</span></a>
																</li>
															</ul>
														</div>

														<div class="card">
															<div class="card-title text-center">
																오후
																<hr>
															</div>
															<ul class="nav">
																<li class="nav-item mr-1 ml-1 p-1"><a href="#"
																	class="panel-body"><span
																		class="lg-3 text-success font-weight-bold selectTime">13:00</span></a>
																</li>
																<li class="nav-item mr-1 ml-1 p-1"><a href="#"
																	class="panel-body"><span
																		class="lg-3 text-success font-weight-bold selectTime">13:30</span></a>
																</li>
																<li class="nav-item mr-1 ml-1 p-1"><a href="#"
																	class="panel-body"><span
																		class="lg-3 text-success font-weight-bold selectTime">14:00</span></a>
																</li>
																<li class="nav-item mr-1 ml-1 p-1"><a href="#"
																	class="panel-body"><span
																		class="lg-3 text-success font-weight-bold selectTime">14:30</span></a>
																</li>
																<li class="nav-item mr-1 ml-1 p-1"><a href="#"
																	class="panel-body"><span
																		class="lg-3 text-success font-weight-bold selectTime">15:00</span></a>
																</li>
																<li class="nav-item mr-1 ml-1 p-1"><a href="#"
																	class="panel-body"><span
																		class="lg-3 text-success font-weight-bold selectTime">15:30</span></a>
																</li>
																<li class="nav-item mr-1 ml-1 p-1"><a href="#"
																	class="panel-body"><span
																		class="lg-3 text-success font-weight-bold selectTime">16:00</span></a>
																</li>
																<li class="nav-item mr-1 ml-1 p-1"><a href="#"
																	class="panel-body"><span
																		class="lg-3 text-success font-weight-bold selectTime">16:30</span></a>
																</li>
																<li class="nav-item mr-1 ml-1 p-1"><a href="#"
																	class="panel-body"><span
																		class="lg-3 text-success font-weight-bold selectTime">17:00</span></a>
																</li>
																<li class="nav-item mr-1 ml-1 p-1"><a href="#"
																	class="panel-body"><span
																		class="lg-3 text-success font-weight-bold selectTime">17:30</span></a>
																</li>
															</ul>
														</div>
													</div>

												</div>
											</div>

										</div>

										<input type="hidden" name="reg_bus_no"
											value="<%=hp.getReg_bus_no()%>" class="inputBox"> <input
											type="hidden" name="resType" value="null" class="inputBox">
										<input type="hidden" name="ioc_date" value="null"
											class="inputBox">
										<!--  
                              <input type="hidden" name="sub_user_rn" value="null" class="inputBox" id="sub_user_rn">
                              -->
									</form>
								</div>

								<div class="card-footer text-center d-inline"
									style="background-color: white;">
									<%
									if (checkRes >= 1) {
									%>
									<button onclick="cancelRes()"
										class="btn btn-rounded btn-outline-success" value="self"
										id="canBtn">예약취소</button>
									<%
									} else {
									%>
									<button onclick="termsPopup()"
										class="btn btn-rounded btn-success" value="self" id="resBtn">예약</button>
									<%
									}
									%>

									<%
									if (checkSubRes >= 1) {
									%>
									<button onclick="cancelRes()"
										class="btn btn-rounded btn-outline-info" value="sub"
										id="canBtn">대리예약취소</button>
									<%
									} else {
									%>
									<button onclick="termsPopup()" class="btn btn-rounded btn-info"
										value="sub" id="resBtn">대리예약</button>
									<%
									}
									%>
								</div>


							</div>
						</div>

						<div class="col-lg-9 p-0">
							<div class="row" id="map" style="width: 800px; height: 600px;"></div>

						</div>
					</div>

				</section>
				<%@ include file="../common/footer.jsp"%>
			</div>
		</div>
	</div>



</body>
</html>