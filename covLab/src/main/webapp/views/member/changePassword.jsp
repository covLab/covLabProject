<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
    <% Member member = (Member)request.getAttribute("member"); %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>아이디/비밀번호 찾기</title>
   <%@ include file="../common/stylesheet.jsp"%>
<%@ include file="../common/sidebar.jsp"%>
<%@ include file="../common/topbar.jsp"%>
<!-- ================= Favicon ================== -->
<!-- Standard -->
<link href="/semi/resources/css/lib/font-awesome.min.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/themify-icons.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/helper.css" rel="stylesheet">
    <link href="/semi/resources/css/style.css" rel="stylesheet">
      <script src="/semi/resources/js/lib/menubar/sidebar.js"></script>
    <script type="text/javascript" src="/semi/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
/* function tempCheck(){ 
	 $.ajax({
			url: "/semi/ctemp",
			type: "post",
			data: {curpd: $("#curpd").val()},
			success: function(data){
				console.log("success : " + data);
				if(data == "ok"){
					alert("임시비밀번호가 틀립니다.");
					}else{
						alert("모르겟다");
				
			},
			error: function(jqXHR, textStatus, errorThrown){
				console.log("error : " + jqXHR + ", " 
						+ textStatus + ", " + errorThrown);
			}
		});
		
		//버튼 클릭이벤트 취소 (submit 으로 클릭 전달 막기 위함)
	
	}
} */
function codeCheck(){

	var nuserpw = document.getElementById("nuserpw").value;
	var nuserpw2 = document.getElementById("nuserpw2").value;
	var code = document.getElementById("code").value;
	var codec = document.getElementById("codec").value;

			
	if(nuserpw !== nuserpw2){ //비번확인
				alert("암호와 암호확인의 값이 일치하지 않습니다.");
				document.getElementById("nuserpw").value = "";
				document.getElementById("nuserpw").select();
				return false;
	}
	if(code !== codec){ //비번확인
				alert("입력된 임시비밀번호가 다릅니다.");
				document.getElementById("code").value = "";
				document.getElementById("code").select();
				return false;
	}else{
		alert("비밀번호가 변경 되었습니다.")
	}
}
 </script>   
    
</head>

<body class="bg-primary">
<div class="content-wrap">
	<div class="unix-login">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="login-content">
						<div class="login-logo">
							<span>CovLab</span></a>
						</div>
						<div class="login-form">

							<form action="/semi/cpassword" method="post" onsubmit="return codeCheck();">
								<div class="form-group">
									<h4 style=" font-weight: bold; ">비밀번호 변경</h4>
									 <div class="form-group">
									 <label style="font-size: 15px;  font-weight: bold; ">아이디</label>
                                    <input type="text" name="userid" id="userid" class="form-control"value="<%=request.getAttribute("userid") %>" readonly="readonly">
                               </div> 
									<div class="form-group">
									 <label style="font-size: 15px;  font-weight: bold; ">임시 비밀번호</label>
                                    <input type="text" name="code" id="code" class="form-control" placeholder="인증번호를입력하세요" required>
                               </div>
                                   <div class="form-group">
                                 <input type="hidden" name="codec" id="codec" class="form-control" value="<%= request.getAttribute("codec") %>" required>
                               </div>
                              
                               
					<div class="form-group">
                                 <label style="font-size: 15px;  font-weight: bold; ">새 비밀번호</label>
                                    <input type="password" name="nuserpw" id="nuserpw" class="form-control"placeholder="비밀번호" required>
                               </div>
                               
                                 <div class="form-group">
                                    <label style="font-size: 15px;  font-weight: bold; ">새 비밀번호 확인</label>
                                    <input type="password" name="nuserpw2" id="nuserpw2" class="form-control" placeholder="비밀번호" required>
                                </div> 
								<hr>
								<button type="submit"value="확인"class="btn btn-primary btn-flat m-b-15">확인</button>
									</div> 
							
				
								<div class="register-link text-center">
									<p>
										Back to <a href="/semi/"> Home</a>
									</p>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

</body>

</html>