<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member"%>
<% 
	Member loginMember1 = (Member)session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="/semi/resources/css/lib/font-awesome.min.css" rel="stylesheet">
<link href="/semi/resources/css/lib/themify-icons.css" rel="stylesheet">
<link href="/semi/resources/css/lib/menubar/sidebar.css" rel="stylesheet">
<link href="/semi/resources/css/lib/bootstrap.min.css" rel="stylesheet">
<link href="/semi/resources/css/lib/helper.css" rel="stylesheet">
<link href="/semi/resources/css/style.css" rel="stylesheet">
</head>
<body>
<% if(loginMember1 == null){ %>
<div class="header">
        <div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<div class="float-left">
						<div class="hamburger sidebar-toggle">
							<span class="line"></span> <span class="line"></span> <span
								class="line"></span>
						</div>
					</div>
					<div class="float-right">
						<div class="dropdown dib">
							<div class="header-icon" data-toggle="dropdown">
								<i class="ti-bell"></i>
							</div>
						</div>
						<div class="dropdown dib">
							<div class="header-icon" data-toggle="dropdown">
								<i class="ti-email"></i>
								
							</div>
						</div>
						<div class="dropdown dib">
							<div class="header-icon" data-toggle="dropdown">
								<span class="user-avatar" onclick="javascript:location.href='/semi/views/member/login.jsp'">로그인 해주세요
								</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<% }else{ %>
	<div class="header">
        <div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<div class="float-left">
						<div class="hamburger sidebar-toggle">
							<span class="line"></span> <span class="line"></span> <span
								class="line"></span>
						</div>
					</div>
					<div class="float-right">
						<div class="dropdown dib">
							<div class="header-icon" data-toggle="dropdown">
								<i class="ti-bell"></i>
							</div>
						</div>
						<div class="dropdown dib">
							<div class="header-icon" data-toggle="dropdown">
								<i class="ti-email"></i>
								<div class="drop-down dropdown-menu dropdown-menu-right">
									<div class="dropdown-content-heading">
										<span class="text-left">2 New Messages</span> <a
											href="email.html"> <i class="ti-pencil-alt pull-right"></i>
										</a>
									</div>
									<div class="dropdown-content-body">
										<ul>
											<li class="notification-unread"><a href="#"> <img
													class="pull-left m-r-10 avatar-img"
													src="/semi/resources/images/avatar/1.jpg" alt="" />
													<div class="notification-content">
														<small class="notification-timestamp pull-right">02:34
															PM</small>
														<div class="notification-heading">Michael Qin</div>
														<div class="notification-text">Hi Teddy, Just wanted
															to let you ...</div>
													</div>
											</a></li>
											<li class="notification-unread"><a href="#"> <img
													class="pull-left m-r-10 avatar-img"
													src="/semi/resources/images/avatar/2.jpg" alt="" />
													<div class="notification-content">
														<small class="notification-timestamp pull-right">02:34
															PM</small>
														<div class="notification-heading">Mr. John</div>
														<div class="notification-text">Hi Teddy, Just wanted
															to let you ...</div>
													</div>
											</a></li>
											<li><a href="#"> <img
													class="pull-left m-r-10 avatar-img"
													src="/semi/resources/images/avatar/3.jpg" alt="" />
													<div class="notification-content">
														<small class="notification-timestamp pull-right">02:34
															PM</small>
														<div class="notification-heading">Michael Qin</div>
														<div class="notification-text">Hi Teddy, Just wanted
															to let you ...</div>
													</div>
											</a></li>
											<li><a href="#"> <img
													class="pull-left m-r-10 avatar-img"
													src="/semi/resources/images/avatar/2.jpg" alt="" />
													<div class="notification-content">
														<small class="notification-timestamp pull-right">02:34
															PM</small>
														<div class="notification-heading">Mr. John</div>
														<div class="notification-text">Hi Teddy, Just wanted
															to let you ...</div>
													</div>
											</a></li>
											<li class="text-center"><a href="#" class="more-link">See
													All</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="dropdown dib">
							<div class="header-icon" data-toggle="dropdown">
								<span class="user-avatar"><%= loginMember1.getUserId() %>
								<i class="ti-angle-down f-s-10"></i>
								</span>
								<div
									class="drop-down dropdown-profile dropdown-menu dropdown-menu-right">
									<div class="dropdown-content-heading">
										<span class="text-left">Upgrade Now</span>
										<p class="trial-day">30 Days Trail</p>
									</div>
									<div class="dropdown-content-body">
										<ul>
											<li><a href="#"> <i class="ti-user"></i> <span>Profile</span>
											</a></li>


											<li><a href="#"> <i class="ti-settings"></i> <span>Setting</span>
											</a></li>

											<li><a href="#"> <i class="ti-lock"></i> <span>Lock
														Screen</span>
											</a></li>
											
											<li onclick="javascript:location.href='logout';"><i class="ti-power-off" ></i> <span >로그아웃</span>
										</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<% } %>
	 <script src="/semi/resources/js/lib/jquery.min.js"></script>
    <script src="/semi/resources/js/lib/jquery.nanoscroller.min.js"></script>
    <script src="/semi/resources/js/lib/menubar/sidebar.js"></script>
    <script src="/semi/resources/js/lib/preloader/pace.min.js"></script>
    <script src="/semi/resources/js/lib/bootstrap.min.js"></script>
    <script src="/semi/resources/js/scripts.js"></script>
</body>
</html>