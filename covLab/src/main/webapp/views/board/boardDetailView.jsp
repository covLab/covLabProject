<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.model.vo.Board, java.util.ArrayList, board.comments.model.vo.Comments, java.sql.Date" %>
<% 
	Board board = (Board)request.getAttribute("board");
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	ArrayList<Comments> clist = (ArrayList<Comments>)request.getAttribute("clist");
	Comments comments = (Comments)request.getAttribute("comments");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>백신 후기</title>
<script type="text/javascript">
function moveUpdateView() {
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
	location.href = "/semi/views/board/commentsWriteForm.jsp?bno=<%= board.getBoardNo() %>&page=<%= currentPage %>"
}
<<<<<<< HEAD
=======
function deleteComments(comNo, boardRef, page){
	var param = "comNo="+comNo+"&boardRef="+boardRef+"&page="+page;
	console.log("cNo:"+comNo);
	console.log("boardref:"+boardRef);
	console.log("page:"+page);
	
	httpRequest = getXMLHttpRequest();
	httpRequest.onreadystatechange = checkFunc;
	httpRequest.open("POST", "cdelete", true);
	httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8');
	httpRequest.send(param);
	console.log("end");
	location.reload();
}
//로그인 안했을 시 로그인으로 이동
function moveLogin(){
	console.log("moveLogin");
	if(confirm("로그인후 이용 가능합니다. \n확인을 누르면 로그인 페이지로 이동합니다.") == true){
		location.href="/semi/views/member/login.jsp";
	}else{
		return;
	}
}

/* //답글 폼 보이기
$(document).ready(function(){
	//기본값 설정
	$("#reply").hide();
	
/* 	//버튼 클릭시 보이기 및 숨기기
	$("a.showReplyForm").click(function(){
		$("#reply").show();
		$(this).hide();
	}); 
}); */
>>>>>>> 0be9b48c194e881069ede8d8b7f9d10197c2d038

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
							접종후기 <span> <%= board.getBoardNo() %>번 글 보기</span>
						</h1>
					</div>
				</div>
				<div id="main-content">
					<div class="card">

						<table align="center">
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
								<td><pre><%= board.getBoardContent() %></pre></td>
							</tr>		
						</table>
						
						
						<table align="center">		
							<tr>
								<th colspan="2">
									<%-- 댓글달기 버튼은 로그인한 경우에만 보이게 함 --%>
									<% if(loginMember != null){ 
											if(loginMember.getUserName().equals(board.getBoardWriter())) { //본인글일때%>
											<button onclick="moveUpdateView(); return false;" class="btn btn-primary">수정하기</button> &nbsp; 
<<<<<<< HEAD
											<button onclick="requestDelete(); return false;" class="btn btn-danger">글 삭제</button> &nbsp;
									<% }else if(loginMember.getUserGrade().equals("U")){ %>
											<button onclick="requestDelete(); return false;" class="btn btn-danger">글 삭제</button> &nbsp;	
											<button onclick="requestReply(); return false;" class="btn btn-primary">댓글달기</button> &nbsp;
									<% } else { //로그인했는데 본인글이 아닐때 %>
										
											<button onclick="requestReply(); return false;" class="btn btn-primary">댓글달기</button> &nbsp; 
									<% } %> --%>
									
									<%-- 테스트용 버튼 --%>
											<button onclick="moveUpdateView(); return false;" class="btn btn-primary">수정하기</button> &nbsp; 
											<button onclick="requestDelete(); return false;" class="btn btn-danger">글 삭제</button> &nbsp;
									
=======
											<button onclick="requestBoardDelete(); return false;" class="btn btn-danger">글 삭제</button> &nbsp;
										<% } else if(loginMember.getUserGrade().equals("A")){ //관리자%>
												<button onclick="requestBoardDelete(); return false;" class="btn btn-danger">글 삭제</button> &nbsp;	
												<button onclick="requestReply(); return false;" class="btn btn-primary">댓글달기</button> &nbsp;
										<% } else { //로그인했는데 본인글이 아닐때 %>
												<!-- <button onclick="requestReply(); return false;" class="btn btn-primary">댓글달기</button> &nbsp; --> 
										<% } %>
									<% } %>
									<%-- 테스트용 버튼
											<button onclick="moveUpdateView(); return false;" class="btn btn-primary">수정하기</button> &nbsp; 
											<button onclick="requestBoardDelete(); return false;" class="btn btn-danger">글 삭제</button> &nbsp;
									 --%>
