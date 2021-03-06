<%@page import="reservation.model.vo.Vaccine"%>
<%@page import="reservation.model.vo.Members"%>
<%@page import="reservation.model.vo.Hospital"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Hospital hp = (Hospital) request.getAttribute("hp");
Members mb = (Members) request.getAttribute("mb");
Vaccine vac = (Vaccine) request.getAttribute("vac");

%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#areaBox {
	overflow: hidden;
	resize: none;
	border: none;
	outline: none;
}
.inputBox {
	border: none;
	outline: none;
	resize: none;
}

input:focus {
	outline: none;
}
</style>

<%@ include file="../common/script.jsp"%>
<%@ include file="../common/stylesheet.jsp"%>

<script type="text/javascript">
	function agree(){
		
	 	if (document.getElementById("agreeCheck").checked != true){
	 		alert("약관에 동의하십시오.");
		}else{
			var url="/semi/insertres";
			var fnm = document.info;
/* 			var serial_num = fnm.serial_num.value;
			var user_rn =fnm.user_rn.value;
			var reg_bus_no = fnm.reg_bus_no.value;
			var ioc_date = fnm.ioc.value */
			
	        fnm.method = "post";
	        fnm.action = url;
	        
	        fnm.submit();
		}
	 	
	}
</script>


</head>
<body>
	<div class="row">

		<div class="col-lg-3 p-0 ">
			<div class="card h-100 m-0">
				<div class="card-header">
					<h5 class="card-title text-center">접종 정보</h5>
				</div>
				<div class="card-body container-fluid">

					<form action="/semi/insertres" method="post" name="info">
					
					
						<div class="form-inline form-group rounded mt-3">
							<div class="col-3">
								<label class="control-label mb-0" for="user_name">이름</label>
							</div>
							<div class= "col-9">
								<input type="text"
								name="user_name" value="<%=mb.getUserName()%>" readonly
								class="form-control input-rounded inputBox">
								
							</div>
						</div>
						<div class="form-inline form-group rounded mt-3">
							<div class="col-3">
								<label class="control-label mb-0" for="user_rn">주민번호</label>
							</div>
							<div class= "col-9">
								<input type="text"
									name="user_rn"
									class="form-control input-rounded inputBox"value="<%=mb.getUserRn()%>" id="user_rn" readonly>
								
							</div>
						</div>
						
						<div class="form-inline form-group rounded mt-3">
						
							<div class="col-3">
								<label class="control-label mb-0" for="user_address">주소</label>
							</div>
							<div class= "col-9">
								<textarea 
								name="user_address" readonly style="height: 60px; resize:none;overflow: hidden "
								class="form-control input-rounded inputBox"><%=mb.getUserAddress()%></textarea>
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
								<label class="control-label mb-0" for="hp_name">기관명</label>
							</div>
							<div class= "col-9">
							<input type="text"
								name="hp_name" value="<%=hp.getHp_name()%>" readonly
								class="form-control input-rounded inputBox">
							</div>
						</div>
						
						<div class="form-inline form-group rounded mt-3">
							<div class="col-3">
								<label class="control-label mb-0" for="vac_name">백신</label>
							</div>
							<div class= "col-9">
							<input type="text"
								name="vac_name" value="<%=vac.getVac_name()%>" readonly
								class="form-control input-rounded inputBox">
							</div>
						</div>
						
						<div class="form-inline form-group rounded mt-3">
							<div class="col-3">
								<label class="control-label mb-0" for="ioc_date">예약 날짜</label>
							</div>
							<div class= "col-9">
							<input type="text"
								name="ioc_date" value="<%= request.getAttribute("ioc_date") %>" readonly
								class="form-control input-rounded inputBox">
							</div>
						</div>
						
						<input type="hidden" name="serial_num" value=<%= vac.getSerial_num() %> class="inputBox" >
						<input type="hidden" name="reg_bus_no" value=<%= hp.getReg_bus_no() %> class="inputBox" >
						<input type="hidden" name="resType" value=<%= request.getAttribute("resType") %> class="inputBox">
						<!-- 						<div class="form-group">
							<label for="">예약일시 : </label> <input type="text" name="rev_date"
								value="2021-06-29 09:30:00" readonly id="inputBox"> <br>
							<a href="javascript:void(0)" target="_blank"
								onclick="reservationDatePopup()">날짜 선택</a>
						</div> -->

						<textarea class="form-control h-25" rows="10">
제1조(목적) 이 법은 사업자가 그 거래상의 지위를 남용하여 불공정한 내용의 약관(約款)을 작성하여 거래에 사용하는 것을 방지하고 불공정한 내용의 약관을 규제함으로써 건전한 거래질서를 확립하고, 이를 통하여 소비자를 보호하고 국민생활을 균형 있게 향상시키는 것을 목적으로 한다.
제2조(정의) 이 법에서 사용하는 용어의 정의는 다음과 같다.

1. “약관”이란 그 명칭이나 형태 또는 범위에 상관없이 계약의 한쪽 당사자가 여러 명의 상대방과 계약을 체결하기 위하여 일정한 형식으로 미리 마련한 계약의 내용을 말한다.

2. “사업자”란 계약의 한쪽 당사자로서 상대 당사자에게 약관을 계약의 내용으로 할 것을 제안하는 자를 말한다.

3. “고객”이란 계약의 한쪽 당사자로서 사업자로부터 약관을 계약의 내용으로 할 것을 제안받은 자를 말한다.
						</textarea>
						<div class="text-center mt-3">
							<input type="checkbox" id="agreeCheck" ><label class="form-check-label" for="agreeCheck">약관에 동의합니다</label>
							<br>
						</div>
						<div class="text-center m-4">
						<input class="btn btn-rounded btn-primary" type="button" onclick="agree()" value="예약확인">
						</div>

					</form>

				</div>
			</div>
		</div>
	</div>
</body>
</html>