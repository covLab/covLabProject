<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
 <% Member member = (Member)request.getAttribute("member"); %>
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
    <title>회원 확인</title>
<script type="text/javascript" src="/semi/resources/js/jquery-3.6.0.min.js"></script>
 <script type="text/javascript">

 function IDCheck(){ 
	 $.ajax({
			url: "/semi/idcheck",
			type: "post",
			data: {username: $("#username").val(), userrn: $("#userrn").val()},
			success: function(data){
				console.log("success : " + data);
				if(data == "ok"){
					alert("이미 등록된 회원 입니다.");
					
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
                            <a href="/semi/index.html"><span>Focus</span></a>
                        </div>
                        <div class="login-form">
                            <h4>회원 확인</h4>
                            <form action="/semi/mcheck" method="post" >
                                <div class="form-group">
                                    <label>이름</label>
                                    <input type="text" class="form-control" name="username" id="username" placeholder="이름">
                                </div>
                                <div class="form-group">
                                     <label>주민번호</label>
                                      <br>
                                  <input type="text"class="form-control" name="userrn" id="userrn" placeholder="주민번호">
								</div>
                              
                                <button  onclick="IDCheck();" id="mbutton" type="submit" value="submit"class="btn btn-primary btn-flat m-b-15">제출하기</button>
                              
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

</body>

</html>