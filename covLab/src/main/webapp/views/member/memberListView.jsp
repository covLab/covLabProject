<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member, java.util.ArrayList"%>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>회원 관리</title>

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
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-8 p-r-0 title-margin-right">
						<div class="page-header">
							<div class="page-title">
								<h1>
									회원 관리 페이지
								</h1>
							</div>
						</div>
					</div>
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
				</div>
				<!-- /# row -->
				<section id="main-content">
					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-title">
									<h4>현재 회원수 : <% list.size() %> 명</h4>

									
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
		
	</div>
	<!-- ---------------------------------------------------------------------------------------- -->

	<!-- jquery vendor -->
	<script src="/semi/resources/js/lib/jquery.min.js"></script>
	<script src="/semi/resources/js/lib/jquery.nanoscroller.min.js"></script>
	<script src="/semi/resources/js/lib/bootstrap.min.js"></script>
	<script src="assets/js/scripts.js"></script>
	<!-- scripit init-->


</body>