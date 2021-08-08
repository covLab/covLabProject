<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="member.model.vo.Member, reservation.model.vo.Reservation, java.util.ArrayList, java.util.Calendar"%>
<%
ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
int listCount = ((Integer) request.getAttribute("listCount")).intValue();
int startPage = ((Integer) request.getAttribute("startPage")).intValue();
int endPage = ((Integer) request.getAttribute("endPage")).intValue();
int maxPage = ((Integer) request.getAttribute("maxPage")).intValue();
int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
ArrayList<Reservation> rlist = (ArrayList<Reservation>) request.getAttribute("rlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>회원 관리</title>
<style type="text/css">
form.sform{

	display: none; 
}
</style>

<script type="text/javascript" src="/semi/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
//검색 유형
$(function(){
	//이 영역 안에서 작성된 이벤트 핸들러는 자동 실행 준비 상태가 됨
	$("input[name=item]").on("change", function(){
		//여러개의 태그중에 체크상태가 바뀐 태그 처리
		$("input[name=item]").each(function(index){
			//radio 순번대로 하나씩 checked 인지 확인
			if($(this).is(":checked")){
				$("form.sform").eq(index).css("display", "block");
			}else{
				$("form.sform").eq(index).css("display", "none");
			}
		});
	});
});
/* //회원 유형
function changeLogin(element){
	//체크 상태가 변경된(change) input 태그의 name 속성값에서 userid 를 분리 추출함
	var userid = element.name.substring(8);
	console.log("userid : "+userid);
	
	if(element.checked == true && element.value =="false"){
		console.log("로그인 제한 체크");
		location.href = "/semi/loginok?userid=" + userid + "&ok=false";
	}else{
		console.log("로그인 가능 체크");
		location.href = "/semi/loginok?userid=" + userid + "&ok=true";
	}
} */
</script>

<!-- ================= Favicon ================== -->
<!-- Standard -->
<link rel="shortcut icon" href="http://placehold.it/64.png/000/fff">
<!-- Retina iPad Touch Icon-->
<link rel="apple-touch-icon" sizes="144x144"
	href="http://placehold.it/144.png/000/fff">
<!-- Retina iPhone Touch Icon-->
<link rel="apple-touch-icon" sizes="114x114"
	href="http://placehold.it/114.png/000/fff">
<!-- Standard iPad Touch Icon-->
<link rel="apple-touch-icon" sizes="72x72"
	href="http://placehold.it/72.png/000/fff">
<!-- Standard iPhone Touch Icon-->
<link rel="apple-touch-icon" sizes="57x57"
	href="http://placehold.it/57.png/000/fff">

<!-- Styles -->
<link href="/semi/resources/css/lib/font-awesome.min.css"
	rel="stylesheet">
<link href="/semi/resources/css/lib/themify-icons.css" rel="stylesheet">
<link href="/semi/resources/css/lib/menubar/sidebar.css"
	rel="stylesheet">
<link href="/semi/resources/css/lib/bootstrap.min.css" rel="stylesheet">
<link href="/semi/resources/css/lib/helper.css" rel="stylesheet">
<link href="/semi/resources/css/style.css" rel="stylesheet">

<%@ include file="../common/sidebar.jsp"%>
<%@ include file="../common/topbar.jsp"%>


</head>


<body>
	<div class="content-wrap">
		<div class="main">
			<div class="container-fluid"><!-- ?? -->
				<!-- <div class="row">
					<div class="col-lg-8 p-r-0 title-margin-right"> -->
						<div class="page-header">
							<div class="page-title">
								<h1>회원 관리 페이지</h1>
							</div>
						</div>
					<!-- </div> -->
					<!-- /# column -->
					<!-- <div class="col-lg-4 p-l-0 title-margin-left">
						<div class="page-header">
							<div class="page-title">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
									<li class="breadcrumb-item active">Table-Row-Select</li>
								</ol>
							</div>
						</div>
					</div> -->
					<!-- /# column -->
				<!-- </div> -->
				<!-- /# row -->
				<section id="main-content">
					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div align="center" class="card-title">
									회원수 : <%= listCount %> 명
								</div>
								<div align=right><button class="btn btn-default" onclick="javascript:location.href='/semi/mlist';">전체 목록 조회</button>
								</div><br>
								<%-- 항목별 검색 기능 추가 --%>
								<fieldset id="ss">
									<legend>검색할 항목을 선택하세요.</legend>
									<input type="radio" name="item" id="uno"> 회원 번호 &nbsp;
									<input type="radio" name="item" id="uname"> 회원 이름 &nbsp;
									<input type="radio" name="item" id="ugen"> 성별 &nbsp; 
									<input type="radio" name="item" id="uage"> 연령대 &nbsp; 
									<input type="radio" name="item" id="ulogtype"> 회원 유형 &nbsp;
								</fieldset>
								
								<%-- 아이디 검색 폼 --%>
								<form id="noform" class="sform" action="/semi/msearch" method="post">
									<input type="hidden" name="action" value="no">
									<fieldset>
										<legend>검색할 회원번호를 입력하세요.</legend>
										<input type="search" name="keyword"> &nbsp; <input
											type="submit" value="검색">
									</fieldset>
								</form>
								<%-- 이름 검색 폼 --%>
								<form id="nameform" class="sform" action="/semi/msearch" method="post">
									<input type="hidden" name="action" value="name">
									<fieldset>
										<legend>검색할 이름을 입력하세요.</legend>
										<input type="search" name="keyword"> &nbsp;
										<input type="submit" value="검색">
									</fieldset>
								</form>
								<%-- 성별 검색 폼 --%>
								<form id="genderform" class="sform" action="/semi/msearch" method="post">
									<input type="hidden" name="action" value="gender">
									<fieldset>
										<legend>검색할 성별을 선택하세요.</legend>
										<input type="radio" name="keyword" value="M"> 남자
										&nbsp; <input type="radio" name="keyword" value="F">
										여자 &nbsp; <input type="submit" value="검색">
									</fieldset>
								</form>
								<%-- 연령대 검색 폼 --%>
								<form id="ageform" class="sform" action="/semi/msearch" method="post">
									<input type="hidden" name="action" value="age">
									<fieldset>
										<legend>검색할 연령대를 선택하세요.</legend>
										<input type="radio" name="keyword" value="20"> 20대
										&nbsp; <input type="radio" name="keyword" value="30">
										30대 &nbsp; <input type="radio" name="keyword" value="40">
										40대 &nbsp; <input type="radio" name="keyword" value="50">
										50대 &nbsp; <input type="radio" name="keyword" value="60">
										60대 이상 &nbsp; <input type="submit" value="검색">
									</fieldset>
								</form>
								
								<%-- 회원 유형별 검색 폼 --%>
								<form id="lokform" class="sform" action="/semi/msearch" method="post">
									<input type="hidden" name="action" value="logintype">
									<fieldset>
										<legend>검색할 회원 유형을 선택하세요.</legend>
										<input type="radio" name="keyword" value="U"> 일반 회원 &nbsp; 
										<input type="radio" name="keyword" value="A"> 관리자 &nbsp; 
										<input type="radio" name="keyword" value="H"> 병원 
										<input type="submit" value="검색">
									</fieldset>
								</form><hr>
								
								<div>
								<table class="display table table-borderd table-hover">
									<thead>
										<tr>
											<th>회원 번호</th>
											<th>이름</th>
											<th>대리 회원</th>
											<th>성별</th>
											<th>주민번호</th>
											<th>나이(만)</th>
											<th>핸드폰번호</th>
											<th>주소</th>
											<th>예약일시</th>
											<th>sms 수신</th>
											<th>접종회차</th>
										</tr>
									</thead>
									<tbody>
										<tr>
										<% for (Member m : list){ %>
										<% String reserv = "";
										for (Reservation r : rlist){
											if(m.getUserRn().equals(r.getUser_rn())){
												reserv = r.getRev_date().toString();
											}
										}
										
										%>
										<% String userGrade=""; 
										if(m.getUserId() == null){//회원유형 : 대리회원
											userGrade = m.getSubUserNo()+"번 회원의 대리 회원"; 
										}else userGrade="일반 회원";
										String gender = "";
										char ch = m.getUserRn().charAt(7);
										switch(ch){//성별
										case '1': case '3': case '5': gender = "남자"; break;
										case '2': case '4': case '6': gender = "여자"; break;
										}
										Calendar current = Calendar.getInstance();
								        int currentYear  = current.get(Calendar.YEAR);
								        int currentMonth = current.get(Calendar.MONTH) + 1;
								        int currentDay   = current.get(Calendar.DAY_OF_MONTH);
								        int birthYear = Integer.parseInt(m.getUserRn().substring(0, 2));
										if(ch =='1'|| ch=='2'){
								        	birthYear += 1900;
								        }else if(ch =='3'|| ch=='4'){
								        	birthYear += 2000;
								        }
								        int birthMonth = Integer.parseInt(m.getUserRn().substring(2, 4));
										int birthDay = Integer.parseInt(m.getUserRn().substring(4, 6));

								        int age = currentYear - birthYear;
								        // 생일 안 지난 경우 -1
								        if (birthMonth * 100 + birthDay > currentMonth * 100 + currentDay)  
								            age--; 
								        

										%>
											<th><%= m.getUserNo() %></th>
											<th><%= m.getUserName() %></th>
											<th><%= userGrade %></th>
											<th><%= gender %></th>
											<th><%= m.getUserRn().substring(0, 8)+"******" %></th>
											<th><%= age %></th> 
											<th><%= m.getUserPhone() %></th>
											<th><%= m.getUserAddress() %></th>
											<th><%= reserv %></th>
											<th><%= (m.getSmsAgr().equals("Y"))?"동의":"비동의" %></th>
											<th><%= m.getInoCnt() %></th>
										</tr>
										<% } %>
									</tbody>
								
								</table>
								</div>

								<!-- 페이징 처리 -->
						<div style="text-align:center;" class="jsgrid-pager">
							<% if(currentPage <= 1){ %>
									[맨처음] &nbsp;
							<% }else{ %>
									<a href="/semi/mlist?page=1">[맨처음]</a> &nbsp;
							<% } %>
							<!-- 이전 페이지 그룹으로 이동 -->
							<% if((currentPage -10 ) < startPage && (currentPage - 10) > 1){ %>
									<a href="/semi/mlist?page=<%= startPage - 10 %>">[이전그룹] </a> &nbsp;
							<% }else{ %>
									[이전그룹] &nbsp;
							<% } %>
							
							<!-- 현재 페이지 그룹의 페이지 숫자 출력 -->
							<% for(int p = startPage; p<= endPage; p++){ 
									if (p == currentPage){%>
										<font color="blue" size="4">[<%= p %>]</font>
									<% }else{ %>
										<a href="/semi/mlist?page=<%= p %>"><%= p %></a>
							<% }} %>
							&nbsp;
							<!-- 다음 페이지 그룹으로 이동 -->
							<% if((currentPage +10 ) > endPage && (currentPage + 10) < maxPage){ %>
									<a href="/semi/mlist?page=<%= endPage + 10 %>">[다음그룹] </a> &nbsp;
							<% }else{ %>
									[다음그룹] &nbsp;
							<% } %>
							
							<% if(currentPage >= maxPage){ %>
									[맨끝] &nbsp;
							<% }else{ %>
									<a href="/semi/mlist?page=<%= maxPage %>">[맨끝]</a> &nbsp;
							<% } %>
							
							
						</div>
								
								
								
							</div>
						</div>
					</div>
					<!-- /# card -->
				</section>
			</div>
			<!-- /# column -->
		</div>
		<!-- /# row -->
<%@ include file="../common/footer.jsp" %>
	</div>
	<!-- ---------------------------------------------------------------------------------------- -->

	<!-- jquery vendor -->
	<script src="/semi/resources/js/lib/jquery.min.js"></script>
	<script src="/semi/resources/js/lib/jquery.nanoscroller.min.js"></script>
	<script src="/semi/resources/js/lib/bootstrap.min.js"></script>
	<script src="assets/js/scripts.js"></script>
	<!-- scripit init-->
	


</body>