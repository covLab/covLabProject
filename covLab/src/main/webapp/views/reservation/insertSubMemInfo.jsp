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
		var user_name = fnm.user_name.value;
		var user_rn = fnm.user_rn.value;
		var user_address = fnm.user_address.value;
		var user_phone = fnm.user_phone.value;
		
		
		/*if( !user_name || !user_rn || user_address || user_phone ){
			alert("빈 값을 모두 채워 주세요.");
			return false;
		} */
		if( !user_name ){
	          // is-invalid 클래스를 붙여줘서 빨간 경고문구 붙여준다
	          $("#user_name").addClass("is-invalid");
	          // 입력해야되는 창에 어그로
	          $("#user_name").focus();
	          return false;
		}
		
		if( !user_rn ){
	          // is-invalid 클래스를 붙여줘서 빨간 경고문구 붙여준다
	          $("#user_rn").addClass("is-invalid");
	          // 입력해야되는 창에 어그로
	          $("#user_rn").focus();
	          return false;
		}
		if( !user_address ){
	          // is-invalid 클래스를 붙여줘서 빨간 경고문구 붙여준다
	          $("#user_address").addClass("is-invalid");
	          // 입력해야되는 창에 어그로
	          $("#user_address").focus();
	          return false;
		}
		if( !user_phone ){
	          // is-invalid 클래스를 붙여줘서 빨간 경고문구 붙여준다
	          $("#user_phone").addClass("is-invalid");
	          // 입력해야되는 창에 어그로
	          $("#user_phone").focus();
	          return false;
		}
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
					
						<div class="form-inline form-group rounded mt-3">
							<div class="col-3">
								<label class="control-label mb-0" for="user_name">이름</label>
							</div>
							<div class= "col-9">
								<input type="text"
									name="sub_user_name"  
									class="form-control input-rounded inputBox" id="user_name">
								<div class="invalid-feedback">
								이름을 입력해주세요.
								</div>
							</div>
						</div>
						
						<div class="form-inline form-group rounded mt-3">
							<div class="col-3">
								<label class="control-label mb-0" for="hp_phone">주민번호</label>
							</div>
							<div class= "col-9">
								<input type="text"
									name="sub_user_rn"
									class="form-control input-rounded inputBox" id="user_rn">
								<div class="invalid-feedback">
								주민번호를 입력해주세요.
								</div>
							</div>
						</div>
						<div class="form-inline form-group rounded mt-3">
						
							<div class="col-3">
								<label class="control-label mb-0" for="user_address">주소</label>
							</div>
							<div class= "col-9">
								<input type="text" style="resize: none;"
								name="sub_user_address" 
								class="form-control input-rounded inputBox" style="height:60px; overflow: hidden;" id="user_address">
								<div class="invalid-feedback">
								주소를 입력해주세요.
								</div>
							</div>
						</div>
						<div class="form-inline form-group rounded mt-3">
							<div class="col-3">
								<label class="control-label mb-0" for="user_phone">전화번호</label>
							</div>
							<div class= "col-9">
							<input type="text"
								name="sub_user_phone" 
								class="form-control input-rounded inputBox" id="user_phone">
								<div class="invalid-feedback">
								핸드폰 번호를 입력해주세요.
								</div>
							</div>
						</div>
						
						<div class="form-inline form-group rounded mt-3">
							<div class="col-3">
								<label class="control-label mb-0" for="ioc_date">예약 날짜</label>
							</div>
							<div class= "col-9">
							<input type="text"
								name="ioc_date" value="<%= request.getAttribute("ioc_date")%>" class="form-control input-rounded inputBox" id="ioc" readonly>
							</div>
						</div>
						
						<div class="form-inline form-group rounded mt-3">
							<div class="col-3">
								<label class="control-label mb-0" for="vac_name">선택 백신</label>
							</div>
							<div class= "col-9">
							<input type="text"
								name="vac_name" value="<%= request.getAttribute("vac_name")%>" class="form-control input-rounded inputBox" id="vac_name" readonly>
							</div>
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