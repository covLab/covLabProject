<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Profile, java.util.ArrayList" %>
<%
	ArrayList<Profile> list = (ArrayList<Profile>)request.getAttribute("list");
      Profile p = (Profile)request.getAttribute("p");

%>
<!DOCTYPE html>
<html lang="en">
<!-- app-profile => myInfo_mem -->

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
                                          <% char ch = p.getUserRn().charAt(7); %>
                                           <% if( ch == '1' || ch == '3'){ Gender = "남성"; %>
                                           <% }else{  Gender = "여성";} %>
  <div class="content-wrap">
    <div class="main">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-8 p-r-0 title-margin-right">
            <div class="page-header">
              <div class="page-title">
                <h1><%= p.getUserName() %>님
                  <span>반갑습니다</span>
                </h1>
              </div>
            </div>
          </div>
          <!-- /# column -->
          <div class="col-lg-4 p-l-0 title-margin-left">
            <div class="page-header">
              <div class="page-title">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item">
                    <a href="/semi/views/member/userUpdate.jsp">정보변경 /</a>
                  </li>
                   <br>    &nbsp; 
                  <li class="breadcrumb-item active"><a href ="/semi/views/member/userDelete.jsp">회원탈퇴</a></li>
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
                        <% if(p.getVac_name() != null) {%>
                        <div class="user-work">
                          <h4>백신 예약 정보</h4>
                          <div class="work-content">
                            <h3>백신 종류</h3>
                  
                            <p><%= p.getVac_name() %></p>
                          </div>
                          <div class="work-content">
                            <h3>예약 병원</h3>
                            <p><%= p.getHp_name() %></p>
                            
                          </div>
                          <div class="work-content">
                            <h3>예약 시간</h3>
                             <p><%= p.getRev_date() %></p>
                            
                          </div>
                        </div>
                       <%} else { %>
                       <div class="user-work">
                          <h4>백신 예약 정보</h4>
                          <div class="work-content">
                            <h3>백신 종류</h3>
                  
                            <p></p>
                          </div>
                          <div class="work-content">
                            <h3>예약 병원</h3>
                            <p></p>
                            
                          </div>
                          <div class="work-content">
                            <h3>예약 시간</h3>
                             <p></p>
                            
                          </div>
                        </div>
                       <%} %>
                      </div>
                      <div class="col-lg-8">
                        <div class="user-profile-name">이 름   <%= p.getUserName() %></div>
                        
                        <div class="user-send-message">
                          <!-- <button class="btn btn-primary " type="button" onclick="javascript:location.href='/semi/views/reservation/detail_reservation.jsp'">
                            예약 상세 확인</button> -->
                        </div>
                        <div class="custom-tab user-profile-tab">
                          <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active">
                              <a href="#1" aria-controls="1" role="tab" data-toggle="tab">내 정보</a>
                            </li>
                          </ul>
                          <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="1">
                              <div class="contact-information">
                                <h4>연락처 및 알림</h4>
                                <div class="phone-content">
                                  <span class="contact-title">전화번호:</span>
                                  <span class="phone-number"><%= p.getUserPhone() %></span>
                                </div>
                                <div class="address-content">
                                  <span class="contact-title">주소:</span>
                                  <span class="mail-address"><%= p.getUserAddress() %></span>
                                </div>
                                <div class="email-content">
                                  <span class="contact-title">이메일:</span>
                                  <span class="contact-email"><%= p.getUserEmail() %></span>
                                </div>
                                <div class="website-content">
                                  <span class="contact-title">대리예약자:</span>
                               
                                    <span class="contact-title"><%= request.getAttribute("num") %>명</span>
                                    
                                    <button class="btn btn-primary "  onclick= "movepage();">
                            대리자 상세 확인</button>
                            <script type="text/javascript">
                        	function movepage(){
								location.href = "/semi/subusers?user_no=<%= p.getUserNo() %>";
							}
                            </script>
                                
                              <div class="basic-information">
                                <h4>기본 정보</h4>
                                <div class="birthday-content">
                                  <span class="contact-title">주민번호:</span>
                                   <% String userrn = p.getUserRn(); %>
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