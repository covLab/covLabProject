<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
Member loginMember = (Member) session.getAttribute("loginMember");
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title></title>

</head>
<body>

   <div
      class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
      <div class="nano">
         <div class="nano-content">
            <ul>
               <div class="logo">
                  <a href="/semi/indexres"> <!-- <img src="assets/images/logo.png" alt="" /> -->
                     <span>CovLab</span></a>
               </div>
               <li class="label">Menu</li>
               <ul>
                  <li><a href="/semi/indexres?page=1">홈페이지</a></li>
                  <li><a href="/semi/newslet">뉴스/백신
                        정보</a></li>

                  <%if (loginMember == null) { //일반유져%>
                  
                  <!--회원가입 창 만들었는데 아니다 싶으면 지워주세여  -->
                  <li><a href="/semi/views/member/enroll.html">회원가입</a></li>
                  <li><a href="/semi/blist?page=1">접종 후기</a></li>
                  
                  <%} else if (loginMember.getUserGrade().equals("A")) { //관리자%>
                  
                     <li><a class="sidebar-sub-toggle">
                           관리 페이지 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                        <ul>
                           <li><a href="/semi/blistadmin?page=1">접종 후기 관리</a></li>
                           <li><a href="/semi/mlist">회원 관리</a></li>
                           <li><a href="/semi/vcmanage">백신 관리</a></li>
                        </ul></li>
                  <%} else if(loginMember.getUserGrade().equals("H")){ %>
                  		<li><a href="/semi/blist?page=1">접종 후기</a></li>
                  		<li><a href="/semi/rinfolist">백신 접종 관리</a></li>
                  <% } else {//로그인 %>
                     <li><a href="/semi/blist?page=1">접종 후기</a></li>
                     <li><a href="/semi/uprofile?userid=<%= loginMember.getUserId()%>&user_no=<%= loginMember.getUserNo() %>">MY PAGE</a></li>

                  <%}%>

               </ul>


               <ul>
                  <li><a class="sidebar-sub-toggle"><i class="ti-target"></i>
                        Pages <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                     <ul>
                        <li><a href="/semi/views/member/login.jsp" onclick="window.open(this.href, '로그인', 'width=700, height =800 ,top=50, left=400 ,resizeable=no');return false;">Login</a></li>
                        <li><a href="/semi/views/member/idCheck.jsp">Enroll</a></li>
                        <li><a href="/semi/views/member/findPasswordEmail.jsp">Forgot password</a></li>
                     </ul></li>
                  
                  <li onclick="javascript:location.href='/semi/logout';"><a><i class="ti-close"
                       ></i> Logout</a></li>
               </ul>
            </ul>
         </div>
      </div>
   </div>
   <!-- /# sidebar -->

	<script src="/semi/resources/js/lib/jquery.min.js"></script>
	<script src="/semi/resources/js/lib/jquery.nanoscroller.min.js"></script>
	<script src="/semi/resources/js/lib/bootstrap.min.js"></script>
		<script src="/semi/resources/js/scripts.js"></script>
</body>
</html>