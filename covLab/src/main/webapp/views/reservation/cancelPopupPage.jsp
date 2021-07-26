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
.inputBox {
	border: none;
}

input:focus {
	outline: none;
}
</style>
<script type="text/javascript">
function cancel(serial, rn, reg, rev){
	
	var url="/semi/cancelres";
	var fnm = document.info;
	
	var serial_num = fnm.serial_num.value;
	var user_rn =fnm.user_rn.value;
	var reg_bus_no = fnm.reg_bus_no.value;
	var rev_date = fnm.rev_date.value
	
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
				<div class="card-body">
					<h5 class="card-title text-center">접종 정보</h5>

					<form action="/semi/cancelres" method="post" name="info">
						<div class="form-group">
							<label for="user_name">이름 : </label> <input type="text"
								name="user_name" value="<%=mb.getUserName()%>" readonly
								class="inputBox">
						</div>
						<div class="form-group">
							<label for="hp_phone">주민번호 : </label><input type="text"
								name="user_rn" value="<%=mb.getUserRn()%>" readonly
								class="inputBox" id="rn">
						</div>
						<div class="form-group">
							<label for="user_address">주소 : </label><input type="text"
								name="user_address" value="<%=mb.getUserAddress()%>" readonly
								class="inputBox">
						</div>
						<div class="form-group">
							<label for="">기관명 : </label> <input type="text" name="hp_name"
								value="<%=hp.getHp_name()%>" readonly class="inputBox">
						</div>
						<div class="form-group">
							<label>백신 : </label> <input type="text" name="vac_name"
								value="<%=vac.getVac_name()%>" readonly class="inputBox">
						</div>
						<div class="form-group">
							<label>예약 날짜 : </label> <input type="text" name="rev_date"
								value="<%= request.getAttribute("ioc_date") %>" readonly class="inputBox" id="ioc">
						</div>
						<input type="hidden" name="serial_num" value=<%= vac.getSerial_num() %> class="inputBox" id="serial">
						<input type="hidden" name="reg_bus_no" value=<%= hp.getReg_bus_no() %> class="inputBox" id="reg">
						<!-- 						<div class="form-group">
							<label for="">예약일시 : </label> <input type="text" name="rev_date"
								value="2021-06-29 09:30:00" readonly id="inputBox"> <br>
							<a href="javascript:void(0)" target="_blank"
								onclick="reservationDatePopup()">날짜 선택</a>
						</div> -->
						<input type="hidden" name="reg_bus_no"
							value=<%=hp.getReg_bus_no()%> class="inputBox">

						<input type="button" onclick ="cancel('serial', 'rn', 'reg', 'rev')" value="예약취소">

					</form>

				</div>
			</div>
		</div>
	</div>
</body>
</html>