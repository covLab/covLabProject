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
div pre{
	font-family: 'Roboto', sans-serif;
    margin: 0;
    color: #868e96;
    font-size: 13px;
}
.right-button{
	display:inline-block;
 	float:right;
	left-margin: 10px;
}
.cform, .rform{
	background : #e7e7e7;
	margin: 10px;
	border-radius: 3px;
}
.card{
	padding-left:100px !important;
	padding-right:100px !important;
}
div{
	padding: 1px;
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
						<div>
						<div style="font-size: 30px;font-weight:500;"><%= board.getBoardTitle() %></div>
						<div style="display:inline-block">
							<div>
								<span>글쓴이 <%= board.getBoardWriter() %></span><br>
								<span>작성일 <%= board.getBoardDate() %></span> <br>
								<span>조회수 <%= board.getViewCnt() %></span> &nbsp;
								<span>추천수 <%= board.getRecommendCnt() %></span> &nbsp;
								<span>댓글 <%=clist.size() %></span>
							</div>
						</div>
						<div class="right-button">
							<div><% if(loginMember != null){%>
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
								</div>
						</div><hr>
						<div><pre style="font-size: 20px;"><%= board.getBoardContent() %></pre></div>
						<div></div>
						</div>

						<%if (loginMember != null){ %>
						<!-- 댓글달기 폼 -->
						<form action="/semi/cwrite" method="post" id="cform" style="display:none;">				
						<input type="hidden" name="bno" value=	"<%= board.getBoardNo() %>">
						<input type="hidden" name="page" value="<%= currentPage %>">
						<table align="center" class="cform">
						<hr>
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
						<ul>
							<li>
								<div>
									<% if(c.getComLevel() != c.getComNo()){ //댓글의 답글 %>
										<div style="padding-left: 30px;">
									<% }else{ %>
										<div>
									<% } %>
										<div style="float: left;">
												<img src="/semi/resources/images/bookingSystem/2.png"
													style="width: 25px; height: 25px;" />
										</div>
										</div>
										<% if(c.getComLevel() != c.getComNo()){ //댓글의 답글 %>
										<div style="padding-left: 70px;">
										<% }else{ %>
										<div style="padding-left: 40px;">
										<% } %>
										
											<div style="display:inline-block;">

												<div>
													<b><%=c.getComWriter() %></b>
												</div>
												<div>
													<pre><%=c.getComContent() %></pre>
												</div>
												<div><%= c.getComDate() %></div>

											</div>

											<div class="right-button">
												<% if(loginMember == null){ %>
												<a href="#" onclick="moveLogin()">[답변]</a>
												<% }else{ %>
												<a href="#" onclick="showReplyForm(<%= c.getComLevel() %>)">[답변]</a><br>
												<% if(loginMember.getUserId().equals(c.getComWriter())){ //본인글일때 %>
												<a href="#"
													onclick="moveCommentsUpdate(<%= c.getComNo() %>, <%= c.getBoardRef() %>, <%= currentPage %>); return false;">[수정하기]</a><br>
												<a href="#"
													onclick="requestCommentsDelete(<%= c.getComNo() %>, <%= c.getBoardRef() %>, <%= currentPage %>);return false;">[댓글삭제]</a>
												<% }else if(loginMember.getUserGrade().equals("A")){ %>
												<a href="#"
													onclick="requestCommentsDelete(<%=c.getComNo()%>, <%=c.getBoardRef()%>, <%=currentPage%>);return false;">[댓글삭제]</a>
												<% }} %>
											</div>
										</div>
									
								</div>
							</li>
						</ul>
	
						<% if(c.getComLevel() == c.getComNo()){ //원글의 댓글 %>
						
						<% if (loginMember != null){ %>
						<form action="/semi/creplywrite" method="post" id="<%= c.getComLevel() %>" style="display:none;">
						<input type="hidden" name="bno" value="<%= board.getBoardNo() %>">
						<input type="hidden" name="page" value="<%= currentPage %>">
						<input type="hidden" name="cno" value="<%= c.getComNo() %>">
						<table align="center" class="rform">
	
								<tr>
									<th colspan="2">답글달기</th>
								</tr>
								<tr>
									<td>작성자 :</td>
									<td><input type="text" name="writer" readonly value="<%= loginMember.getUserId() %>"></td>
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
