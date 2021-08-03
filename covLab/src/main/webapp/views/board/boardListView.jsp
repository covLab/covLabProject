<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, board.model.vo.Board, java.sql.Date"%>
<%
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
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

<title>백신 후기</title>
<style type="text/css">
thead tr th {
	text-align: center;
}
</style>

<link href="/semi/resources/css/lib/font-awesome.min.css" rel="stylesheet">
<link href="/semi/resources/css/lib/themify-icons.css" rel="stylesheet">
<link href="/semi/resources/css/lib/menubar/sidebar.css" rel="stylesheet">
<link href="/semi/resources/css/lib/bootstrap.min.css" rel="stylesheet">
<link href="/semi/resources/css/lib/helper.css" rel="stylesheet">
<link href="/semi/resources/css/style.css" rel="stylesheet">

<%@ include file="../common/sidebar.jsp"%>
<%@ include file="../common/topbar.jsp"%>

<script type="text/javascript">
function showWriteForm(){
	location.href="/semi/views/board/boardWriteForm.jsp";
}
function moveLogin(){
	console.log("moveLogin");
	if(confirm("로그인후 이용 가능합니다. \n확인을 누르면 로그인 페이지로 이동합니다.") == true){
		location.href="/semi/views/member/login.jsp";
	}else{
		return;
	}
}

</script>
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
									접종 후기 <span>게시판</span>
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
							
							<div><form method="get" action="/semi/bsearch">
								<select id="searchForm" name="searchCondition">
									<option value="selectnone">== 검색 ==</option>
									<option value="searchboardno">글 번호</option>
									<option value="searchboardtitle">제 목</option>
									<option value="searchboardwriter">작성자</option>
								</select> &nbsp;
								<label>검색어</label>
								<input id="searchKeyword" name="searchKeyword" type="text">
								<input type="submit" value="검색" class="btn btn-primary">
							</form></div>
							
							
							<table class="display table table-borderd table-hover">

								<thead>
									<tr>
										<th>글 번호</th>
										<th>제 목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회수</th>
										<th>추천수</th>
									</tr>
								</thead>

								<tbody>
									<%
									for (Board b : list) {
									%>
									<tr>
										<td align="center"><%=b.getBoardNo()%></td>
										<td><a href="/semi/bdetail?bno=<%= b.getBoardNo() %>&page=<%= currentPage %>"><%=b.getBoardTitle()%></a></td>
										<td align="center"><%=b.getBoardWriter()%></td>
										<td align="center"><%=b.getBoardDate()%></td>
										<td align="center"><%=b.getViewCnt()%></td>
										<td align="center"><%=b.getRecommendCnt()%></td>
									</tr>
									<%
									} //list:for each
									%>

								</tbody>

							</table>
						</div>
						<!-- </div> -->

						<!-- 페이징 처리 -->
						<div style="text-align:center;" class="jsgrid-pager">
							<% if(currentPage <= 1){ %>
									[맨처음] &nbsp;
							<% }else{ %>
									<a href="/semi/blist?page=1">[맨처음]</a> &nbsp;
							<% } %>
							<!-- 이전 페이지 그룹으로 이동 -->
							<% if((currentPage -10 ) < startPage && (currentPage - 10) > 1){ %>
									<a href="/semi/blist?page=<%= startPage - 10 %>">[이전그룹] </a> &nbsp;
							<% }else{ %>
									[이전그룹] &nbsp;
							<% } %>
							
							<!-- 현재 페이지 그룹의 페이지 숫자 출력 -->
							<% for(int p = startPage; p<= endPage; p++){ 
									if (p == currentPage){%>
										<font color="blue" size="4">[<%= p %>]</font>
									<% }else{ %>
										<a href="/semi/blist?page=<%= p %>"><%= p %></a>
							<% }} %>
							&nbsp;
							<!-- 다음 페이지 그룹으로 이동 -->
							<% if((currentPage +10 ) > endPage && (currentPage + 10) < maxPage){ %>
									<a href="/semi/blist?page=<%= endPage + 10 %>">[다음그룹] </a> &nbsp;
							<% }else{ %>
									[다음그룹] &nbsp;
							<% } %>
							
							<% if(currentPage >= maxPage){ %>
									[맨끝] &nbsp;
							<% }else{ %>
									<a href="/semi/blist?page=<%= maxPage %>">[맨끝]</a> &nbsp;
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
					<!-- /# card -->
					<!-- </div> -->
					<!-- /# column 
					</div>-->
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
				</section>
			</div>
		</div>
	</div>




	<!-- jquery vendor -->
	<script src="/semi/resources/js/lib/jquery.min.js"></script>
	<script src="/semi/resources/js/lib/jquery.nanoscroller.min.js"></script>
	<!-- nano scroller -->
	<script src="/semi/resources/js/lib/menubar/sidebar.js"></script>
	<script src="/semi/resources/js/lib/preloader/pace.min.js"></script>
	<!-- sidebar
    
    bootstrap -->

	<script src="/semi/resources/js/lib/bootstrap.min.js"></script>
	<script src="/semi/resources/js/scripts.js"></script>
	<!--  scripit init -->
	<script src="/semi/resources/js/lib/data-table/datatables.min.js"></script>
	<script
		src="/semi/resources/js/lib/data-table/dataTables.buttons.min.js"></script>
	<script src="/semi/resources/js/lib/data-table/jszip.min.js"></script>
	<script src="/semi/resources/js/lib/data-table/pdfmake.min.js"></script>
	<script src="/semi/resources/js/lib/data-table/vfs_fonts.js"></script>
	<script src="/semi/resources/js/lib/data-table/buttons.html5.min.js"></script>
	<script src="/semi/resources/js/lib/data-table/buttons.print.min.js"></script>
	<script src="/semi/resources/js/lib/data-table/buttons.colVis.min.js"></script>
	<script src="/semi/resources/js/lib/data-table/datatables-init.js"></script>
</body>

</html>