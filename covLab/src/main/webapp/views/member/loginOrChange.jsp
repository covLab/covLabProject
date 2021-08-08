<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@ include file="../common/stylesheet.jsp"%>
<%@ include file="../common/sidebar.jsp"%>
<%@ include file="../common/topbar.jsp"%>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="/semi/resources/css/lib/font-awesome.min.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/themify-icons.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/helper.css" rel="stylesheet">
    <link href="/semi/resources/css/style.css" rel="stylesheet">
<script src="/semi/resources/js/lib/menubar/sidebar.js"></script>
<title>Insert title here</title>

<script type="text/javascript">
function movelogin(){
	window.open("/semi/views/member/login.jsp", "login" , "width=700, height =800 ,top=50, left=400, location = no" )
}


</script>

</head>
<body class="" >

<div class="content-wrap">
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
                               
                                  <button onclick="movelogin();"type="submit" class="btn btn-info btn-xs m-b-10 m-l-5" style="height:100px; width:620px; font-size: 20px;  font-weight: bold;">바로 로그인 하기</button>
                               </div>
                                    <form action="/semi/conn" method="post" >
                                   <div class="form-group">
                               
                                  
                              <button type="submit" class="btn btn-info btn-xs m-b-10 m-l-5" style="height:100px; width:620px; font-size: 20px;  font-weight: bold;">비밀번호 변경하기</button>                           </div>
                              
                               <input type="hidden" name="codec" id="codec" class="form-control" value="<%=request.getAttribute("AuthenticationKey") %>">
                               <input type="hidden" name="userid" id="userid" class="form-control" value="<%=request.getAttribute("userid") %>">
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