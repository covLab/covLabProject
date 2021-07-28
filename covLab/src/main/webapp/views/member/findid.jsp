<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>




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
                         
							<!-- <form action="/semi/findidemail" method="post"> -->
								<div class="form-group">
									<h4>아이디 찾기</h4>
							         
                                    <h4>회원가입 시 사용한 아이디는<%= request.getAttribute("userid") %>  입니다.</h4>
								
											<hr>
										<button type="submit" class="btn btn-primary btn-flat m-b-15">로그인 화면으로 가기</button>
								</div>
								
								<div class="register-link text-center">
									<p>
										 <a href="/semi/">비밀번호 찾기</a>
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