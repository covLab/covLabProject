<%@page import="reservation.model.vo.Vaccine"%>
<%@page import="reservation.model.vo.Members"%>
<%@page import="reservation.model.vo.Hospital"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Hospital hp = (Hospital) request.getAttribute("hp");
Members mb = (Members) request.getAttribute("mb");

%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대리 예약 정보 입력</title>

<script type="text/javascript" src="/semi/resources/js/jquery-3.6.0.min.js"></script>
<style type="text/css">
.inputBox {
	border: none;
}

input:focus {
	outline: none;
}
</style>
<%@ include file="../common/script.jsp"%>
<%@ include file="../common/stylesheet.jsp"%>

<script type="text/javascript">
	function insertSub(){
		
		// var param = document.info[0].value;  입력창 첫번째꺼나옴
		var fnm = document.info;
		var url = "/semi/tpop";
		fnm.action = url;
	 	fnm.submit(); 
	}
</script>
</head>
<body>
	<div class="row">

		<div class="col-lg-3 p-0 ">
			<div class="card h-100 m-0">
				<div class="card-header">
					<h5 class="card-title text-center">접종자 정보 입력</h5>
				</div>
				<div class="card-body container-fluid">

					<form action="" method="post" name="info" id= "info">
					
						<div class="form-group">
							<label class="col-sm-2 col-form-label" for="sub_user_name">이름</label> <input type="text"
								name="sub_user_name" class="form-control inputBox">
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-form-label" for="sub_user_rn">주민번호</label><input type="text"
								name="sub_user_rn"  id="sub_user_rn" class="form-control inputBox">
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-form-label" for="sub_user_address">주소</label><input type="text"
								name="sub_user_address" class="form-control inputBox">
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-form-label" for="sub_user_phone">전화번호</label><input type="text"
								name="sub_user_phone" class="form-control inputBox">
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-form-label" for="ioc_date">예약 날짜</label><input type="text"
								name="ioc_date" value="<%= request.getAttribute("ioc_date")%>" class="form-control inputBox" id="ioc" readonly>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-form-label" for="vac_name">선택 백신</label><input type="text"
								name="vac_name" value="<%= request.getAttribute("vac_name")%>" class="form-control inputBox" id="vac_name" readonly>
						</div>
						<div class="text-center"> 
						<input class= "btn btn-rounded btn-primary" type="button" onclick="insertSub()" value="예약하기">
						</div>
						<input type="hidden" name="reg_bus_no" value=<%=hp.getReg_bus_no()%> class="inputBox" id="reg"><br>
						<input type="hidden" name="user_no" value=<%=mb.getUserNo()%> class="inputBox" id="no"> <br>
						<input type="hidden" name="resType" value=<%=request.getAttribute("resType")%> class="inputBox" id="resType"> <br>

					</form>

				</div>
			</div>
		</div>
	</div>
</body>
</html>