>>>>>>> 0be9b48c194e881069ede8d8b7f9d10197c2d038
								</th>
							</tr>
						</table>
						
						
						
						<%-- 댓글이 있을 때 --%>
						<% if (clist != null){ %>
						<% for(Comments c : clist){ %>
<<<<<<< HEAD
						<hr>
=======
						
						<% if(c.getComLevel() == c.getComNo()){ %>
							<hr>		
						<% } else { %><% } %>
>>>>>>> 0be9b48c194e881069ede8d8b7f9d10197c2d038
						<table align="center">
							<tr>
<<<<<<< HEAD
								<th>아이디</th>
								<td><%= c.getComWriter() %></td>
=======
								<td width="50px" rowspan="3" valign="top">
								<% if(c.getComLevel() != c.getComNo()){ //댓글의 답글 %>
									&nbsp; &nbsp; └ &nbsp; &nbsp;
								<% }else{ %>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								<% } %>
								</td>
								<th width="100">아이디</th>
								<td width="200" align="center"><%= c.getComWriter() %></td>
								<td rowspan="3" width="100" align="right">
									<%-- <% if(c.getComLevel() == c.getComNo()){ // 답글이면 안보이게%> --%>
									
										 <% if(loginMember == null){ %>
										 	<a href="#" onclick="moveLogin()">[답변]</a>
										 <% }else{ %>
										 		<a href="#" onclick="showReplyForm()">[답변]</a><br>
										 	<% if(loginMember.getUserId().equals(c.getComWriter())){ //본인글일때 %>
												<a href="#" onclick="moveCommentsUpdate(<%= c.getComNo() %>, <%= c.getBoardRef() %>, <%= currentPage %>); return false;">[수정하기]</a><br>
												<a href="#" onclick="requestCommentsDelete(<%= c.getComNo() %>, <%= c.getBoardRef() %>, <%= currentPage %>);return false;">[댓글삭제]</a>
											<% }else if(loginMember.getUserGrade().equals("A")){ %>
												<a href="#" onclick="requestCommentsDelete(<%= c.getComNo() %>, <%= c.getBoardRef() %>, <%= currentPage %>);return false;">[댓글삭제]</a>
											<% } %>
										 <% } %>
									<%-- <% } %> --%>
									<!-- 작성자와 로그인한 사람이 같을 경우 -->
									<br>
									
								</td>
>>>>>>> 0be9b48c194e881069ede8d8b7f9d10197c2d038
							</tr>
							<tr>
								<th>작성일시</th>
								<td align="center"><%= c.getComDate() %></td>
							</tr>
							<tr>
								<th>댓글 내용</th>
<<<<<<< HEAD
								<td><%= c.getComContent() %></td>
							</tr>	
						</table>
						
						<% } %>
						<hr>
=======
								<td align="center"><pre><%= c.getComContent() %></pre></td>
							</tr>	
						</table>
						
						
						
						
						<% if(c.getComLevel() == c.getComNo()){ //원글의 댓글 %>
						<br>
						<%-- <div align="center" id="reply" style="display:none;">
						<div>
							<input type="text" name="writer" size="50"><br>
							<textarea rows="3" cols="50" name="content" placeholder="댓글 내용을 입력하세요"></textarea>
						</div>
						<div>
							<input type="submit" value="댓글달기" class="btn btn-primary"> &nbsp; 
							<input type="reset" value="작성취소" class="btn btn-default"> &nbsp; 
							<input type="button" value="목록" class="btn btn-default"
									onclick="javascript:location.href='/semi/blist?page=<%= currentPage %>'; return false;">
						</div>
						</div> --%>
						<!-- 답글달기 폼 -->
						
						<% if (loginMember != null){ %>
						<form action="/semi/creplywrite" method="post">
						<input type="hidden" name="bno" value="<%= board.getBoardNo() %>">
						<input type="hidden" name="page" value="<%= currentPage %>">
						<input type="hidden" name="cno" value="<%= c.getComNo() %>">
						<table align="center" id="reply">
	
								<tr>
									<th colspan="2">답글달기</th>
								</tr>
								<tr>
									<td>작성자 :</td>
									<td><input type="text" name="writer" size="50" readonly value="<%= loginMember.getUserId() %>"></td>
								</tr>
								<tr>
									<td>내 용 : </td>
									<td><textarea rows="5" cols="50" name="content" placeholder="답글 내용을 입력하세요" wrap="hard"></textarea></td>
								</tr>
								
								<tr align="center">
								<th colspan="2">
								<input type="submit" value="답글달기" class="btn btn-primary"> &nbsp; 
								<input type="reset" value="작성취소" class="btn btn-default"> &nbsp; 
								<input type="button" value="목록" class="btn btn-default"
									onclick="javascript:location.href='/semi/blist?page=<%= currentPage %>'; return false;">
								</th>
							</tr>
								
						</table>
						</form> 
						<% }//답글달기 폼 %>
						
						<% }//원글의 댓글 %>
						
						
						<% }//for문 %>
						
						
						<hr>
						<% if(loginMember == null){ %>
								<div align="center">
								<button onclick="moveLogin(); return false;" class="btn btn-primary">댓글달기</button>
									<input type="button" value="목록" class="btn btn-default"
									onclick="javascript:location.href='/semi/blist?page=<%= currentPage %>'; return false;"></div>
						<% }else{ %>
						<!-- 댓글달기 폼 -->
>>>>>>> 0be9b48c194e881069ede8d8b7f9d10197c2d038
						<form action="/semi/cwrite" method="post">
						<table align="center">
	
								<tr>
									<th colspan="2">댓글달기</th>
								</tr>
								<tr>
									<td>작성자 :</td>
<<<<<<< HEAD
									<td><input type="text" id="writer" size="50"></td>
								</tr>
								<tr>
									<td>내 용 : </td>
									<td><textarea rows="5" cols="50" id="content"></textarea></td>
=======
									<td align="left"><input type="text" name="writer" readonly value="<%= loginMember.getUserId() %>"></td>
									<td></td>
								</tr>
								<tr>
									<td>내 용 : </td>
									<td><textarea rows="5" cols="50" name="content" placeholder="내용을 입력하세요" wrap="hard"></textarea></td>
>>>>>>> 0be9b48c194e881069ede8d8b7f9d10197c2d038
								</tr>
								
								<tr align="center">
								<th colspan="2">
								
								<input type="submit" value="댓글달기" class="btn btn-primary"> &nbsp; 
								
								<input type="reset" value="작성취소" class="btn btn-default"> &nbsp; 
								<input type="button" value="목록" class="btn btn-default"
									onclick="javascript:location.href='/semi/blist?page=<%= currentPage %>'; return false;">
								</th>
							</tr>
								
						</table>
						</form>	
						<% } %>
												
						<% } %>
						

				</div>
				</div>
				<%@ include file="../common/footer.jsp" %>
			</div>
		</div>
	</div>



	<%@ include file="../common/script.jsp"%>
</body>
</html>
