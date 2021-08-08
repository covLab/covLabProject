<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="hospital.model.vo.VaccineInfo, java.util.ArrayList, java.util.Calendar"%>
<%
ArrayList<VaccineInfo> list = (ArrayList<VaccineInfo>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>백신 관리</title>




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

<script type="text/javascript" src="/semi/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
//httpRequest 객체 생성
function getXMLHttpRequest(){
	var httpRequest = null;

	if(window.ActiveXObject){
		try{
			httpRequest = new ActiveXObject("Msxml2.XMLHTTP");	
		} catch(e) {
			try{
				httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e2) { httpRequest = null; }
		}
	}
	else if(window.XMLHttpRequest){
		httpRequest = new window.XMLHttpRequest();
	}
	return httpRequest;	
}
function checkFunc(){
	if(httpRequest.readyState == 4){
		// 결과값을 가져온다.
		var resultText = httpRequest.responseText;
		if(resultText == 1){ 
			document.location.reload(); // 상세보기 창 새로고침
		}
	}
}

// delete
function requestVInfoDelete(vname){
	if (confirm("백신정보를 정말 삭제하시겠습니까??") == true){
		console.log("vname : "+vname);
		
		deleteVInfo(vname);
	}else{
		return;
	}
}
function deleteVInfo(vname){
	var param = "vname="+vname;
	
	httpRequest = getXMLHttpRequest();
	httpRequest.onreadystatechange = checkFunc;
	httpRequest.open("POST", "deletevcinfo", true);
	httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8');
	httpRequest.send(param);
	//console.log("end");
	location.reload();
}
 // update
function requestVInfoUpdate(vname){
	console.log("vname : "+vname);
	window.name = "parentForm";
	window.open("upvcinfoview?vname="+vname, "new", "top=100, left=200, width=700, height=300, status=no, menubar=no, toolbar=no, resizable=no");
	/* self.close();
	location.reload(); */
 }

</script>

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
											<th> &nbsp; </th>
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
											<th>
											<a href=# onclick="requestVInfoUpdate('<%= vi.getVacName()%>'); return false;">[수정]</a> &nbsp;
											<a href=# onclick="requestVInfoDelete('<%= vi.getVacName()%>'); return false;">[삭제]</a>
											</th>
										</tr>
										<% } %>
									</tbody>
								</table>
								</div>
								<br>
								
								<form action="/semi/insertvcinfo" method="post">
								<table align="center">
								<Tr>
								<td><input type="text" placeholder="백신이름" name="vcname" size=10></td> 
								<Td><input type="text" placeholder="제조사" name="vccomp" size=10></Td> 
								<td><input type="text" placeholder="제조국" name="vccountry" size=10></td> 
								<Td><input type="text" placeholder="최대접종횟수" name="vccnt" size=10></Td> 
								<td><input type="text" placeholder="유통기간" name="vcexp" size=10></td> 
								<td><input type="submit" value="추가" class="btn btn-default"></td>
								
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