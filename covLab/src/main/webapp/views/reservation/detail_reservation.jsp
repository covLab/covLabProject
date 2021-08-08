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
Reservation resByUserRn =  (Reservation)request.getAttribute("resByUserRn");
Reservation resBySubUserRn =  (Reservation)request.getAttribute("resBySubUserRn");
ArrayList<Object> joinvacVacData = (ArrayList<Object>) request.getAttribute("joinvacVacData");
int checkRes = Integer.parseInt(request.getAttribute("checkRes").toString());
int checkSubRes = Integer.parseInt(request.getAttribute("checkSubRes").toString());
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
$(function () {
	
    var sop = $('.selectpicker');
    <% for (Object obj: joinvacVacData) {%>
		<% if( !((ArrayList<String>) obj).isEmpty() ) {%>
   	 	var text = "<%= ((ArrayList<String>) obj).get(2)%>  -  <%= ((ArrayList<String>) obj).get(0)%>개";
   	 	var value = "<%= ((ArrayList<String>) obj).get(2) %>";
    		sop.append(new Option( text , value ,false, false ));
		<%} %>
	<%} %>
	
    $('.selectpicker').selectpicker();
    $('.selectpicker').on('click', function(){
    	$(".selectpicker").hide();
    });
    

});	


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
       showAnim: "slide", 
       buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
       maxDate:"6"
    });                    
    
    //초기값을 오늘 날짜로 설정해줘야 합니다.
   $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
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

$(function (){
	$("#timeBox").click(function (){
		$("#timeBox").toggle();
	});
});

