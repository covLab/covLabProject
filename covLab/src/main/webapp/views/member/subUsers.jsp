<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Profile, java.util.ArrayList" %>
<%
	ArrayList<Profile> list = (ArrayList<Profile>)request.getAttribute("list");

%>   
<!DOCTYPE html>


<html>
 <link href="/semi/resources/css/lib/font-awesome.min.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/themify-icons.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/menubar/sidebar.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/helper.css" rel="stylesheet">
    <link href="/semi/resources/css/style.css" rel="stylesheet">
    
   <%@ include file="../common/stylesheet.jsp"%>
<%@ include file="../common/sidebar.jsp"%>
<%@ include file="../common/topbar.jsp"%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="content-wrap">
		<div class="main">
			<div class="container-fluid">
				<!--<div class="row">
					 <div class="col-lg-8 p-r-0 title-margin-right"> -->
						<div class="page-header">
							<div class="page-title">
								<h1>
									대리예약자 <span>정보</span>
								</h1>
							</div>
						</div>
					<!-- </div> 

				</div>-->
				<!-- /# row -->
				<section id="main-content">
					<!-- <div class="row">
						<div class="col-lg-12"> -->
					<div class="card">
						<!-- <div class="card-title">
                                    <h4>Bootstrap Data Table </h4>
                                </div> -->
						<!-- <div class="bootstrap-data-table-panel">-->
						<div class="table-responsive">
							
							
							
							
							<table class="display table table-borderd table-hover">

								<thead>
									<tr>
										<th>이 름</th>
										<th>주민 번호</th>
										<th>전화 번호</th>
										<th>주 소</th>
										<th>백신 종류</th>
										<th>예약 병원</th>
										<th>예약 시간</th>
										
									</tr>
								</thead>

								<tbody>
								
									<tr>
									
									  	<%for( Profile p : list){ %>
										<td><%= p.getUserName() %></td>
										<% String userrn = p.getUserRn(); %>
                                  <% char[] rn= new char[userrn.length()]; %>
                                  <%  for(int i = 0 ; i < userrn.length(); i++) {%>
                                  <%  rn[i] = userrn.charAt(i) ;} %>
                                  <%  char[] copy = new char[rn.length];%>
                                  <% for(int i = 0 ; i < copy.length; i++){%>
                                  <% if(i <= 7){ %>
                                  <%  copy[i]= rn[i]; %>
                                  <% }else{ 	copy[i] = '*'; %>
                                  <%}} %>
										<td><%= copy %></td>
										<td><%= p.getUserPhone() %></td>
										<td><%= p.getUserAddress() %></td>
										<td><%= p.getVac_name() %></td>
										<td><%= p.getHp_name() %></td>
										<td><%= p.getRev_date() %></td>
									
									
									</tr>
									<%} %>
									 <!-- //list:for each -->
							

								</tbody>


							</table>
						</div>
						<!-- </div> -->

						<!-- 페이징 처리 -->
						
					</div>
					<!-- /# card -->
					<!-- </div> -->
					<!-- /# column 
					</div>-->
					<!-- /# row -->

					  <%@ include file="../common/footer.jsp"%>
				</section>
			</div>
		</div>
	</div>

<script src="assets/js/lib/jquery.min.js"></script>
    <script src="assets/js/lib/jquery.nanoscroller.min.js"></script>
    <script src="assets/js/lib/menubar/sidebar.js"></script>
    <script src="assets/js/lib/preloader/pace.min.js"></script>
    <script src="assets/js/lib/bootstrap.min.js"></script>
    <script src="assets/js/scripts.js"></script>


	
	
</body>

</html>