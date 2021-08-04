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

<!-- /* if(userphone != null){	
String userphone = document.getElementById("userphone").value;


String api_key = "NCSY6G9GW44ERFNT";
String api_secret = "YGY9MZDGFPPES8DQDQHCL9N8IQHWXYGS";
Message coolsms = new Message(api_key, api_secret);

int authNo = (int)(Math.random() * (9999 - 1000 + 1)) + 1000;
System.out.println(authNo);

HashMap<String, String> params = new HashMap<String, String>();
params.put("to", userphone);	// 수신전화번호
params.put("from", "010-9403-6242");	// 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
params.put("type", "SMS");
params.put("text", "인증번호는 " + authNo + "입니다.");
params.put("app_version",  "JAVA SDK v1.2"); // application name and version

try {
  JSONObject obj = (JSONObject) coolsms.send(params);
  System.out.println(obj.toString());
} catch (CoolsmsException e) {
  System.out.println(e.getMessage());
  System.out.println(e.getCode());
}
}
location.href ="/semi/views/member/PhoneCode.jsp";
}else{
	
} -->
<script type="text/javascript" src="/semi/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function sendSms(){
	var re4= /^01[01679]-[0-9]{3,4}-[0-9]{4}$/;  
	$.ajax({
			url: "/semi/ncode",
			type: "post",
			data: {userphone: $("#userphone").val()},
			success: function(data){
				console.log("success : " + data);
				if(data != "ok" && !re4.test(userphone)){
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
	opener.document.getElementById("phone").value = document.getElementById("userphone").value 
	window.close()
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
                                    <label>인증 번호</label>	
                                    <input type="text" class="form-control" name="userphone" id="userphone" placeholder="인증번호" required>
                                </div>
                                <div class="form-group">
                                    <label>인증 번호</label>	
                                    <input type="text" class="form-control" name="userphone" id="userphone" value="<%= request.getAttribute("authNo")%>"required>
                                </div>
                                 
                               
                                
                                
                               
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 








</body>
</html>