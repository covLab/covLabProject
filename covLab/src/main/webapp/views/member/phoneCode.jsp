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
<title>본인 인증</title>


<script type="text/javascript" src="/semi/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function sendSms(){
	var userphone = document.getElementById("userphone").value;
	var re4= /^01[01679]-[0-9]{3,4}-[0-9]{4}$/;  
	$.ajax({
			url: "/semi/ncode",
			type: "post",
			data: {userphone: $("#userphone").val()},
		
			success: function(data){
				console.log("success : " + data);
	
			
               var code =data;
               $('#code').attr('value',code);

				console.log(data);
				if(data != "ok" && re4.test(userphone)){
				       alert("인증번호를 보냈습니다.");
				     
				      
								
					}else{
						alert("전화번호 형식이 틀렸습니다 (' - ')을 포함해서 입력해주세요.")
						
					}
				 
			},
			error: function(jqXHR, textStatus, errorThrown){
				console.log("error : " + jqXHR + ", " 
						+ textStatus + ", " + errorThrown);
			}
		});
		
		//버튼 클릭이벤트 취소 (submit 으로 클릭 전달 막기 위함)
		
	}
	


function setParentText(){
	var code = document.getElementById("code").value;
	var code1 = document.getElementById("code1").value;
	
	if(code == code1){
		alert("인증 완료!")
	opener.document.getElementById("phone").value = document.getElementById("userphone").value 
	window.close()
	}else{
		alert("인증 번호가 틀렸습니다. 다시 입력 해주세요.")
		document.getElementById("code1").value = "";
		document.getElementById("code1").select();
	}
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
                            <h4>본인인증</h4>
                            
                              
                                <div class="form-group">
                                    <label>핸드폰 번호</label>	
                                    <input type="text" class="form-control" name="userphone" id="userphone" placeholder="핸드폰 번호를 (' - ')포함 입력해주세요." required>
                                     <button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30"  onclick="return sendSms();">인증번호 받기</button>
                                </div>
                                   <div class="form-group">
                                    <label>인증 번호</label>	
                                    <input type="text" class="form-control" name="code1" id="code1" placeholder="인증번호" required>
                                     <input type="hidden" class="form-control" name="code" id="code" value="" placeholder="인증번호" required>
                                   
                                  <!--   <p  id="code"></p> -->
                                </div>
                               
                                <button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30"  onclick="setParentText();"> 확인</button>
                                
                                
                                
                               
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 








</body>
</html>