<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.model.vo.Board, java.util.ArrayList, board.comments.model.vo.Comments, java.sql.Date" %>
<% /* 
	Board board = (Board)request.getAttribute("board");
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	ArrayList<Comments> clist = (ArrayList<Comments>)request.getAttribute("clist");
	Comments comments = (Comments)request.getAttribute("comments"); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>백신 후기</title>
<script type="text/javascript">
<%-- function moveUpdateView() {
	location.href = "/semi/bupview?bno=<%= board.getBoardNo() %>&page=<%= currentPage %>";
}
function requestDelete(){
	   if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	      location.href = "/semi/bdelete?bno=<%= board.getBoardNo() %>&page=<%= currentPage %>";
	   }else{   //취소
	       return;
	   }
	}
function requestReply(){
	location.href = "/semi/cwrite?bno=<%= board.getBoardNo() %>&page=<%= currentPage %>";
} --%>

</script>

<%@ include file="../common/stylesheet.jsp"%>
<%@ include file="../common/sidebar.jsp"%>
<%@ include file="../common/topbar.jsp"%>
</head>
<body>



	<div class="content-wrap">
		<div class="main">
			<div class="container-fluid">
				<div class="page-header">
					<div class="page-title">
						<h1>
							접종후기 <span> 댓글</span>
						</h1>
					</div>
				</div>
				<div id="main-content">
					<div class="card">

						<%--<table align="center">
							<tr>
								<th>제 목</th>
								<td><%= board.getBoardTitle() %></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td><%= board.getBoardWriter() %></td>
							</tr>
							<tr>
								<th>작성일</th>
								<td><%= board.getBoardDate() %></td>
							</tr>
							<tr>
								<th>내 용</th>
								<td><%= board.getBoardContent() %></td>
							</tr>		
						</table>
						<hr> 
						
						<table align="center">		
							<tr>
								<th colspan="2">
									 댓글달기 버튼은 로그인한 경우에만 보이게 함 --%>
									<%-- <% if(loginMember != null){ 
											if(loginMember.getUserName().equals(board.getBoardWriter())) { //본인글일때%>
											<button onclick="moveUpdateView(); return false;" class="btn btn-primary">수정하기</button> &nbsp; 
											<button onclick="requestDelete(); return false;" class="btn btn-danger">글 삭제</button> &nbsp;
									<% }else if(loginMember.getUserGrade().equals("U")){ %>
											<button onclick="requestDelete(); return false;" class="btn btn-danger">글 삭제</button> &nbsp;	
											<button onclick="requestReply(); return false;" class="btn btn-primary">댓글달기</button> &nbsp;
									<% } else { //로그인했는데 본인글이 아닐때 %>
										
											<button onclick="requestReply(); return false;" class="btn btn-primary">댓글달기</button> &nbsp; 
									<% } %> --%>
									
									<%-- 테스트용 버튼 
											<button onclick="moveUpdateView(); return false;" class="btn btn-primary">수정하기</button> &nbsp; 
											<button onclick="requestDelete(); return false;" class="btn btn-danger">글 삭제</button> &nbsp;
									
								</th>
							</tr>
						</table>
						
						
						
						댓글이 있을 때
						<% if (clist != null){ %>
						<% for(Comments c : clist){ %>
						<hr>
						<table align="center">
							<tr>
								<th>아이디</th>
								<td><%= c.getComWriter() %></td>
							</tr>
							<tr>
								<th>작성일시</th>
								<td><%= c.getComDate() %></td>
							</tr>
							<tr>
								<th>댓글 내용</th>
								<td><%= c.getComContent() %></td>
							</tr>	
						</table>
						
						<% } %>
						--%>
						
						<hr>
						
						<fieldset>
							<legend>댓글달기</legend>
							<label>작성자 : <input type="text" id="writer" size="50"></label><br>
							<label>내 용 : <textarea rows="2" cols="50" id="content"></textarea></label>
						</fieldset>
						<button id="reply" class="btn btn-primary">확인</button>
						<!-- <script type="text/javascript">
						$(function(){
							$('#reply').click(function(){
								//$.post()
								$.post("/cwrite", {writer: $('#writer').val(), content: $('#content').val() });
								
								//$.ajax()
								$.ajax({
									url: "/cwrite",
									type: "post",
									data: {writer: $('#writer').val(), content: $('#content').val() }
								});								
							});	
						});
						</script> -->
						
						<hr>
						<table align="center">		
							<tr>
								<th colspan="2">
									<button onclick="requestReply(); return false;" class="btn btn-primary">확인</button> &nbsp;
									<button onclick="javascript:location.href='/semi/blist?page=1'; return false;" class="btn btn-default">목록</button>
								</th>
							</tr>
						</table>
						<%-- <% } %>  --%>
						

				</div>
				</div>
				<%@ include file="../common/footer.jsp" %>
			</div>
		</div>
	</div>



	<%@ include file="../common/script.jsp"%>
</body>
</html>
