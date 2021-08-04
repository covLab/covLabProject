<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>아이디/비밀번호 찾기</title>

<!-- ================= Favicon ================== -->
<!-- Standard -->
<link href="/semi/resources/css/lib/font-awesome.min.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/themify-icons.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/helper.css" rel="stylesheet">
    <link href="/semi/resources/css/style.css" rel="stylesheet">
    <script type="text/javascript" src="/semi/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

function phoneCheck(){ 
	  $.ajax({
			url: "/semi/phonecheck",
			type: "post",
			data: {userid: $("#userid").val(), userphone: $("#userphone").val()},
			success: function(data){
				console.log("success : " + data);
				if(data == "ok"){
					alert("임시비밀번호가 핸드폰번호로 보내어 졌습니다.");
					
				}else{
					alert("조회된 정보가 없습니다.");
					
				}
			},
			error: function(jqXHR, textStatus, errorThrown){
				console.log("error : " + jqXHR + ", " 
						+ textStatus + ", " + errorThrown);
			}
		});
		
		//버튼 클릭이벤트 취소 (submit 으로 클릭 전달 막기 위함)
	
	}
function moveemail(){
	location.href="/semi/views/member/findPasswordEmail.jsp";
}
function movephone(){
	location.href="/semi/views/member/findPasswordPhone.jsp";
}
function validate(){
	 var phone = document.getElementById("userphone").value;
	 var re4= /^01[01679]-[0-9]{3,4}-[0-9]{4}$/; 
	if(!re4.test(phone)){
		alert("전화번호 형식이 틀렸습니다 (' - ')을 포함해서 입력해주세요.")
		document.getElementById("userphone").value="";
		 document.getElementById("userphone").focus();
		 return false;
	} 
}
 </script>   
    
</head>

<body class="bg-primary">

	<div class="unix-login">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="login-content">
						<div class="login-logo">
							<span>아이디/비밀번호 찾기</span></a>
						</div>
						<div class="login-form">

							<form action="/semi/findpwphone" method="post" onsubmit="return validate();">
								<div class="form-group">
									<h4>비밀번호 찾기</h4>
								<div class="form-group">
                                    <label>구 분</label>
                                    <Br>
                                    <label> <input type="radio" value="findemail" name="findemail" id="findemail"   onclick="moveemail();">이메일</label> 
                                    &nbsp;
                                   <label> <input type="radio" value="findphone" name="findphone" id="findphone" checked onclick="movephone();" >핸드폰</label>
                                </div>
								<!-- <form action="/semi/findidemail" method="post" > -->
								<hr>
								
								    <label>아이디</label> <input type="text"  name="userid" id="userid"class="form-control" required
										placeholder="아이디을 입력해주세요.">
										<br>
									<label>핸드폰</label> <input type="text"  name="userphone" id="userphone"class="form-control" required
										placeholder="핸드폰을 입력하세요">
								<hr>
								<button   onclick ="phoneCheck();"type="submit" class="btn btn-primary btn-flat m-b-15">확인</button>
									</div>
							<table border="1" width="700" height="100" align="center">
	<tr>
	<th class="a" align="left"></th>
		<td><ul>
			<li align="left">- 아이디/비밀번호 관리의 책임은 본인에게 있습니다.</li>
			<li align="left">- 타인에게 알려줄 경우 불이익을 당할 수 있으므로 관리에 주의하여주십시오.</li>
			<li align="left">- 아이디/비밀번호 관리소홀로 인한 피해는 본 사이트에서 책임지지 않습니다.</li>
			</ul></td>
	</tr>
			</table>	
			<br>
				
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

</body>

</html>