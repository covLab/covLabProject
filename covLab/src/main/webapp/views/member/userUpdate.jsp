<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<!-- app-profile => myInfo_mem -->
<script src="/semi/resources/js/address.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"src="/semi/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function validate(){
    var nuserpwd = document.getElementById("nuserpwd").value;
	var nuserpwc = document.getElementById("nuserpwc").value;
    
      if(nuserpwd !== nuserpwc){ //비번확인
		alert("암호와 암호확인의 값이 일치하지 않습니다.");
		document.getElementById("nuserpwc").value = "";
		document.getElementById("nuserpwd").select();
		return false;  //전송 취소함
	}else{
		alert("수정이 완료 되었습니다.");
	}
      var phone = document.getElementById("phone").value;
      var rep =/^01[01679]-[0-9]{3,4}-[0-9]{4}$/; 
  	if(!rep.test(phone)){
  		alert("핸드폰 번호 입력을 다시 해주세요.");
  		return false;
  	} 
  
}
	
	  



</script>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>나의정보</title>

  

    <!-- Common -->
    <link href="/semi/resources/css/lib/font-awesome.min.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/themify-icons.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/menubar/sidebar.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/helper.css" rel="stylesheet">
    <link href="/semi/resources/css/style.css" rel="stylesheet">
    
   <%@ include file="../common/stylesheet.jsp"%>
<%@ include file="../common/sidebar.jsp"%>
<%@ include file="../common/topbar.jsp"%>

</head>

<body>
 
  <!-- /# sidebar -->


  
