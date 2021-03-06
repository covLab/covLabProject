<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<!-- page-register -->
<head>
   <%@ include file="../common/stylesheet.jsp"%>
<%@ include file="../common/sidebar.jsp"%>
<%@ include file="../common/topbar.jsp"%>

  <style>
  body{
  }
  .check{
  background: #03a9f4;
  border-color: #03a9f4;
  color: #ffffff;

   background: transparent;
  color: #373757;}
  
  
  
  .check.active,
  .check:focus,
  .check:hover{
   background: #0286c2;
  border-color: #03a9f4;
  color: #ffffff;
  box-shadow: none;
  
  
  }
  </style>

    <title>Focus Admin: Widget</title>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="/semi/resources/css/lib/font-awesome.min.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/themify-icons.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/helper.css" rel="stylesheet">
    <link href="/semi/resources/css/style.css" rel="stylesheet">
    <script src="/semi/resources/js/lib/menubar/sidebar.js"></script>
    
    <script src="/semi/resources/js/address.js"></script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script type="text/javascript" src="/semi/resources/js/jquery-3.6.0.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->

 <script type="text/javascript">
 function dupIDCheck(){
	 $.ajax({
			url: "/semi/dupid",
			type: "post",
			data: {userid: $("#userid").val()},
			success: function(data){
				console.log("success : " + data);
				if(data == "ok"){
					alert("사용 가능한 아이디입니다.");
					$("#upwd").focus();
				}else{
					alert("이미 사용중인 아이디입니다.");
					$("#userid").select();
				}
			},
			error: function(jqXHR, textStatus, errorThrown){
				console.log("error : " + jqXHR + ", " 
						+ textStatus + ", " + errorThrown);
			}
		});
		
		//버튼 클릭이벤트 취소 (submit 으로 클릭 전달 막기 위함)
		return false;
	}
 
function validate(){
	    var pwValue = document.getElementById("userpw").value;
		var pwValue2 = document.getElementById("userpw2").value;
		
		if(pwValue !== pwValue2){ //비번확인
			alert("암호와 암호확인의 값이 일치하지 않습니다.");
			document.getElementById("userpw2").value = "";
			document.getElementById("userpw").select();
			return false;  //전송 취소함
		}
		
	
	
var username = document.getElementById("username").value;//이름확인
var re =/^[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]{2,4}$/;
if(!re.test(username)){// 한글자나 5글자이상 입력할시 뜨는 문구
	 alert("한글로 2글자 이상 4글자 이하로 작성해주세요.")
	 document.getElementById("username").value="";
	 document.getElementById("username").focus();
	 return false;
	}
	
var userrn = document.getElementById("userrn").value; //주민번호 형식 정규식표현
if(userrn.length != 14){//주민번호 자릿수 안맞을때 뜨는 문구
	 alert("(-)포함 14자리 입력해주세요.");
	 document.getElementById("userrn").value="";
	 document.getElementById("userrn").select();
	 return false;
}
var re2 =/\d{6}\-[1-4]\d{6}/;
if(!re2.test(userrn)){//- 빼먹었을때 뜨는 문구
	 alert("주민번호 형식이 맞지 않거나 잘못 입력하였습니다.")
	 document.getElementById("userrn").value="";
	 document.getElementById("userrn").focus();
	 return false;
}

/* var re3 =/^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

if(!re3.test(email)){
	alert("이메일 형식이 틀렸습니다.")
	document.getElementById("email").value="";
	 document.getElementById("email").focus();
	 return false;
}
 */
 var phone = document.getElementById("phone").value;
 var re4= /^01[01679]-[0-9]{3,4}-[0-9]{4}$/; 
if(!re4.test(phone)){
	alert("전화번호 형식이 틀렸습니다 (' - ')을 포함해서 입력해주세요.")
	document.getElementById("phone").value="";
	 document.getElementById("phone").focus();
	 return false;
} 
	
}
 
 </script>


</head>

<body class="">

   <div class="content-wrap">
    <div class="main">
        
    
        <div class="container-fluid">
            <div class="row justify-content-center">
             <div class="col-lg-6">
                <div class="login-content">
                     <div class="login-logo">
                         <a href="/semi/index.html"><span>CovLab</span></a>
                        </div>
                        <div class="login-form">
                        
                            <h4  style="font-weight: bold; ">회원가입</h4>
                            <form action="/semi/enroll" method="post" onsubmit="return validate();">
                                <div class="form-group">
                                    <label style="font-size: 15px;  font-weight: bold;">이름</label>
                                    <input type="text" name="username" id="username" class="form-control" placeholder="이름">
                                </div>
                                 <div class="form-group">
                                    <label style="font-size: 15px;  font-weight: bold; ">아이디</label>
                                    <input type="text" class="form-control" name="userid" id="userid" placeholder="아이디" required>
                                    <input type="button"class="check"value="중복체크" onclick="return dupIDCheck();">
                                   
                                </div>
                                 <div class="form-group">
                                    <label  style="font-size: 15px;  font-weight: bold; ">비밀번호</label>
                                    <input type="password" name="userpw" id="userpw" class="form-control" placeholder="비밀번호" required>
                                </div>
                                 <div class="form-group">
                                    <label  style="font-size: 15px;  font-weight: bold; ">비밀번호 확인</label>
                                    <input type="password" name="userpw2" id="userpw2" class="form-control" placeholder="비밀번호" required>
                                </div>
                                 <div class="form-group">
                                     <label  style="font-size: 15px;  font-weight: bold; ">주민번호</label>
                                      <br>
                                  <input type="text"class="form-control" name="userrn" id="userrn" placeholder="주민번호" required>
                                </div>
                                <div class="form-group">
                                    <label  style="font-size: 15px;  font-weight: bold; ">이메일</label>
                                    <input type="email" name="email" id="email" class="form-control" placeholder="Email" required>
                                </div>
                                 <div class="form-group">
                                    <label  style="font-size: 15px;  font-weight: bold; ">전화번호</label>
                                    <input type="text" name="phone" id="phone" class="form-control" placeholder="전화번호" onclick="popupcode();">
                                     <script>
                                    function popupcode(){
                                    	window.open("phoneCode.jsp", "본인인증" , "width = 500, height = 500, top = 100, left = 200, location = no" )
                                    }
                                    </script>
                               
                                
                                </div>
                                 <div class="form-group">
                                    <label  style="font-size: 15px;  font-weight: bold; ">주소</label>
                                     <input type="text" name="address1"id="sample6_postcode" class="form-control" placeholder="우편번호"><Br>
                                    <input type="button"name="address2"  class="check"onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><Br>
                                    <input type="text" name="address"id="sample6_address"  class="form-control" placeholder="주소"><br>
                                    <input type="text" name="address4"id="sample6_extraAddress" class="form-control" placeholder="참고항목">
                                    <input type="text" name="address5"id="sample6_detailAddress" class="form-control" placeholder="상세주소">
                                </div>
                                 <div class="form-group">
                                    <label  style="font-size: 15px;  font-weight: bold; ">수신동의</label>
                                    <Br>
                                    <label> <input type="radio" value="Y" name="smsagr" id="smsagr"  checked >네.</label> &nbsp;
                                    <label> <input type="radio" value="N" name="smsagr" id="smsagr"  >아니오.</label>
                                </div>
                              
                                
                                <button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30">가입하기</button>
                                
                                <div class="register-link m-t-15 text-center">
                                    <p>이미 등록이 되어있나요? ? <a href="/semi/views/member/login.jsp" onclick="window.open(this.href, '로그인', 'width=700, height =800 ,top=50, left=400 ,resizeable=no');return false;"> 로그인</a></p>
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