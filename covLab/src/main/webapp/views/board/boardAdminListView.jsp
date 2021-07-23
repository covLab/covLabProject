<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시판</title>
<!--Focus Admin: Creative Admin Dashboard  -->

<%@ include file="../common/stylesheet.jsp"%>
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
									접종후기 <span> 관리자용</span>
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
									<li class="breadcrumb-item active">Table-Jsgrid</li>
								</ol>
							</div>
						</div>
					</div>
					<!-- /# column -->
				</div>
				<!-- /# row -->
				<div id="main-content">
					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="jsgrid-table-panel">
									<div id="jsGrid"></div>
								</div>
							</div>
							<!-- /# card -->
						</div>
						<!-- /# column -->
					</div>
					<!-- /# row -->

					<div class="row">
						<div class="col-lg-12">
							<div class="footer">
								<p>
									2018 © Admin Board. - <a href="#">example.com</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>






	<%@ include file="../common/script.jsp"%>
</body>
</html>

