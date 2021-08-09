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
   
   //Board board = (Board)request.getAttribute("board");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시판</title>

<link href="/semi/resources/css/lib/font-awesome.min.css" rel="stylesheet">
<link href="/semi/resources/css/lib/themify-icons.css" rel="stylesheet">
<link href="/semi/resources/css/lib/menubar/sidebar.css" rel="stylesheet">
<link href="/semi/resources/css/lib/bootstrap.min.css" rel="stylesheet">
<link href="/semi/resources/css/lib/helper.css" rel="stylesheet">
<link href="/semi/resources/css/style.css" rel="stylesheet">

<%@ include file="../common/sidebar.jsp"%>
<%@ include file="../common/topbar.jsp"%>

</head>
<body>
<script type="text/javascript" src="/semi/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function showWriteForm(){
   location.href="/semi/views/board/boardWriteForm.jsp";
}

</script>


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
               
            <section id="main-content">
               
               <div class="card">
               <div class="table-responsive">
                     <div>
							<div style="width=500px; float:left;">
							<form method="get" action="/semi/bsearch">
								<select id="searchForm" name="searchCondition">
									<option value="selectnone">== 검색 ==</option>
									<option value="searchboardno">글 번호</option>
									<option value="searchboardtitle">제 목</option>
									<option value="searchboardwriter">작성자</option>
								</select> &nbsp;
								<label>검색어</label>
								<input id="searchKeyword" name="searchKeyword" type="text">
								<input type="submit" value="검색" class="btn btn-primary">
							</form>	</div>							
								<div style="width=300px; float:right;">
								<button class="btn btn-default" onclick="javascript:location.href='/semi/blistadmin';">전체 목록 조회</button>
								</div>							
							
							</div>
                     
                <form action="/semi/bdeleteadmin" method="post" id="multidelete">
                <input type="hidden" name="page" value="<%= currentPage %>">
                    <table class="display table table-borderd table-hover">

                        <thead>
                           <tr>
                              <th>글 번호</th>
                              <th>제 목</th>
                              <th>작성자</th>
                              <th>작성일</th>
                              <th>조회수</th>
                              <th>추천수</th>
                              <th> &nbsp; </th>
                           </tr>
                        </thead>

                        <tbody>
                           <%
                           for (Board b : list) {
                           %>
                           
                           <tr>
                              <td><%=b.getBoardNo()%></td>
                              <td><a href="/semi/bdetail?bno=<%= b.getBoardNo() %>&page=<%= currentPage %>">
                              <%=b.getBoardTitle()%></a></td>
                              <td><%=b.getBoardWriter()%></td>
                              <td><%=b.getBoardDate()%></td>
                              <td><%=b.getViewCnt()%></td>
                              <td><%=b.getRecommendCnt()%></td>
                              <td><input type="checkbox" name="chk" value="<%= b.getBoardNo() %>"></td>
                           </tr>   
                           <%
                           } //list:for each
                           %>
                           

                        </tbody>

                     </table>
                     <div align="right">
                     <input type="button" onclick="showWriteForm();" class="btn btn-primary wrtie" value="글쓰기"> &nbsp;<!-- 
                     <button onclick="requestDelete(); return false;" class="btn btn-danger">글 삭제</button>  &nbsp;
                     <button id="delete" class="btn btn-danger">글 삭제</button>   -->
                     <input type="submit" class="btn btn-danger" value="삭제">
                     </div>
                     </form>
                  </div>
                  <!-- </div> -->

                  <!-- 페이징 처리 -->
                  <div style="text-align:center;" class="jsgrid-pager">
                     <% if(currentPage <= 1){ %>
                           [맨처음] &nbsp;
                     <% }else{ %>
                           <a href="/semi/blistadmin?page=1">[맨처음]</a> &nbsp;
                     <% } %>
                     <!-- 이전 페이지 그룹으로 이동 -->
                     <% if((currentPage -10 ) < startPage && (currentPage - 10) > 1){ %>
                           <a href="/semi/blistadmin?page=<%= startPage - 10 %>">[이전그룹] </a> &nbsp;
                     <% }else{ %>
                           [이전그룹] &nbsp;
                     <% } %>
                     
                     <!-- 현재 페이지 그룹의 페이지 숫자 출력 -->
                     <% for(int p = startPage; p<= endPage; p++){ 
                           if (p == currentPage){%>
                              <font color="blue" size="4">[<%= p %>]</font>
                           <% }else{ %>
                              <a href="/semi/blistadmin?page=<%= p %>"><%= p %></a>
                     <% }} %>
                     &nbsp;
                     <!-- 다음 페이지 그룹으로 이동 -->
                     <% if((currentPage +10 ) > endPage && (currentPage + 10) < maxPage){ %>
                           <a href="/semi/blistadmin?page=<%= endPage + 10 %>">[다음그룹] </a> &nbsp;
                     <% }else{ %>
                           [다음그룹] &nbsp;
                     <% } %>
                     
                     <% if(currentPage >= maxPage){ %>
                           [맨끝] &nbsp;
                     <% }else{ %>
                           <a href="/semi/blistadmin?page=<%= maxPage %>">[맨끝]</a> &nbsp;
                     <% } %>
                     
                     
                     
                    
                  </div>
               </div>



               <%@ include file="../common/footer.jsp" %>
            </section>
         </div>
      </div>
   </div>




</body>
</html>