$(function(){
		
	$('.selectTime').click(function(){
		
		
		var cv = $(this).text();

		$('#timeBox').text(cv);
		$('#timeBox').click();
		
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
<body>
	<div class="content-wrap">
		<div class="main">
			<div class="container ">
				<div class="row">
					<div class="col-lg-8 p-r-0 title-margin-right">
						<div class="page-header">
							<div class="page-title">
							</div>
						</div>
					</div>
					<!-- /# column -->

					<!-- /# column -->
				</div>
				<!-- /# row -->
				<section class="span12" id="main-content">
					<div class="row">

						<div class="col-lg-4 p-0 border-radius">
							<div class="card h-100 m-0 border border" style="">
								<div class="card-header border-top-radius">
									<h5 class="card-title text-center" id="hp_name"><%=hp.getHp_name()%></h5>
								</div>
								<div class="card-body">

									<form action="" method="post" name="info" autocomplete="off">
									
									
										<div class="form-group mt-3 mb-0">
											<label class="col-sm-5 col-form-label pl-0"  for="hp_address">주소</label>
											
											<div class="col pl-0">
											<textarea class="control-form"  name="hp_address" readonly id="areaBox"
												style="display: block;"><%=hp.getHp_address()%>
                                			 </textarea>
											</div>
										</div>
										<div class="form-group">
											<label class="col form-labe pl-0" for="hp_phone">전화번호</label>
											<div class="col pl-0">
											<input class="control-form" type="text"
												name="hp_phone" id= "areaBox" value="<%=hp.getHp_phone()%>" readonly
												class="inputBox">
											</div>
										</div>
										
										<div class="form-group">
											<label class="col form-labe pl-0" for="vac_name">백신 </label>
												<select name="vac_name" class="selectpicker form-control" multiple>
												<%-- <% for (Object obj: joinvacVacData) {%>
													<option  value="" selected disabled hidden >선택해주세요.</option>
													<% if( !((ArrayList<String>) obj).isEmpty() ) {%>
												    <option value=<%= ((ArrayList<String>) obj).get(2) %>><%= ((ArrayList<String>) obj).get(2)%>  -  <%= ((ArrayList<String>) obj).get(0)%>개</option>
													<%} %>
												<%} %> --%>
												</select>
										</div>


										<div class="form-group">
										<label class="col form-labe pl-0">
											날짜를 선택해주세요.
										</label>
											<div class="input-group input-group-unstyled border rounded">
												<input class="form-control border-none" type="text" id="datepicker"
													name="areaBox"> 
													<span class="align-self-center mr-1 ml-1 "> <i
													class="far fa-calendar-alt fa-2x"></i></span>
											</div>
										</div>

										<div class="form-group">
											<div class="panel-group" id="accordion">
											
												<div class="panel panel-default">
												
													<div class="panel-heading">
															<label class="col form-labe pl-0" >시간 선택</label> 
															
															<div class="input-group input-group-unstyled border rounded">
															<a data-toggle="collapse"
																data-parent="#accordion" href="#collapse1" id="timeBox" class="form-control border-none">시간대를 선택해주세요.</a>
																<span class="align-self-center mr-1 ml-1 "> 
																<i class="far fa-clock fa-2x"></i></span>
															</div>
																
																
													</div>

													<div id="collapse1" class="panel-collapse collapse in">
														<div class="card">
															<div class="card-title text-center">오전</div><hr>
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
										</form>
                              
											<div class="card-footer mt-5" style="background-color: white;">
											<div class=" mt-3 text-center">
											<%
											if ( checkRes >= 1) {
												if( resByUserRn.getReg_bus_no().equals(hp.getReg_bus_no())){
												%>
												<button onclick="cancelRes()" class="btn btn-rounded btn-outline-success" value="self"
													id="canBtn">예약취소</button>
												<%
												}
											}else {
												%>
												<button onclick="termsPopup()" class="btn btn-rounded btn-success" value="self"
													id="resBtn">예약</button>
												<%
											}
											%>


											<%
											if ( checkSubRes >= 1) {
												if( resBySubUserRn.getReg_bus_no().equals(hp.getReg_bus_no())){
												%>
												<button onclick="cancelRes()" class="btn btn-rounded btn-outline-info" value="sub"
													id="canBtn">대리예약취소</button>
												<%
												}
											}else {
												%>
												<button onclick="termsPopup()" class="btn btn-rounded btn-info" value="sub"
													id="resBtn">대리예약</button>
												<%
											}
											%>
											</div>
											</div>
									

							</div>
						</div>
						</div>

						<div class="col-lg-8 p-0" >
							<div class="row" id="map" style="width: 100%; height: 100%;"></div>
							<script type="text/javascript">

    var locations = [  
        ['강남구보건소   02-3423-5555', 37.5162581, 127.042214], [
            '삼성서울병원   02-3410-2114', 37.4881568, 127.0855952], [
            '연세대학교의과대학강남세브란스병원   02-2019-3114', 37.4927454, 127.0463152], [
            '강동경희대학교의대병원   02-440-7000', 37.5534841, 127.1576468], [
            '강동구보건소   02-3425-8565', 37.5292365, 127.1255395], [
            '성심의료재단강동성심병원   02-2224-2358', 37.5361787, 127.135423], [
            '한국보훈복지의료공단중앙보훈병원   02-2225-1100', 37.5305849, 127.1480435], [
            '강북구보건소   02-901-7706, 02-901-7704', 37.6320834, 127.0387673], [
            '강서구보건소   02-2600-5868', 37.5496053, 126.868277], [
            '이화여자대학교의과대학부속서울병원   1522-7000', 37.5371113, 126.8855845], [
            '관악구보건소   02-879-7131', 37.478434, 126.9511135], [
            '관악구보건소 신사동 코로나19 건강상담소   02-879-7241', 37.4852939, 126.9180613], [
            '에이치플러스양지병원   02-1877-8875', 37.4842166, 126.9325109], [
            '광진구보건소   02-450-1937', 37.5383735, 127.0824046], [
            '광진구보건소 자양보건지소   02-450-7090', 37.5383735, 127.0824046], [
            '건국대학교병원   02-1588-1533', 36.9789327, 127.9285366], [
            '구로구보건소   02-860-2003', 37.500076, 126.8893241], [
            '구로구보건소 가리봉동선별진료소   02-860-2018', 37.4823943, 126.888251], [
            '고려대학교의과대학부속구로병원   02-2626-1114', 37.4922173, 126.8849478], [
            '금천구보건소   02-2627-2717', 37.4570498, 126.8959514], [
            '독산보건분소   02-2627-1967', 37.4736212, 126.9022161], [
            '희명병원   02-2219-7231', 37.4556729, 126.9005925], [
            '노원구보건소   02-2116-3300 ~ 4', 37.6545591, 127.056999], [
            '노원을지대학교병원   02-970-8000', 37.636417, 127.069959], [
            '인제대학교상계백병원   02-950-1114', 37.6485082, 127.0631429], [
            '도봉구보건소   02-2091-4483', 37.6579331, 127.0387799], [
            '동대문구보건소   02-2127-4283', 37.5745905, 127.0401577], [
            '경희대학교병원   02-958-8114', 37.593894, 127.051323], [
            '삼육서울병원   1577-3675', 37.5878949, 127.0653215], [
            '서울특별시동부병원   02-920-9118~9', 37.57534, 127.03152], [
            '서울성심병원   02-966-1616', 37.5841791, 127.049928], [
            '동작구보건소   02-820-9465', 37.504569, 126.940919], [
            '동작구보건소 신대방선별진료소   02-832-9404', 37.4915587, 126.9166265], [
            '보라매병원   02-870-2114', 37.4933373, 126.9246093], [
            '마포구보건소   02-3153-9037', 37.5663123, 126.9020798], [
            '서대문구보건소   02-330-8726', 37.5785881, 126.936251], [
            '학교법인연세대학교의과대학세브란스병원   1599-1004', 37.5622702, 126.941068], [
            '서초구보건소   02-2155-8093', 37.4836015, 127.0334387], [
            '학교법인가톨릭학원가톨릭대학교서울성모병원   02-1588-1511', 37.5017688, 127.0047906], [
            '서울특별시 어린이병원   02-570-8000', 37.4554808, 127.0688387], [
            '성동구보건소   02-2286-7172', 37.5670357, 127.0331864], [
            '한양대학교병원   02-2290-8114', 37.5596479, 127.0439633], [
            '성북구보건소   02-2241-6022', 37.6026426, 127.0395181], [
            '(학)고려대학교의과대학부속병원(안암병원)   02-1577-0083', 37.5870127, 127.0268836], [
            '송파구보건소   02-2147-3478 ~ 9', 37.514543, 127.106542], [
            '재단법인아산사회복지재단서울아산병원   02-3010-3114', 37.526922, 127.108381], [
            '경찰병원   02-3400-1933', 37.4963176, 127.1234353], [
            '양천구보건소   02-2620-3856', 37.5175388, 126.8658707], [
            '서울특별시 서남병원   1566-6688', 37.5119722, 126.8332222], [
            '이화여자대학교의과대학부속목동병원   02-1666-5000', 37.5371113, 126.8855845], [
            '영등포구보건소   02-2670-4953', 37.5264549, 126.8955343], [
            '한림대학교강남성심병원   02-829-5114', 37.492737, 126.908812], [
            '가톨릭대학교 여의도성모병원   02-1661-7575', 37.5178178, 126.9355584], [
            '성애의료재단성애병원   02-840-7114', 37.5119571, 126.9223932], [
            '명지성모병원   02-829-7800', 37.4939034, 126.8992293], [
            '용산구보건소   02-2199-8371~4', 37.5323504, 126.9903613], [
            '순천향대학교 부속 서울병원   02-709-9114', 37.5339355, 127.0043336], [
            '은평구보건소   02-351-8640', 37.6024522, 126.9288474], [
            '서울특별시립 서북병원   02-3156-3022', 37.6042789, 126.9050867], [
            '서울특별시 은평병원   02-300-8060', 37.594201, 126.9232968], [
            '가톨릭대학교 은평성모병원   02-958-2114', 37.6338843, 126.9165592], [
            '종로구보건소   02-2148-3557', 37.5817774, 126.9692508], [
            '강북삼성병원   02-2001-2001', 37.5683585, 126.9674846], [
            '서울적십자병원   02-2002-8650', 37.5670139, 126.9669384], [
            '서울지구병원   02-397-2018', 37.5880278, 126.9826666], [
            '인제대학교서울백병원   02-2270-0114', 37.5649096, 126.9887525], [
            '중구보건소   02-3396-5181', 37.5638401, 127.0154705]
                        ];



    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 11.5,
        center: new google.maps.LatLng(37.559085, 126.998501),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;

    for (i = 0; i < locations.length; i++) {  
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map
      });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][0]);
          infowindow.open(map, marker);
        }
      })(marker, i));
                        }


  </script>
						</div>
				</div>

				</section>
				<%@ include file="../common/footer.jsp"%>
			</div>
		</div>
	</div>



</body>
</html>