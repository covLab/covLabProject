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
	<div class="authincation h-100">
		<div class="container-fluid h-100">
			<div class="row justify-content-center h-100 align-items-center">
				<div class="col-md-5">
					<div class="form-input-content text-center">
						<div class="mb-5">
						<%
						if (type == null) {
						%>
						<h5 class="error-text font-weight-bold">시간을 선택해주세요.</h5>
						<%
						} else if (type.equals("cancelError")) {
						%>
						<h5 class="error-text font-weight-bold">예약취소에 실패하였습니다. 다시 시도해주세요.</h5>
						<%
						}else if(type.equals("insertError")) {
						%>
						<h5 class="error-text font-weight-bold">예약에 실패하였습니다. 다시 시도해주세요.</h5>
						<%
						} else if(type.equals("vacChoiceError")) {
						%>
						<h5 class="error-text font-weight-bold">백신을 선택해 주세요. </h5>
						<%	
						}
						%>
						</div>
						<div class="mb-5">
						<button class="btn btn-rounded btn-primary" onclick="moveIndex()">메인페이지로
							이동</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>