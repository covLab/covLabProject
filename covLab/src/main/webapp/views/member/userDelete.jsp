<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
  

<!DOCTYPE html>
<html>
<head>
 <%@ include file="../common/stylesheet.jsp"%>
<%@ include file="../common/sidebar.jsp"%>
<%@ include file="../common/topbar.jsp"%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="/semi/resources/css/lib/font-awesome.min.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/themify-icons.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/helper.css" rel="stylesheet">
    <link href="/semi/resources/css/style.css" rel="stylesheet">
        <script src="/semi/resources/js/lib/menubar/sidebar.js"></script>
    <title>회원 확인</title>
<script type="text/javascript" src="/semi/resources/js/jquery-3.6.0.min.js"></script>
 <script type="text/javascript">


 </script>   

</head>

<body class="">
  <div class="content-wrap">
    <div class="unix-login">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="login-content">
                        <div class="login-logo">
                            <a href="/semi/index.html"><span>CovLab</span></a>
                        </div>
                        <div class="login-form">
                            <h4 style="font-weight: bold;">회원 탈퇴</h4>
                            <form action="/semi/duser" method="post" >
                                <div class="form-group">
                                    <label style="font-size: 15px;  font-weight: bold;">아이디</label>
                                    <input type="text" class="form-control" name="userid" id="userid" value="<%= loginMember.getUserId() %>" readonly>
                                </div>
                                <div class="form-group">
                                     <label style="font-size: 15px;  font-weight: bold;">비밀번호</label>
                                      <br>
                                  <input type="password"class="form-control" name="userpwd" id="userpwd" placeholder="비밀번호 입력해주세요." required>
								</div>
                              
                                <button id="mbutton" type="submit" value="submit"class="btn btn-primary btn-flat m-b-15" >제출하기</button>
                              <script type="text/javascript">
                            
                              </script>
                                <div class="register-link text-center">
                                    <p>돌아가기 <a href="/semi/"> 홈페이지</a></p>
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