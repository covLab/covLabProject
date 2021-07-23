<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%
	//로그인 확인을 위해서 내장된 session 객체를 이용
	//Member loginMember = (Member)session.getAttribute("loginMember");
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
						<a href="index1.html"> <!-- <img src="assets/images/logo.png" alt="" /> -->
							<span>CovLab</span></a>
					</div>
					<li class="label">Menu</li>
					<ul>
						<li><a href="/semi/index.jsp">백신 예약</a></li>
						<li><a href="/semi/views/information/information.jsp">뉴스/백신 정보</a></li>
<<<<<<< HEAD
						<li>
						<% if(true){ //관리자용%>
							<a href="/semi/views/board/boardAdmin.jsp">접종 후기 관리</a>
						<% }else{ %>
							<a href="/semi/views/board/boardMain.jsp">접종 후기</a>
						<% } %>
						</li>
						<li>
						<% if(true){ //로그인%> <!--회원가입 창 만들었는데 아니다 싶으면 지워주세여  -->
						<a href="/semi/views/member/idcheck.jsp">회원가입</a>
							
						<% }else{  //로그인 아닐시 %>
							<a href="/semi/index.jsp">MY PAGE</a>
						<% } %>
						</li>
=======
						<% if(true){ //관리자 %>
							<li><a href="/semi/blistadmin">접종 후기 관리</a></li>
						<% } else { %>
							<li><a href="/semi/blist?page=1">접종 후기</a></li>
						<% } %>
						<li><a href="/semi/index.jsp">MY PAGE</a></li>
>>>>>>> 4d9b06480c850f8ac5836ff7326eab40b705fbd0
					</ul>




					<li><a class="sidebar-sub-toggle"><i class="ti-target"></i>
							Pages <span class="sidebar-collapse-icon ti-angle-down"></span></a>
						<ul>
							<li><a href="page-login.html">Login</a></li>
							<li><a href="page-register.html">Register</a></li>
							<li><a href="page-reset-password.html">Forgot password</a></li>
						</ul></li>
					<li><a href="../documentation/index.html"><i
							class="ti-file"></i> Documentation</a></li>
					<li><a><i class="ti-close"></i> Logout</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- /# sidebar -->


</body>
</html>