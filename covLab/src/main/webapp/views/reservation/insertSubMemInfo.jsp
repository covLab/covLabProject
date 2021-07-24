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
	function insertSub(){
		
	 	
	 	
	}
</script>
</head>
<body>
	<div class="row">

		<div class="col-lg-3 p-0 ">
			<div class="card h-100 m-0">
				<div class="card_header"></div>
				<div class="card-body">
					<h5 class="card-title text-center">접종자 정보 입력</h5>

					<form action="/semi/insertres" method="post" name="info">
					
						<div class="form-group">
							<label for="user_name">이름 : </label> <input type="text"
								name="user_name">
						</div>
						<div class="form-group">
							<label for="user_rn">주민번호 : </label><input type="text"
								name="user_rn"  id="rn">
						</div>
						<div class="form-group">
							<label for="user_address">주소 : </label><input type="text"
								name="user_address">
						</div>
						
						<input type="hidden" name="ioc_date" value=<%= request.getAttribute("ioc_date") %> class="inputBox" id="ioc">
						<input type="hidden" name="serial_num" value=<%= vac.getSerial_num() %> class="inputBox" id="serial">
						<input type="hidden" name="reg_bus_no" value=<%=hp.getReg_bus_no()%> class="inputBox" id="reg">
						<input type="hidden" name="user_no" value=<%=mb.getUserNo()%> class="inputBox" id="no"> 
						<input type="button" onclick="insertSub()" value="예약하기">

					</form>

				</div>
			</div>
		</div>
	</div>
</body>
</html>