<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							접종후기 <span> 글쓰기</span>
						</h1>
					</div>
				</div>
				<div id="main-content">
					<div class="card">

					<form action="/semi/binsert" method="post">
						<table align="center">
							<tr>
								<th>제 목</th>
								<td><input type="text" name="title" size="50"></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td><input type="text" name="writer" size="50"<%-- readonly
									value="<%=loginMember.getUserId()%>" --%>></td>
							</tr>
							<tr>
								<th>내 용</th>
								<td><textarea rows="10" cols="51" name="content"></textarea></td>
							</tr>
							<tr align="center">
								<th colspan="2">
								<input type="submit" value="등록하기" class="btn btn-primary"> &nbsp; 
								<input type="reset" value="작성취소" class="btn btn-default"> &nbsp; 
								<input type="button" value="목록" class="btn btn-default"
									onclick="javascript:location.href='/semi/blist?page=1'; return false;">
								</th>
							</tr>
						</table>

					</form>
					

				</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="footer">
							<p>
								2018 © Admin Board. - <a href="#">example.com</a>
							</p>
						</div>
					</div>
					<!-- </div> -->
				</div>
			</div>
		</div>
	</div>



	<%@ include file="../common/script.jsp"%>
</body>
</html>