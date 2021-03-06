<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="board.comments.model.vo.Comments"%>
<%
	Comments comments = (Comments)request.getAttribute("comments");
	int currentPage = ((Integer)request.getAttribute("page")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>백신 후기</title>

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
							접종후기 <span> <%= comments.getBoardRef() %>번 글 댓글 수정</span>
						</h1>
					</div>
				</div>
				<div id="main-content">
					<div class="card">

					<form action="/semi/cupdate" method="post">
					<input type="hidden" name="comNo" value="<%= comments.getComNo() %>">
					<input type="hidden" name="page" value="<%= currentPage %>">
					<input type="hidden" name="boardRef" value="<%= comments.getBoardRef() %>">
						<table align="center">
							
							<tr>
								<th>작성자</th>
								<td><input type="text" name="writer" size="50" readonly
									value="<%= comments.getComWriter() %>"></td>
							</tr>
							<tr>
								<th>내 용</th>
								<td><textarea rows="10" cols="51" name="content"><%= comments.getComContent() %></textarea></td>
							</tr>
								<tr align="center">
									<th colspan="2">
										<input type="submit" value="수정하기" class="btn btn-primary"> &nbsp; 
										<input type="reset" value="수정취소" class="btn btn-default"> &nbsp; 
										<input type="button" value="이전페이지로 이동" onclick="javascript:history.go(-1); return false;" class="btn btn-default"> &nbsp; 
										<input type="button"
										value="목록" onclick="javascript:location.href='/semi/blist?page=<%=currentPage%>'; return false;" class="btn btn-default">
									</th>
								</tr>
							</table>

					</form>
					

				</div>
				</div>
				<%@ include file="../common/footer.jsp" %>
			</div>
		</div>
	</div>



	<%@ include file="../common/script.jsp"%>
</body>
</html>
