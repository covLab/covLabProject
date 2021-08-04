<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String type = request.getAttribute("pageType").toString();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 완료</title>

<%@ include file="../common/script.jsp"%>
<%@ include file="../common/stylesheet.jsp"%>

<script type="text/javascript">
	function moveIndex(){
		self.close();
		opener.document.location = "/semi";
	}
</script>

</head>
<body>
	<div class="container-fluid align-self-center">
	<div class="card">
		<div  class="card-body text-center">
			<div class="welcome-text">
				<% if (type.equals("insertSuccess")){ %>
				<h5>예약이 성공적으로 완료되었습니다</h5>
				<%} else if ( type.equals("cancelSuccess")){%>
				<h5>예약취소가 성공적으로 완료되었습니다</h5>
				<%} %>
		     </div>
			<button class = "btn btn-rounded btn-primary" onclick="moveIndex()">메인페이지로 이동</button>
		</div>
	</div>
	</div>
</body>
</html>