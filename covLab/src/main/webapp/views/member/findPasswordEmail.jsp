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

function EmailCheck(){ 
	 $.ajax({
			url: "/semi/emailcheck",
			type: "post",
			data: {userid: $("#userid").val(), useremail: $("#useremail").val()},
			success: function(data){
				console.log("success : " + data);
				if(data == "ok"){
					alert("임시비밀번호가 이메일로 보내어 졌습니다.");
					
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

							<form action="/semi/findpwdemail" method="post">
								<div class="form-group">
									<h4>비밀번호 찾기</h4>
								<div class="form-group">
                                    <label>구 분</label>
                                    <Br>
                                    <label> <input type="radio" value="findemail" name="findemail" id="findemail"  checked onclick="moveemail();">이메일</label> 
                                    &nbsp;
                                   <label> <input type="radio" value="findphone" name="findphone" id="findphone" onclick="movephone();" >핸드폰</label>
                                </div>
								<!-- <form action="/semi/findidemail" method="post" > -->
								<hr>
								
								    <label>아이디</label> <input type="text"  name="userid" id="userid"class="form-control" required
										placeholder="아이디을 입력해주세요.">
										<Br>
									<label>이메일</label> <input type="email"  name="useremail" id="useremail"class="form-control" required
										placeholder="이메일 입력하세요">
								<hr>
								<button  onclick ="EmailCheck();" type="submit" value="확인"class="btn btn-primary btn-flat m-b-15">확인</button>
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

</body>

</html>