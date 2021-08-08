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


</head>
<body class="">

    <div class="unix-login">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="login-content">
                        <div class="login-logo">
                            <a href="/semi/index.jsp"><span>CovLab</span></a>
                        </div>
                        <div class="login-form">
                            <h4 style="font-weight: bold;">로그인</h4>
                            <form action="/semi/login" method="post"  target="parent">
                            
                                <div class="form-group">
                                    <label style="font-size: 15px;  font-weight: bold; ">아이디</label>	
                                    <input type="text" class="form-control" name="userid" id="userid" placeholder="아이디" required>
                                </div>
                                <div class="form-group">
                                    <label style="font-size: 15px;  font-weight: bold; ">비밀번호</label>
                                    <input type="password" class="form-control" name="userpw" id="userpw" placeholder="비밀번호" required>
                                </div>
                                
                                
                                <button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30" onclick='success();'>로그인</button>
                                <script type="text/javascript">
                                function success(){

                                    window.close();
                           	window.opener.name = "parent"; // 부모창의 이름 설정
                           
                                    document.popForm.target = "parent"; // 타켓을 부모창으로 설정 

                                    document.popForm.action = "/semi/index.jsp";  //부모창에 호출될 url 
                                
                                    document.popForm.submit();
                                    

                                }
                                </script>
                                </form>
                                <div>
                                <label class="pull-left">
										<a href="/semi/views/member/findUserEmail.jsp"onclick="searchId()">아이디 찾기</a>
										<script type="text/javascript">
										 function searchId(){
		                                	  window.opener.location="findUserEmail.jsp";
		                                	  window.close();
		                                  }
										</script>
									</label>
									<br><br>
									
                                <label class="pull-left">
										<a href="/semi/views/member/findPasswordEmail.jsp"onclick="searchPw()">비밀번호 찾기</a>
										<script type="text/javascript">
										 function searchPw(){
		                                	  window.opener.location="findPasswordEmail.jsp";
		                                	  window.close();
		                                  }
										</script>
									</label>
									<br>
									</div>
                                <div class="register-link m-t-20 text-center">
                                    <p>회원이 아니신가요? <Br><a href="/semi/views/member/idCheck.jsp" onclick="enroll();"> 가입하기</a></p>
                                  <script type="text/javascript">
                                  function enroll(){
                                	  window.opener.location="idCheck.jsp";
                                	  window.close();
                                  }
                                  </script>
                                </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 
</body>

</html>