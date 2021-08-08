<%@page import="reservation.model.vo.Reservation"%>
<%@page import="reservation.model.vo.Vaccine"%>
<%@page import="reservation.model.vo.Members"%>
<%@page import="reservation.model.vo.Hospital"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Hospital hp = (Hospital) request.getAttribute("hp");
Members mb = (Members) request.getAttribute("mb");
Vaccine vac = (Vaccine) request.getAttribute("vac");
Reservation res = (Reservation) request.getAttribute("res");

%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 취소</title>
<%@ include file="../common/script.jsp"%>
<%@ include file="../common/stylesheet.jsp"%>
<style type="text/css">


.inputBox {
	border: none;
}

input:focus {
	outline: none;
}
</style>
<script type="text/javascript">

$(function(){
	
var ioc = $('#ioc').val();
var ioc2 = ioc.substr(0,16);
document.info.ioc.value = ioc2;
});


function cancel(){
	
	var url="/semi/cancelres";
	var fnm = document.info;
	
    fnm.method = "post";
	fnm.action = url;
    
    fnm.submit();
 	
}
</script>
</head>
<body>
	<div class="row">

		<div class="col-lg-3 p-0 ">
			<div class="card h-100 m-0">
				<div class="card_header"></div>
				<div class="card-body container-fluid">
					<h5 class="card-title text-center">접종 정보</h5>

					<form action="/semi/cancelres" method="post" name="info">
						<div class="form-inline form-group rounded mt-3">
							<div class="col-3">
								<label class="control-label mb-0" for="user_name">이름</label>
							</div>
							<div class= "col-9">
								<input type="text"
									name="user_name" value="<%=mb.getUserName()%>" readonly
									class="form-control input-rounded inputBox ">
							</div>
						</div>
						
						<div class="form-inline form-group rounded mt-3">
							<div class="col-3">
								<label class="control-label mb-0" for="hp_phone">주민번호</label>
							</div>
							<div class= "col-9">
								<input type="text"
									name="user_rn" value="<%=mb.getUserRn()%>" readonly
									class="form-control input-rounded inputBox" id="rn">
							</div>
						</div>
						<div class="form-inline form-group rounded mt-3">
						
							<div class="col-3">
								<label class="control-label mb-0" for="user_address">주소</label>
							</div>
							<div class= "col-9">
								<textarea 
								name="user_address" readonly
								class="form-control input-rounded inputBox" style="height:60px; overflow: hidden; resize: none;"><%=mb.getUserAddress()%>
								</textarea>
							</div>
						</div>
						<div class="form-inline form-group rounded mt-3">
							<div class="col-3">
								<label class="control-label mb-0" for="user_phone">전화번호</label>
							</div>
							<div class= "col-9">
							<input type="text"
								name="user_phone" value="<%=mb.getUserPhone()%>" readonly
								class="form-control input-rounded inputBox">
							</div>
						</div>
						<div class="form-inline form-group rounded mt-3">
							<div class="col-3">
								<label class="control-label mb-0" for="">기관명</label> 
							</div>
							<div class= "col-9">
							<input type="text" name="hp_name"
								value="<%=hp.getHp_name()%>" readonly class="form-control input-rounded inputBox">
							</div>
						</div>
						<div class="form-inline form-group rounded mt-3">
							<div class="col-3">
								<label  class="control-label mb-0">백신</label> 
							</div>
							<div class= "col-9">
							<input type="text" name="vac_name"
								value="<%=vac.getVac_name()%>" readonly class="form-control input-rounded inputBox">
							</div>
						</div>
						<div class="form-inline form-group rounded mt-3">
							<div class="col-3">
								<label  class="control-label mb-0">예약 날짜</label> 
							</div>
							<div class= "col-9">
							<input type="text" name="ioc_date" 
								value="<%= res.getIoc_date() %>" readonly class="form-control input-rounded inputBox" id="ioc">
							</div>
						</div>
						<input type="hidden" name="rev_date" value= "<%= res.getRev_date() %>" class="inputBox" id="rev_date">
						<input type="hidden" name="serial_num" value=<%= vac.getSerial_num() %> class="inputBox" id="serial">
						<input type="hidden" name="reg_bus_no" value=<%= hp.getReg_bus_no() %> class="inputBox" id="reg">
						<!-- 						<div class="form-group">
							<label for="">예약일시 : </label> <input type="text" name="rev_date"
								value="2021-06-29 09:30:00" readonly id="inputBox"> <br>
							<a href="javascript:void(0)" target="_blank"
								onclick="reservationDatePopup()">날짜 선택</a>
						</div> -->
						<div class="text-center">
						<input class = "btn btn-rounded btn-primary"type="button" onclick ="cancel()" value="예약취소">
						</div>

					</form>

				</div>
			</div>
		</div>
	</div>
</body>
</html>