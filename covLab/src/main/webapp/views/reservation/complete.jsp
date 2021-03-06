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
}
</script>

</head>
<body>

<div class="authincation h-100">
        <div class="container-fluid h-100">
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-md-5">
                    <div class="form-input-content text-center">
                        <div class="welcome-text">
						<%
						if (type.equals("insertSuccess")) {
						%>
						<h5>예약이 성공적으로 완료되었습니다</h5>
						<%
						} else if (type.equals("cancelSuccess")) {
						%>
						<h5>예약취소가 성공적으로 완료되었습니다</h5>
						<%
						}
						%>
					</div>
					<button class="btn btn-rounded btn-primary mt-5" onclick="moveIndex()">메인페이지로
						이동</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


	
</body>

</html>