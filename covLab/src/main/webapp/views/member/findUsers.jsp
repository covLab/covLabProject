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
function emailCheck(){ 
	 $.ajax({
			url: "/semi/memailcheck",
			type: "post",
			data: {useremail: $("#useremail").val()},
			success: function(data){
				console.log("success : " + data);
				if(data == "ok"){
					alert("아아디가 이메일로 보내졌습니다.");
					
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

							<form>
								<div class="form-group">
								<h4>아이디 찾기</h4>
								<!-- <form action="/semi/findidemail" method="post" > -->
									<label>이메일로 찾기</label> <input type="email"  name="useremail" id="useremail"class="form-control"
										placeholder="이메일 형식으로 입력하세요">
								<hr>
								<button onclick="emailCheck();" type="submit" value="확인"class="btn btn-primary btn-flat m-b-15">확인</button>
									</div>
									
										<hr>
									<div class="form-group">
									<label>핸드폰 번호로 찾기</label> <input type="text" class="form-control"
										placeholder="핸드폰 번호 '-' 포함해 적어주세요.">
										<br>
											<hr>
										<button type="submit" class="btn btn-primary btn-flat m-b-15">확인</button>
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