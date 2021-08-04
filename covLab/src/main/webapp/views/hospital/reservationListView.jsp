<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="hospital.model.vo.ReservationInfo, java.util.ArrayList, java.util.Calendar"%>
<%
ArrayList<ReservationInfo> list = (ArrayList<ReservationInfo>) request.getAttribute("list");
int listCount = ((Integer) request.getAttribute("listCount")).intValue();
int startPage = ((Integer) request.getAttribute("startPage")).intValue();
int endPage = ((Integer) request.getAttribute("endPage")).intValue();
int maxPage = ((Integer) request.getAttribute("maxPage")).intValue();
int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
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
								<h1>백신 목록 페이지</h1>
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
									백신 예약 내역 조회 : <%= listCount %> 개 내역
								</div>
								
								<div>
								<table class="display table table-borderd table-hover">
									<thead>
										<tr align="center">
											<th>병원이름</th>
											<th>환자이름</th>
											<th>주민등록번호</th>
											<th>백신종류</th>
											<th>예약일시</th>
											<th>접종상태</th>
											<th> &nbsp; </th>
										</tr>
									</thead>
									<tbody>
										<% for (ReservationInfo ri : list){ %>
										<tr align="center">
											<th><%= ri.getHpName() %></th>
											<th><%= ri.getUserName() %></th>
											<th><%= ri.getUserRn() %></th>
											<th><%= ri.getVacName() %></th>
											<th><%= ri.getIocDate() %></th>
											<th><%= ri.getState() %></th>
											<th>
												<% if(ri.getState().equals("F")){ %>
													<input type="button" class="btn btn-default" value="완료">
												<% } else{ //대기, 취소 
													 if(ri.getInoCnt()==0){%>
													 	<button class="btn">1차 접종</button>
													 <%}else{ %>
													 	<button class="btn">2차 접종</button>
													 <%} %>
												<% } %>
											</th>
										</tr>
										<% } %>
									</tbody>
								</table>
								</div>
								<br>
								
							<!-- 페이징 처리 -->
						<div style="text-align:center;" class="jsgrid-pager">
							<% if(currentPage <= 1){ %>
									[맨처음] &nbsp;
							<% }else{ %>
									<a href="/semi/rinfolist?page=1">[맨처음]</a> &nbsp;
							<% } %>
							<!-- 이전 페이지 그룹으로 이동 -->
							<% if((currentPage -10 ) < startPage && (currentPage - 10) > 1){ %>
									<a href="/semi/rinfolist?page=<%= startPage - 10 %>">[이전그룹] </a> &nbsp;
							<% }else{ %>
									[이전그룹] &nbsp;
							<% } %>
							
							<!-- 현재 페이지 그룹의 페이지 숫자 출력 -->
							<% for(int p = startPage; p<= endPage; p++){ 
									if (p == currentPage){%>
										<font color="blue" size="4">[<%= p %>]</font>
									<% }else{ %>
										<a href="/semi/rinfolist?page=<%= p %>"><%= p %></a>
							<% }} %>
							&nbsp;
							<!-- 다음 페이지 그룹으로 이동 -->
							<% if((currentPage +10 ) > endPage && (currentPage + 10) < maxPage){ %>
									<a href="/semi/rinfolist?page=<%= endPage + 10 %>">[다음그룹] </a> &nbsp;
							<% }else{ %>
									[다음그룹] &nbsp;
							<% } %>
							
							<% if(currentPage >= maxPage){ %>
									[맨끝] &nbsp;
							<% }else{ %>
									<a href="/semi/rinfolist?page=<%= maxPage %>">[맨끝]</a> &nbsp;
							<% } %>
							
							<div align="right">
							<% if(loginMember == null){//로그인 안했을 때 %>
							<button onclick="moveLogin();" class="btn btn-primary wrtie">글쓰기</button>
							<% }else{ %>
							<button onclick="showWriteForm();" class="btn btn-primary wrtie">글쓰기</button>
							<% } %>
							</div>
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