<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%-- <head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>백신예약사이트 CovLab</title>
<!--Focus Admin: Creative Admin Dashboard  -->
<%@ include file="../common/stylesheet.jsp"%>
<%@ include file="../common/sidebar.jsp"%>
<%@ include file="../common/topbar.jsp"%>
<!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <%-- <script src="http://maps.google.com/maps/api/js?q=seoul&key=AIzaSyCZ8XJruaL1nd6GJOryueJE_Av5O6mU5H0" type="text/javascript"></script> --%>
    <script src="http://maps.google.com/maps/search/백신/js?q=seoul&key=AIzaSyCZ8XJruaL1nd6GJOryueJE_Av5O6mU5H0" type="text/javascript"></script>
</head> --%>
<head>

        <meta charset="euc-kr">

        <title>HTML5 test</title>

        <style>

            <!--

                .supported {

                    width:300px; 

                    border:1px solid #e3e3e3; 

                    padding : 5px; 

                    font-family : Arial; 

                    font-size:0.9em; 

                    line-height:160%;

                }

            --> 

        </style> 

        <script type="text/javascript"

            src="http://maps.google.com/maps/api/js?sensor=false"></script>

        <script language="javascript"> 

            // 위치확인 

            function locationTest() {

                navigator.geolocation.getCurrentPosition(handleLocation, handleError); 

            }

            // 위치콜백 

            function handleLocation(position)  {

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

                    zoom: 13,

                    center: latlng,

                    mapTypeControl: false,

                    mapTypeId: google.maps.MapTypeId.ROADMAP

                };

 

                // 지도만들고 

                var map = new google.maps.Map(

                        document.getElementById("map"), mapOption);

             

                // 위치표시 

                new google.maps.Marker({position : latlng, map : map, title : "here!!"});

            } 

            // 에러콜백 

            function handleError(err) {

                var outDiv = document.getElementById("result");

                 

                if(err.code == 1) {

                    outDiv.innerHTML = "사용자가 위치정보 공유를 거부함";

                }

                else {

                    outDiv.innerHTML = "에러발생 : " + err.code;

                }

            } 

        </script> 

    </head>
    <body onload="javascript:locationTest();">

        <div id="result" class="supported">

 

        </div>

        <br/> 

        <div id="map" style="width:560px; height:400px; border:1px solid #e3e3e3">

         

        </div> 

    </body>


