<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="hospital.model.vo.VaccineInfo, java.util.ArrayList, java.util.Calendar"%>
<%
ArrayList<VaccineInfo> list = (ArrayList<VaccineInfo>) request.getAttribute("list");
//sint listCount = ((Integer) request.getAttribute("listCount")).intValue();
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
									백신 목록 조회
								</div>
								
								<div>
								<table class="display table table-borderd table-hover">
									<thead>
										<tr align="center">
											<th>백신이름</th>
											<th>제조사</th>
											<th>제조국</th>
											<th>최대접종횟수</th>
											<th>유통기간</th>
										</tr>
									</thead>
									<tbody>
										<% for (VaccineInfo vi : list){ %>
										<tr align="center">
											<th><%= vi.getVacName() %></th>
											<th><%= vi.getMadeByCompany() %></th>
											<th><%= vi.getMadeInCountry() %></th>
											<th><%= vi.getMaxIocCount() %></th>
											<th><%= vi.getExpDur() %></th>
										</tr>
										<% } %>
									</tbody>
								</table>
								</div>
								<br>
								
								<form action="/semi/insertvcinfo" method="post">
								<table align="center">
								<Tr><td><input type="text" placeholder="백신이름" name="vcname" size=10></td> 
								<Td><input type="text" placeholder="제조사" name="vccomp" size=10></Td> 
								<td><input type="text" placeholder="제조국" name="vccountry" size=10></td> 
								<Td><input type="text" placeholder="최대접종횟수" name="vccnt" size=10></Td> 
								<td><input type="text" placeholder="유통기간" name="vcexp" size=10></td> 
								<td><input type="submit" value="추가" class="btn btn-default"></td>
								<td><input type="button" value="삭제" class="btn btn-danger"
										onclick="javascript:location.href='/semi/deletevcinfo'; return false;"></td>
								</Tr>
								</table>
								</form>
																
								
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