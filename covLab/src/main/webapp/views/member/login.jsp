<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="/semi/resources/css/lib/font-awesome.min.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/themify-icons.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/helper.css" rel="stylesheet">
    <link href="/semi/resources/css/style.css" rel="stylesheet">
<title>Insert title here</title>
<<<<<<< Updated upstream
=======



>>>>>>> Stashed changes
</head>
<body class="bg-primary">

    <div class="unix-login">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="login-content">
                        <div class="login-logo">
                            <a href="index.html"><span>Covlab</span></a>
                        </div>
                        <div class="login-form">
                            <h4>로그인</h4>
                            <form action="/semi/login" method="post">
                              <label> <input type="radio" value="users" name="users"  checked>회원용</label> %nbsp;
                              <label> <input type="radio" value="admin" name="admin" >관리자용</label> <br><br>
                                <div class="form-group">
                                    <label>아이디</label>	
                                    <input type="text" class="form-control" name="userid"placeholder="ID" required>
                                </div>
                                <div class="form-group">
                                    <label>비밀번호</label>
                                    <input type="password" class="form-control" name="userpw"placeholder="Password" required>
                                </div>
                                
                                <div class="checkbox">
                                    <label>
										<input type="checkbox"> 저장하기
									</label>
                                </div>
                                <button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30">로그인</button>
                                </form>
                                <div>
                                <label class="pull-left">
										<a href="/semi/views/member/findUsers.jsp">아이디 찾기 및 비밀번호 찾기</a>
									</label>
									<br><br>
								
									</div>
                                <div class="register-link m-t-20 text-center">
                                    <p>회원이 아니신가요? <Br><a href="#"> 가입하기</a></p>
                                </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 
</body>

</html>