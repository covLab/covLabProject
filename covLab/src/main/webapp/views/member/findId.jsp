<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>




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
 
    
</head>

<body class="">
<div class="content-wrap">
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
									<h4>아이디 찾기</h4><Br>
							         
                                    <h4>회원가입 시 사용한 아이디는 "<%= request.getAttribute("userid") %>" 입니다.</h4>
								
											<hr>
										<button type="submit" class="btn btn-primary btn-flat m-b-15" onclick="confirm();">확인</button>
								</div>
								<script type="text/javascript">
								function confirm(){
									
								window.open("/semi/views/member/login.jsp",'login',"width=700, height =800 ,top=50, left=400 ,resizeable=no");
									
			                           
			                                    
								}
								</script>
								<div class="register-link text-center">
									<p>
										 <a href="/semi/views/member/findPasswordEmail.jsp">비밀번호 찾기</a>
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