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
<style type="text/css">
tbody tr td pre{
	font-family: 'Roboto', sans-serif;
    margin: 0;
    color: #868e96;
    font-size: 13px;
}
</style>

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

//게시글 수정
function moveUpdateView() {
	location.href = "/semi/bupview?bno=<%= board.getBoardNo() %>&page=<%= currentPage %>";
}

// 게시글 삭제
function requestBoardDelete(){
   if (confirm("게시글을 정말 삭제하시겠습니까??") == true){    //확인
      location.href = "/semi/bdelete?bno=<%= board.getBoardNo() %>&page=<%= currentPage %>";
   }else{   //취소
       return;
   }
}

//댓글---------------------
<%-- //댓글 수정
function moveCommentsUpdateView(){
	location.href = "/semi/cupview?bno=<%= board.getBoardNo() %>&page=<%= currentPage %>&cno=<%= c.getComNo()%>&clevel=<%=c.getComLevel()%>";
} --%>
//댓글 수정
function moveCommentsUpdate(comNo, boardRef, page){
	var param = "comNo="+comNo+"&boardRef="+boardRef+"&page="+page;
	console.log("cNo:"+comNo);
	console.log("boardref:"+boardRef);
	console.log("page:"+page);
	
	location.href = "/semi/cupview?"+param;

	
	/* httpRequest = getXMLHttpRequest();
	httpRequest.onreadystatechange = checkFunc;
	httpRequest.open("POST", "cupview", true);
	httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8');
	httpRequest.send(param);
 */
}

//댓글 삭제
function requestCommentsDelete(comNo, boardRef, page){
	if (confirm("댓글을 정말 삭제하시겠습니까??") == true){
		console.log("cNo : "+comNo);
		console.log("boardRef : "+boardRef);
		console.log("page: "+page);
		
		deleteComments(comNo, boardRef, page);
	}else{
		return;
	}
}
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

//답글
function showReplyForm(comlevel){
	console.log("comlevel : "+comlevel);
	var con = document.getElementById(comlevel);
	if(con.style.display=='none'){
		con.style.display = 'block';
	}else{
		con.style.display = 'none';
	}
}
//댓글
function showCommentForm(){
	var con = document.getElementById("cform");
	if(con.style.display=='none'){
		con.style.display = 'block';
	}else{
		con.style.display = 'none';
	}
}
//
function recommend(){
	location.href = "/semi/brecommend?bno=<%= board.getBoardNo() %>&page=<%= currentPage %>";
	//location.reload();
}
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
							접종후기 <span> <%= board.getBoardNo() %>번 글 보기</span><br>
							
						</h1>
					</div>
				</div>
				<div id="main-content">
					<div class="card">
						<%-- <div>
						<div><%= board.getBoardTitle() %></div>
						<div>
							<div><%= board.getBoardWriter() %></div>
							<div>
								<span><%= board.getBoardDate() %></span>
								<span><%= board.getViewCnt() %></span>
								<span><%= board.getRecommendCnt() %></span>
							</div>
						</div><hr>
						<div><%= board.getBoardContent() %></div>
						
						</div> --%>
						<table align="center">
						
							<tr><td width="50px" rowspan="4" valign="top"></td>
								<th width="100">제 목</th>
								<td width="200"><%= board.getBoardTitle() %></td>
								<td rowspan="4" width="100" align="right">
								<% if(loginMember != null){%>
									<a href=# onclick="showCommentForm();">[댓글달기]</a><br>
									<a href=# onclick="recommend();">[추천하기]</a><br>

									<% if(loginMember.getUserName().equals(board.getBoardWriter())){ //본인글일때 %>
										<a href=# onclick="moveUpdateView(); return false;">[수정하기]</a><br>
										<a href=# onclick="requestBoardDelete(); return false;">[글 삭제]</a>
									<%} else if(loginMember.getUserGrade().equals("A")){ //관리자 %>
										<a href=# onclick="requestBoardDelete(); return false;">[글 삭제]</a><br>
									<%} else { //로그인했는데 본인 글이 아닐 때 %>
								<% }}else{// 로그인 안했을 때 %>
									<a href=# onclick="moveLogin(); return false;">[댓글달기]</a><br>
								<% } %>	
								</td>
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
						<%if (loginMember != null){ %>
						<!-- 댓글달기 폼 -->
						<form action="/semi/cwrite" method="post" class="cform" id="cform" style="display:none;">				
						<input type="hidden" name="bno" value="<%= board.getBoardNo() %>">
						<input type="hidden" name="page" value="<%= currentPage %>">
						<hr>
						<table align="center">
						
								<tr>
									<th colspan="2">댓글달기</th>
								</tr>
								<tr>
									<td>작성자 :</td>
									<td align="left"><input type="text" name="writer" readonly value="<%= loginMember.getUserId() %>"></td>
									<td></td>
								</tr>
								<tr>
									<td>내 용 : </td>
									<td><textarea rows="5" cols="50" name="content" placeholder="내용을 입력하세요" wrap="hard"></textarea></td>
								</tr>
								<tr align="center">
								<th colspan="2">
								<input type="submit" value="댓글달기" class="btn btn-primary"> &nbsp; 
								<input type="reset" value="작성취소" class="btn btn-default"> &nbsp; 
								</th>
							</tr>
						</table>
						</form>	
						<%} %>
						
						<%-- 댓글이 있을 때 --%>
						<% if (clist != null){ %>
						<% for(Comments c : clist){ %>
						
						<% if(c.getComLevel() == c.getComNo()){ %>
							<hr>		
						<% }else{ %><br><% } %>
						<table align="center">

							<tr>
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
										 		<a href="#" onclick="showReplyForm(<%= c.getComLevel() %>)">[답변]</a><br>
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
							</tr>
							<tr>
								<th>작성일시</th>
								<td align="center"><%= c.getComDate() %></td>
							</tr>
							<tr>
								<th>댓글 내용</th>
								<td align="center"><pre><%= c.getComContent() %></pre></td>
							</tr>	
						</table>
						
						
						
						
						<% if(c.getComLevel() == c.getComNo()){ //원글의 댓글 %>
						
						
						<% if (loginMember != null){ %>
						<form action="/semi/creplywrite" method="post" class="rform" id="<%= c.getComLevel() %>" style="display:none;">
						<input type="hidden" name="bno" value="<%= board.getBoardNo() %>">
						<input type="hidden" name="page" value="<%= currentPage %>">
						<input type="hidden" name="cno" value="<%= c.getComNo() %>">
						<table align="center">
	
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
								</th>
							</tr>
								
						</table>
						</form> 
						<% }//답글달기 폼 %>
						
						<% }//원글의 댓글 %>
						
						<% }//for문 %>
						
						<% } %>
						<hr>
						<div align="right">
						<input type="button" value="목록" class="btn btn-default"
									onclick="javascript:location.href='/semi/blist?page=<%= currentPage %>'; return false;">
						</div>		

				</div>
				</div>
				<%@ include file="../common/footer.jsp" %>
			</div>
		</div>
	</div>



	<%@ include file="../common/script.jsp"%>
</body>
</html>
