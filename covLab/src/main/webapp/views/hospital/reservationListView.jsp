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
<script type="text/javascript" src="/semi/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function updateState(userno, page, inocnt){
	console.log("userno : "+userno);
	console.log("page : "+page);
	console.log("inocnt : "+inocnt);
	var param = "userno="+userno+"&page="+page+"&inocnt="+inocnt;
	location.href="/semi/uprinfo?"+param;
	

}	
							
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
								<h1>백신 목록 페이지</h1>
							</div>
						</div>
					
				<section id="main-content">
					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div align="center" class="card-title">
									백신 예약 내역 조회 : <%= listCount %> 개 내역
								</div>
								<br>
								<div>
								<div style="width=500px; float:left;">
								<form method="get" action="/semi/risearch">
								<select id="searchForm" name="searchCondition">
									<option value="selectnone">== 검색 ==</option>
									<option value="searchhpname">병원이름</option>
									<option value="searchusername">환자이름</option>
								</select> &nbsp;
								<label>검색어</label>
								<input id="searchKeyword" name="searchKeyword" type="text">
								<input type="submit" value="검색" class="btn btn-primary">
								</form>
								</div>
								<div style="width=300px; float:right;">
								<button class="btn btn-default" onclick="javascript:location.href='/semi/rinfolist';">전체 목록 조회</button>
								</div>
								
								<div>
								<table class="display table table-borderd table-hover">
									<thead>
										<tr align="center">
											<th>병원이름</th>
											<th>환자이름</th>
											<th>주민등록번호</th>
											<th>백신종류</th>
											<th>일련번호</th>
											<th>접종일시</th>
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
											<th><%= ri.getSerialNum() %></th>
											<th><%= ri.getIocDate() %></th>
											<th>
												<% if(ri.getState().equals("F")){ %>
													<input type="button" class="btn btn-default" value="완료">
												<% } else{ //대기, 취소 
													 if(ri.getInoCnt()==0){%>
													 	<button class="btn" onclick="updateState(<%= ri.getUserNo() %>, <%= currentPage %>, <%= ri.getInoCnt() %>);">1차 접종</button>
													 <%}else{ %>
													 	<button class="btn" onclick="updateState(<%= ri.getUserNo() %>, <%= currentPage %>, <%= ri.getInoCnt() %>);">2차 접종</button>
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
	<script src="/semi/resources/js/scripts.js"></script>
	<!-- scripit init-->
	


</body>