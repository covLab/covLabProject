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
<script type="text/javascript">
function movelogin(){
	location.href="/semi/views/member/login.jsp";
}
function movechange(){
	location.href="/semi/views/member/changePassword.jsp";
	
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
                            <a href="/semi/index.jsp"><span>Covlab</span></a>
                        </div>
                        <div class="login-form">
                 
                         
                           <div class="form-group">
                                    <button onclick="movelogin();"type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30">바로 로그인 하기</button>
                                    </div>	
                                    <form action="/semi/conn" method="post">
                                   <div class="form-group">
                              <button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30">비밀번호 변경하기</button>                           </div>
                              
                               <input type="hidden" name="codec" id="codec" class="form-control" value="<%=request.getAttribute("AuthenticationKey") %>">
                               <input type="hidden" name="userid" id="userid" class="form-control" value="<%=request.getAttribute("userid") %>">
                               </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 
</body>

</html>