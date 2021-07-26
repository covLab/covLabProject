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

<script type="text/javascript" src="/semi/resources/js/jquery-3.6.0.min.js"></script>
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
				<div class="card_header"></div>
				<div class="card-body">
					<h5 class="card-title text-center">접종자 정보 입력</h5>

					<form action="" method="post" name="info" id= "info">
					
						<div class="form-group">
							<label for="sub_user_name">이름 : </label> <input type="text"
								name="sub_user_name">
						</div>
						<div class="form-group">
							<label for="sub_user_rn">주민번호 : </label><input type="text"
								name="sub_user_rn"  id="sub_user_rn">
						</div>
						<div class="form-group">
							<label for="sub_user_address">주소 : </label><input type="text"
								name="sub_user_address">
						</div>
						<div class="form-group">
							<label for="sub_user_phone">전화번호 : </label><input type="text"
								name="sub_user_phone">
						</div>
						<input type="text" name="ioc_date" value="<%= request.getAttribute("ioc_date") %> " class="inputBox" id="ioc" readonly><br>
						<input type="text" name="serial_num" value=<%= vac.getSerial_num() %> class="inputBox" id="serial"><br>
						<input type="text" name="reg_bus_no" value=<%=hp.getReg_bus_no()%> class="inputBox" id="reg"><br>
						<input type="text" name="user_no" value=<%=mb.getUserNo()%> class="inputBox" id="no"> <br>
						<input type="text" name="sub_user_no" value=<%=mb.getUserNo()%> class="inputBox" id="subno"> <br>
						<input type="button" onclick="insertSub()" value="예약하기">

					</form>

				</div>
			</div>
		</div>
	</div>
</body>
</html>