<%-- <body>
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
				</div>
				<!-- /# row -->
				<section id="main-content">
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
                                   <a href="detail_reservation.jsp" class="btn btn-primary pl-5 pr-5">예약</a> 
                                   </div>
                            </div>
    
                        </div>
                        </div>
						<div class="col-lg-9 p-0">
							<div id="map" style="width:1200px; height:600px;"></div>
                    <script type="text/javascript">

    var locations = [  
        ['강남구보건소	02-3423-5555', 37.5162581, 127.042214], [
            '삼성서울병원	02-3410-2114', 37.4881568, 127.0855952], [
            '연세대학교의과대학강남세브란스병원	02-2019-3114', 37.4927454, 127.0463152], [
            '강동경희대학교의대병원	02-440-7000', 37.5534841, 127.1576468], [
            '강동구보건소	02-3425-8565', 37.5292365, 127.1255395], [
            '성심의료재단강동성심병원	02-2224-2358', 37.5361787, 127.135423], [
            '한국보훈복지의료공단중앙보훈병원	02-2225-1100', 37.5305849, 127.1480435], [
            '강북구보건소	02-901-7706, 02-901-7704', 37.6320834, 127.0387673], [
            '강서구보건소	02-2600-5868', 37.5496053, 126.868277], [
            '이화여자대학교의과대학부속서울병원	1522-7000', 37.5371113, 126.8855845], [
            '관악구보건소	02-879-7131', 37.478434, 126.9511135], [
            '관악구보건소 신사동 코로나19 건강상담소	02-879-7241', 37.4852939, 126.9180613], [
            '에이치플러스양지병원	02-1877-8875', 37.4842166, 126.9325109], [
            '광진구보건소	02-450-1937', 37.5383735, 127.0824046], [
            '광진구보건소 자양보건지소	02-450-7090', 37.5383735, 127.0824046], [
            '건국대학교병원	02-1588-1533', 36.9789327, 127.9285366], [
            '구로구보건소	02-860-2003', 37.500076, 126.8893241], [
            '구로구보건소 가리봉동선별진료소	02-860-2018', 37.4823943, 126.888251], [
            '고려대학교의과대학부속구로병원	02-2626-1114', 37.4922173, 126.8849478], [
            '금천구보건소	02-2627-2717', 37.4570498, 126.8959514], [
            '독산보건분소	02-2627-1967', 37.4736212, 126.9022161], [
            '희명병원	02-2219-7231', 37.4556729, 126.9005925], [
            '노원구보건소	02-2116-3300 ~ 4', 37.6545591, 127.056999], [
            '노원을지대학교병원	02-970-8000', 37.636417, 127.069959], [
            '인제대학교상계백병원	02-950-1114', 37.6485082, 127.0631429], [
            '도봉구보건소	02-2091-4483', 37.6579331, 127.0387799], [
            '동대문구보건소	02-2127-4283', 37.5745905, 127.0401577], [
            '경희대학교병원	02-958-8114', 37.593894, 127.051323], [
            '삼육서울병원	1577-3675', 37.5878949, 127.0653215], [
            '서울특별시동부병원	02-920-9118~9', 37.57534, 127.03152], [
            '서울성심병원	02-966-1616', 37.5841791, 127.049928], [
            '동작구보건소	02-820-9465', 37.504569, 126.940919], [
            '동작구보건소 신대방선별진료소	02-832-9404', 37.4915587, 126.9166265], [
            '보라매병원	02-870-2114', 37.4933373, 126.9246093], [
            '마포구보건소	02-3153-9037', 37.5663123, 126.9020798], [
            '서대문구보건소	02-330-8726', 37.5785881, 126.936251], [
            '학교법인연세대학교의과대학세브란스병원	1599-1004', 37.5622702, 126.941068], [
            '서초구보건소	02-2155-8093', 37.4836015, 127.0334387], [
            '학교법인가톨릭학원가톨릭대학교서울성모병원	02-1588-1511', 37.5017688, 127.0047906], [
            '서울특별시 어린이병원	02-570-8000', 37.4554808, 127.0688387], [
            '성동구보건소	02-2286-7172', 37.5670357, 127.0331864], [
            '한양대학교병원	02-2290-8114', 37.5596479, 127.0439633], [
            '성북구보건소	02-2241-6022', 37.6026426, 127.0395181], [
            '(학)고려대학교의과대학부속병원(안암병원)	02-1577-0083', 37.5870127, 127.0268836], [
            '송파구보건소	02-2147-3478 ~ 9', 37.514543, 127.106542], [
            '재단법인아산사회복지재단서울아산병원	02-3010-3114', 37.526922, 127.108381], [
            '경찰병원	02-3400-1933', 37.4963176, 127.1234353], [
            '양천구보건소	02-2620-3856', 37.5175388, 126.8658707], [
            '서울특별시 서남병원	1566-6688', 37.5119722, 126.8332222], [
            '이화여자대학교의과대학부속목동병원	02-1666-5000', 37.5371113, 126.8855845], [
            '영등포구보건소	02-2670-4953', 37.5264549, 126.8955343], [
            '한림대학교강남성심병원	02-829-5114', 37.492737, 126.908812], [
            '가톨릭대학교 여의도성모병원	02-1661-7575', 37.5178178, 126.9355584], [
            '성애의료재단성애병원	02-840-7114', 37.5119571, 126.9223932], [
            '명지성모병원	02-829-7800', 37.4939034, 126.8992293], [
            '용산구보건소	02-2199-8371~4', 37.5323504, 126.9903613], [
            '순천향대학교 부속 서울병원	02-709-9114', 37.5339355, 127.0043336], [
            '은평구보건소	02-351-8640', 37.6024522, 126.9288474], [
            '서울특별시립 서북병원	02-3156-3022', 37.6042789, 126.9050867], [
            '서울특별시 은평병원	02-300-8060', 37.594201, 126.9232968], [
            '가톨릭대학교 은평성모병원	02-958-2114', 37.6338843, 126.9165592], [
            '종로구보건소	02-2148-3557', 37.5817774, 126.9692508], [
            '강북삼성병원	02-2001-2001', 37.5683585, 126.9674846], [
            '서울적십자병원	02-2002-8650', 37.5670139, 126.9669384], [
            '서울지구병원	02-397-2018', 37.5880278, 126.9826666], [
            '인제대학교서울백병원	02-2270-0114', 37.5649096, 126.9887525], [
            '중구보건소	02-3396-5181', 37.5638401, 127.0154705]
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




	<%@ include file="../common/script.jsp"%>
</body> --%>
</html>