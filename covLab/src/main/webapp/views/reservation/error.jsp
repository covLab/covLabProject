<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%
	String type = (String)request.getAttribute("pageType");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
<%@ include file="../common/script.jsp"%>
<%@ include file="../common/stylesheet.jsp"%>
<style type="text/css">
html,body {
  height: 100%;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	opener.location.reload();
})

function moveIndex(){
	self.close();
	opener.document.location = "/semi/detailhp";
}
</script>

</head>
<body>
	<div class="container-fluid align-self-center h-100">
		<div class="row d-flex align-items-center h-100">
			<div class="card h-100">
				<div class="card-body text-center ">
					<div class="welcome-text">
						<%
						if (type == null) {
						%>
						<h5>시간을 선택해주세요.</h5>
						<%
						} else if (type.equals("cancelError")) {
						%>
						<h5>예약취소에 실패하였습니다. 다시 시도해주세요.</h5>
						<%
						}else if(type.equals("insertError")) {
						%>
						<h5>예약에 실패하였습니다. 다시 시도해주세요.</h5>
						<%
						} else if(type.equals("vacChoiceError")) {
						%>
						<h5>백신을 선택해 주세요. </h5>
						<%	
						}
						%>
					</div>
					<button class="btn btn-rounded btn-primary" onclick="moveIndex()">메인페이지로
						이동</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>