<!-- 위에메뉴 -->
                                          <% String Gender = ""; %>
                                          <% char ch = loginMember.getUserRn().charAt(7); %>
                                           <% if( ch == '1' || ch == '3'){ Gender = "남자"; %>
                                           <% }else{  Gender = "여자";} %>
                                            
  <div class="content-wrap">
    <div class="main">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-8 p-r-0 title-margin-right">
            <div class="page-header">
              <div class="page-title">
                <h1><%= loginMember.getUserName() %>님
                  
                </h1>
              </div>
            </div>
          </div>
          <!-- /# column -->
         
          <div class="col-lg-4 p-l-0 title-margin-left">
            <div class="page-header">
              <div class="page-title">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item" >  <a href="/semi/">홈 /</a></li>
                  <Br>&nbsp; 
                 <li class="breadcrumb-item" ><a href="../../myInfo.jsp">취소하기</a></li>
                </ol>
              </div>
            </div>
          </div>
          <!-- /# column -->
        </div>
        <!-- /# row -->
        <section id="main-content">
          <div class="row">
            <div class="col-lg-12">
              <div class="card">
                <div class="card-body">
                  <div class="user-profile">
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="user-photo m-b-30">
                        <% if (ch== '1' || ch== '3'){%>
                          <img class="img-fluid" src="/semi/resources/images/bookingSystem/2.png" style="width: 300px; height: 250px;" />
                          <% } else {%>
                          <img class="img-fluid" src="/semi/resources/images/bookingSystem/5.png" style="width: 300px; height: 250px;"/>
                          <% } %>
                        </div>
                        <div class="user-work">
                          
                          <div class="work-content">
                       
                            <!-- <p>123, South Mugda</p>
                            <p>New York, 1214</p> -->
                          </div>
                          <div class="work-content">
                         
                          <!--   <p>123, South Mugda</p>
                            <p>New York, 1214</p> -->
                          </div>
                          <div class="work-content">
                           
                            <!-- <p>123, South Mugda</p>
                            <p>New York, 1214</p> -->
                          </div>
                        </div>
                       
                      </div>
                    
                      <div class="col-lg-8">
                        <div class="user-profile-name">이 름   <%= loginMember.getUserName() %></div>
                        <div class="user-send-message">
                          </div>
                        <div class="custom-tab user-profile-tab">
                        <form action="/semi/uupdate" method="post" onsubmit="return validate();">
                          <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active">
                              <a href="#1" aria-controls="1" role="tab" data-toggle="tab">내 정보</a>
                            </li>
                          </ul>
                       
                          <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="1">
                              <div class="contact-information">
                                <!-- <h4>연락처 및 알림</h4> -->
                                
                           
                             <div class="phone-content">
                                  <span class="contact-title">이름:</span>
                                  <input type="text" name="username" id="username" class="phone-number" value="<%= loginMember.getUserName() %>" readonly>
                                </div>
                                <div class="phone-content">
                                  <span class="contact-title">아이디:</span>
                                  <input type="text" name="userid" id="userid" class="phone-number" value="<%= loginMember.getUserId() %>" readonly>
                                </div>
                                 <div class="phone-content">
                                  <span class="contact-title">새 비밀번호:</span>
                                  <input type="password" name="nuserpwd" id="nuserpwd" class="phone-number">
                                </div>
                                <div class="phone-content">
                                  <span class="contact-title">새 비밀번호 확인:</span>
                                  <input type="password" name="nuserpwc" id="nuserpwc" class="phone-number" >
                                </div>
                                <div class="phone-content">
                                  <span class="contact-title">전화번호:</span>
                                  <input type="text" name="phone" id="phone" class="phone-number" value="<%= loginMember.getUserPhone() %>">
                                </div>
                                <div class="address-content">
                                  <span class="contact-title">주소:</span>
                                   <input type="text" name="address"id="sample6_address"  class="mail-address" placeholder="주소"value="<%= loginMember.getUserAddress() %>">
                                    </div>
                                       <div class="address-content">
                                     <span class="contact-title"></span>
                                       <input type="text" name="address1"id="sample6_postcode" class="mail-address" placeholder="우편번호">
                                       <input type="button"name="address2"  class="mail-address"onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                                    </div>
                                    <div class="address-content">
                                     <span class="contact-title"></span>
                                    <input type="text" name="address3"id="sample6_detailAddress" class="mail-address" placeholder="상세주소">
                                    </div>
                                    <div class="address-content">
                                     <span class="contact-title"></span>
                                    <input type="text" name="address4"id="sample6_extraAddress" class="mail-address" placeholder="참고항목">
                                     </div>
                                   <Br>
                                <div class="email-content">
                                  <span class="contact-title">이메일:</span>
                                  <input type="email" name="email" id="email" class="mail-address" value="<%= loginMember.getUserEmail() %>">
                                </div>
                        
                               <div class="basic-information">
                                <h4>기본 정보</h4>
                                <div class="birthday-content">
                                  <span class="contact-title">주민번호:</span>
                                   <% String userrn = loginMember.getUserRn(); %>
                                  <% char[] rn= new char[userrn.length()]; %>
                                  <%  for(int i = 0 ; i < userrn.length(); i++) {%>
                                  <%  rn[i] = userrn.charAt(i) ;} %>
                                  <%  char[] copy = new char[rn.length];%>
                                  <% for(int i = 0 ; i < copy.length; i++){%>
                                  <% if(i <= 7){ %>
                                  <%  copy[i]= rn[i]; %>
                                  <% }else{ 	copy[i] = '*'; %>
                                  <%}} %>
                                  <span class="birth-date"><%= copy %></span>
                                </div>
                                <div class="gender-content">
                                  <span class="contact-title">성별:</span>
                                   
                                  <span class="gender"><%= Gender %></span>
                                </div>
                              </div>
                            </div>
                          
                          </div>
                        </div>
                        <button class="btn btn-primary " type="submit"  >
                            수정하기  </button>
                            
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          </div>
          <%@ include file="../common/footer.jsp"%>
          
         </section>
      </div>
    </div>
  </div>





    <!-- Common -->
    <script src="assets/js/lib/jquery.min.js"></script>
    <script src="assets/js/lib/jquery.nanoscroller.min.js"></script>
    <script src="assets/js/lib/menubar/sidebar.js"></script>
    <script src="assets/js/lib/preloader/pace.min.js"></script>
    <script src="assets/js/lib/bootstrap.min.js"></script>
    <script src="assets/js/scripts.js"></script>

</body>

</html>