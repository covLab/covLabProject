/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.66
 * Generated at: 2021-07-30 15:29:55 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views.information;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import member.model.vo.Member;
import member.model.vo.Member;

public final class information_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/views/information/../common/sidebar.jsp", Long.valueOf(1627623287347L));
    _jspx_dependants.put("/views/information/../common/topbar.jsp", Long.valueOf(1627623287354L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("member.model.vo.Member");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("\r\n");
      out.write("    <title>Focus Admin: Tab</title>\r\n");
      out.write("\r\n");
      out.write("    <!-- ================= Favicon ================== -->\r\n");
      out.write("    <!-- Standard -->\r\n");
      out.write("    <link rel=\"shortcut icon\" href=\"http://placehold.it/64.png/000/fff\">\r\n");
      out.write("    <!-- Retina iPad Touch Icon-->\r\n");
      out.write("    <link rel=\"apple-touch-icon\" sizes=\"144x144\" href=\"http://placehold.it/144.png/000/fff\">\r\n");
      out.write("    <!-- Retina iPhone Touch Icon-->\r\n");
      out.write("    <link rel=\"apple-touch-icon\" sizes=\"114x114\" href=\"http://placehold.it/114.png/000/fff\">\r\n");
      out.write("    <!-- Standard iPad Touch Icon-->\r\n");
      out.write("    <link rel=\"apple-touch-icon\" sizes=\"72x72\" href=\"http://placehold.it/72.png/000/fff\">\r\n");
      out.write("    <!-- Standard iPhone Touch Icon-->\r\n");
      out.write("    <link rel=\"apple-touch-icon\" sizes=\"57x57\" href=\"http://placehold.it/57.png/000/fff\">\r\n");
      out.write("\r\n");
      out.write("    <!-- Styles -->\r\n");
      out.write("    <link href=\"/semi/resources/css/lib/font-awesome.min.css\" rel=\"stylesheet\">\r\n");
      out.write("    <link href=\"/semi/resources/css/lib/themify-icons.css\" rel=\"stylesheet\">\r\n");
      out.write("    <link href=\"/semi/resources/css/lib/menubar/sidebar.css\" rel=\"stylesheet\">\r\n");
      out.write("    <link href=\"/semi/resources/css/lib/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("    <link href=\"/semi/resources/css/lib/helper.css\" rel=\"stylesheet\">\r\n");
      out.write("    <link href=\"/semi/resources/css/style.css\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write('\r');
      out.write('\n');

Member loginMember = (Member) session.getAttribute("loginMember");

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title></title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("	<div\r\n");
      out.write("		class=\"sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures\">\r\n");
      out.write("		<div class=\"nano\">\r\n");
      out.write("			<div class=\"nano-content\">\r\n");
      out.write("				<ul>\r\n");
      out.write("					<div class=\"logo\">\r\n");
      out.write("						<a href=\"index1.html\"> <!-- <img src=\"assets/images/logo.png\" alt=\"\" /> -->\r\n");
      out.write("							<span>CovLab</span></a>\r\n");
      out.write("					</div>\r\n");
      out.write("					<li class=\"label\">Menu</li>\r\n");
      out.write("					<ul>\r\n");
      out.write("						<li><a href=\"/semi/index.jsp\">홈페이지</a></li>\r\n");
      out.write("						<li><a href=\"/semi/views/information/information.jsp\">뉴스/백신\r\n");
      out.write("								정보</a></li>\r\n");
      out.write("\r\n");
      out.write("						");
if (loginMember == null) { //일반유져
      out.write("\r\n");
      out.write("						\r\n");
      out.write("						<!--회원가입 창 만들었는데 아니다 싶으면 지워주세여  -->\r\n");
      out.write("						<li><a href=\"/semi/views/member/enroll.html\">회원가입</a></li>\r\n");
      out.write("						<li><a href=\"/semi/blist?page=1\">접종 후기</a></li>\r\n");
      out.write("						\r\n");
      out.write("						");
} else if (loginMember.getUserGrade().equals("A")) { //관리자
      out.write("\r\n");
      out.write("						\r\n");
      out.write("							<li><a class=\"sidebar-sub-toggle\">\r\n");
      out.write("									관리 페이지 <span class=\"sidebar-collapse-icon ti-angle-down\"></span></a>\r\n");
      out.write("								<ul>\r\n");
      out.write("									<li><a href=\"/semi/blistadmin?page=1\">접종 후기 관리</a></li>\r\n");
      out.write("									<li><a href=\"/semi/mmanage\">회원 관리</a></li>\r\n");
      out.write("									<li><a href=\"/semi/bcmanage\">백신 관리</a></li>\r\n");
      out.write("								</ul></li>\r\n");
      out.write("						\r\n");
      out.write("						");
 } else {//로그인 
      out.write("\r\n");
      out.write("							<li><a href=\"/semi/blist?page=1\">접종 후기</a></li>\r\n");
      out.write("							<li><a href=\"/semi/views/member/myInfo.jsp\">MY PAGE</a></li>\r\n");
      out.write("\r\n");
      out.write("						");
}
      out.write("\r\n");
      out.write("\r\n");
      out.write("					</ul>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("					<ul>\r\n");
      out.write("						<li><a class=\"sidebar-sub-toggle\"><i class=\"ti-target\"></i>\r\n");
      out.write("								Pages <span class=\"sidebar-collapse-icon ti-angle-down\"></span></a>\r\n");
      out.write("							<ul>\r\n");
      out.write("								<li><a href=\"page-login.html\">Login</a></li>\r\n");
      out.write("								<li><a href=\"page-register.html\">Register</a></li>\r\n");
      out.write("								<li><a href=\"page-reset-password.html\">Forgot password</a></li>\r\n");
      out.write("							</ul></li>\r\n");
      out.write("						\r\n");
      out.write("						<li><a><i class=\"ti-close\"\r\n");
      out.write("								onclick=\"javascript:location.href='logout';\"></i> Logout</a></li>\r\n");
      out.write("					</ul>\r\n");
      out.write("				</ul>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("	<!-- /# sidebar -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
 
	Member loginMember1 = (Member)session.getAttribute("loginMember");

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title></title>\r\n");
      out.write("<link href=\"/semi/resources/css/lib/font-awesome.min.css\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"/semi/resources/css/lib/themify-icons.css\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"/semi/resources/css/lib/menubar/sidebar.css\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"/semi/resources/css/lib/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"/semi/resources/css/lib/helper.css\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"/semi/resources/css/style.css\" rel=\"stylesheet\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
 if(loginMember1 == null){ 
      out.write("\r\n");
      out.write("<div class=\"header\">\r\n");
      out.write("        <div class=\"container-fluid\">\r\n");
      out.write("			<div class=\"row\">\r\n");
      out.write("				<div class=\"col-lg-12\">\r\n");
      out.write("					<div class=\"float-left\">\r\n");
      out.write("						<div class=\"hamburger sidebar-toggle\">\r\n");
      out.write("							<span class=\"line\"></span> <span class=\"line\"></span> <span\r\n");
      out.write("								class=\"line\"></span>\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
      out.write("					<div class=\"float-right\">\r\n");
      out.write("						<div class=\"dropdown dib\">\r\n");
      out.write("							<div class=\"header-icon\" data-toggle=\"dropdown\">\r\n");
      out.write("								<i class=\"ti-bell\"></i>\r\n");
      out.write("							</div>\r\n");
      out.write("						</div>\r\n");
      out.write("						<div class=\"dropdown dib\">\r\n");
      out.write("							<div class=\"header-icon\" data-toggle=\"dropdown\">\r\n");
      out.write("								<i class=\"ti-email\"></i>\r\n");
      out.write("								\r\n");
      out.write("							</div>\r\n");
      out.write("						</div>\r\n");
      out.write("						<div class=\"dropdown dib\">\r\n");
      out.write("							<div class=\"header-icon\" data-toggle=\"dropdown\">\r\n");
      out.write("								<span class=\"user-avatar\" onclick=\"javascript:location.href='/semi/views/member/login.jsp'\">로그인\r\n");
      out.write("								</span>\r\n");
      out.write("								</div>\r\n");
      out.write("							</div>\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
 }else{ 
      out.write("\r\n");
      out.write("	<div class=\"header\">\r\n");
      out.write("        <div class=\"container-fluid\">\r\n");
      out.write("			<div class=\"row\">\r\n");
      out.write("				<div class=\"col-lg-12\">\r\n");
      out.write("					<div class=\"float-left\">\r\n");
      out.write("						<div class=\"hamburger sidebar-toggle\">\r\n");
      out.write("							<span class=\"line\"></span> <span class=\"line\"></span> <span\r\n");
      out.write("								class=\"line\"></span>\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
      out.write("					<div class=\"float-right\">\r\n");
      out.write("						<div class=\"dropdown dib\">\r\n");
      out.write("							<div class=\"header-icon\" data-toggle=\"dropdown\">\r\n");
      out.write("								<i class=\"ti-bell\"></i>\r\n");
      out.write("							</div>\r\n");
      out.write("						</div>\r\n");
      out.write("						<div class=\"dropdown dib\">\r\n");
      out.write("							<div class=\"header-icon\" data-toggle=\"dropdown\">\r\n");
      out.write("								<i class=\"ti-email\"></i>\r\n");
      out.write("								<div class=\"drop-down dropdown-menu dropdown-menu-right\">\r\n");
      out.write("									<div class=\"dropdown-content-heading\">\r\n");
      out.write("										<span class=\"text-left\">2 New Messages</span> <a\r\n");
      out.write("											href=\"email.html\"> <i class=\"ti-pencil-alt pull-right\"></i>\r\n");
      out.write("										</a>\r\n");
      out.write("									</div>\r\n");
      out.write("									<div class=\"dropdown-content-body\">\r\n");
      out.write("										<ul>\r\n");
      out.write("											<li class=\"notification-unread\"><a href=\"#\"> <img\r\n");
      out.write("													class=\"pull-left m-r-10 avatar-img\"\r\n");
      out.write("													src=\"/semi/resources/images/avatar/1.jpg\" alt=\"\" />\r\n");
      out.write("													<div class=\"notification-content\">\r\n");
      out.write("														<small class=\"notification-timestamp pull-right\">02:34\r\n");
      out.write("															PM</small>\r\n");
      out.write("														<div class=\"notification-heading\">Michael Qin</div>\r\n");
      out.write("														<div class=\"notification-text\">Hi Teddy, Just wanted\r\n");
      out.write("															to let you ...</div>\r\n");
      out.write("													</div>\r\n");
      out.write("											</a></li>\r\n");
      out.write("											<li class=\"notification-unread\"><a href=\"#\"> <img\r\n");
      out.write("													class=\"pull-left m-r-10 avatar-img\"\r\n");
      out.write("													src=\"/semi/resources/images/avatar/2.jpg\" alt=\"\" />\r\n");
      out.write("													<div class=\"notification-content\">\r\n");
      out.write("														<small class=\"notification-timestamp pull-right\">02:34\r\n");
      out.write("															PM</small>\r\n");
      out.write("														<div class=\"notification-heading\">Mr. John</div>\r\n");
      out.write("														<div class=\"notification-text\">Hi Teddy, Just wanted\r\n");
      out.write("															to let you ...</div>\r\n");
      out.write("													</div>\r\n");
      out.write("											</a></li>\r\n");
      out.write("											<li><a href=\"#\"> <img\r\n");
      out.write("													class=\"pull-left m-r-10 avatar-img\"\r\n");
      out.write("													src=\"/semi/resources/images/avatar/3.jpg\" alt=\"\" />\r\n");
      out.write("													<div class=\"notification-content\">\r\n");
      out.write("														<small class=\"notification-timestamp pull-right\">02:34\r\n");
      out.write("															PM</small>\r\n");
      out.write("														<div class=\"notification-heading\">Michael Qin</div>\r\n");
      out.write("														<div class=\"notification-text\">Hi Teddy, Just wanted\r\n");
      out.write("															to let you ...</div>\r\n");
      out.write("													</div>\r\n");
      out.write("											</a></li>\r\n");
      out.write("											<li><a href=\"#\"> <img\r\n");
      out.write("													class=\"pull-left m-r-10 avatar-img\"\r\n");
      out.write("													src=\"/semi/resources/images/avatar/2.jpg\" alt=\"\" />\r\n");
      out.write("													<div class=\"notification-content\">\r\n");
      out.write("														<small class=\"notification-timestamp pull-right\">02:34\r\n");
      out.write("															PM</small>\r\n");
      out.write("														<div class=\"notification-heading\">Mr. John</div>\r\n");
      out.write("														<div class=\"notification-text\">Hi Teddy, Just wanted\r\n");
      out.write("															to let you ...</div>\r\n");
      out.write("													</div>\r\n");
      out.write("											</a></li>\r\n");
      out.write("											<li class=\"text-center\"><a href=\"#\" class=\"more-link\">See\r\n");
      out.write("													All</a></li>\r\n");
      out.write("										</ul>\r\n");
      out.write("									</div>\r\n");
      out.write("								</div>\r\n");
      out.write("							</div>\r\n");
      out.write("						</div>\r\n");
      out.write("						<div class=\"dropdown dib\">\r\n");
      out.write("							<div class=\"header-icon\" data-toggle=\"dropdown\">\r\n");
      out.write("								<span class=\"user-avatar\">");
      out.print( loginMember1.getUserId() );
      out.write("\r\n");
      out.write("								<i class=\"ti-angle-down f-s-10\"></i>\r\n");
      out.write("								</span>\r\n");
      out.write("								<div\r\n");
      out.write("									class=\"drop-down dropdown-profile dropdown-menu dropdown-menu-right\">\r\n");
      out.write("									<div class=\"dropdown-content-heading\">\r\n");
      out.write("										<span class=\"text-left\">Upgrade Now</span>\r\n");
      out.write("										<p class=\"trial-day\">30 Days Trail</p>\r\n");
      out.write("									</div>\r\n");
      out.write("									<div class=\"dropdown-content-body\">\r\n");
      out.write("										<ul>\r\n");
      out.write("											<li><a href=\"#\"> <i class=\"ti-user\"></i> <span>Profile</span>\r\n");
      out.write("											</a></li>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("											<li><a href=\"#\"> <i class=\"ti-settings\"></i> <span>Setting</span>\r\n");
      out.write("											</a></li>\r\n");
      out.write("\r\n");
      out.write("											<li><a href=\"#\"> <i class=\"ti-lock\"></i> <span>Lock\r\n");
      out.write("														Screen</span>\r\n");
      out.write("											</a></li>\r\n");
      out.write("											\r\n");
      out.write("											<li onclick=\"javascript:location.href='/semi/logout';\" ><i class=\"ti-power-off\" ></i> <span >로그아웃</span>\r\n");
      out.write("										</li>\r\n");
      out.write("										</ul>\r\n");
      out.write("									</div>\r\n");
      out.write("								</div>\r\n");
      out.write("							</div>\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("	");
 } 
      out.write("\r\n");
      out.write("	 <script src=\"/semi/resources/js/lib/jquery.min.js\"></script>\r\n");
      out.write("    <script src=\"/semi/resources/js/lib/jquery.nanoscroller.min.js\"></script>\r\n");
      out.write("    <script src=\"/semi/resources/js/lib/menubar/sidebar.js\"></script>\r\n");
      out.write("    <script src=\"/semi/resources/js/lib/preloader/pace.min.js\"></script>\r\n");
      out.write("    <script src=\"/semi/resources/js/lib/bootstrap.min.js\"></script>\r\n");
      out.write("    <script src=\"/semi/resources/js/scripts.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("/* 자동배너 부분 */\r\n");
      out.write("html, body { box-sizing: border-box; padding: 0; margin: 0; text-align: center; }\r\n");
      out.write("    *, *:before, *:after { box-sizing: inherit; }\r\n");
      out.write("    .clearfix:after { content: ''; display: block; clear: both; float: none; }\r\n");
      out.write("    .title { margin-bottom: 0; text-align: center; font-size: 30px; color: #333; }\r\n");
      out.write("    .link, .link:visited { display: inline-block; margin: 20px 0; color: #555; text-decoration: none; font-weight: bold; }\r\n");
      out.write("    .link:hover, .link:focus { color: #9fd6c2; }\r\n");
      out.write("    /* container - body */\r\n");
      out.write("    #container { width: 1000px; margin: auto; }\r\n");
      out.write("    .slide_wrap { position: relative; width: 400px; margin: auto; padding-bottom: 30px; }\r\n");
      out.write("    .slide_box { width: 100%; margin: auto; overflow-x: hidden; }\r\n");
      out.write("    /*밑에가 슬라이드 이미지 칸에 대한 부분*/\r\n");
      out.write("    .slide_content { display: table; float: left; width: 400px; height: 400px; }\r\n");
      out.write("    /*밑에가 슬라이드 내의 글자*/\r\n");
      out.write("    .slide_content > p { display: table-cell; vertical-align: middle; text-align: center; font-size: 100px; font-weight: bold; color: #555; }\r\n");
      out.write("    .slide_content.slide01 { background: #ddbdff; }\r\n");
      out.write("    .slide_content.slide02 { background: #9fd6c2; }\r\n");
      out.write("    .slide_content.slide03 { background: #abe2f7; }\r\n");
      out.write("    .slide_content.slide04 { background: #f08c78; }\r\n");
      out.write("    /* .slide_content.slide05 { background: #fbdb65; } */\r\n");
      out.write("    .slide_btn_box > button { position: absolute; top: 50%; margin-top: -45px; width: 60px; height: 60px; font-size: 16px; color: white; background: navy; border: 1px solid #ddd; cursor: pointer; }\r\n");
      out.write("    .slide_btn_box > .slide_btn_prev { left: -100px; }\r\n");
      out.write("    .slide_btn_box > .slide_btn_next { right: -100px; }\r\n");
      out.write("    .slide_pagination { position: absolute; left: 50%; bottom: 0; list-style: none; margin: 0; padding: 0; transform: translateX(-50%); }\r\n");
      out.write("    .slide_pagination .dot { display: inline-block; width: 15px; height: 15px; margin: 0 5px; overflow: hidden; background: #ddd; border-radius: 50%; transition: 0.3s; }\r\n");
      out.write("    .slide_pagination .dot.dot_active { background: #333; }\r\n");
      out.write("    .slide_pagination .dot a { display: block; width: 100%; height: 100%; }\r\n");
      out.write("    \r\n");
      out.write("\r\n");
      out.write(" /* 두번째 버튼 부분 */ \r\n");
      out.write(" .btn {\r\n");
      out.write("  text-decoration: none;\r\n");
      out.write("  font-size:15pt;  \r\n");
      out.write("  background-color: navy;\r\n");
      out.write("  color: white;\r\n");
      out.write("  padding:10px 20px 10px 20px;\r\n");
      out.write("  margin:10px;\r\n");
      out.write("  display:inline-block;\r\n");
      out.write("  border-radius: 10px;\r\n");
      out.write("  transition:all 0.2s;\r\n");
      out.write("  text-shadow:0px -2px black;\r\n");
      out.write(" }\r\n");
      out.write(" .btn:active {\r\n");
      out.write("  transform:translateY(5px);\r\n");
      out.write(" }\r\n");
      out.write(" \r\n");
      out.write(" \r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("    <div class=\"content-wrap\">\r\n");
      out.write("        <div class=\"main\">\r\n");
      out.write("            <div class=\"container-fluid\">\r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-lg-8 p-r-0 title-margin-right\">\r\n");
      out.write("                        <div class=\"page-header\">\r\n");
      out.write("                            <div class=\"page-title\">\r\n");
      out.write("                                <h1>뉴스 /  백신 정보 <span>게시판</span></h1>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <!-- /# column -->\r\n");
      out.write("                    <div class=\"col-lg-4 p-l-0 title-margin-left\">\r\n");
      out.write("                        <div class=\"page-header\">\r\n");
      out.write("                            <div class=\"page-title\">\r\n");
      out.write("                                <ol class=\"breadcrumb\">\r\n");
      out.write("                                    <li class=\"breadcrumb-item\"><a href=\"#\">Dashboard</a></li>\r\n");
      out.write("                                    <li class=\"breadcrumb-item active\">Table-Row-Select</li>\r\n");
      out.write("                                </ol>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <!-- /# column -->\r\n");
      out.write("                </div>\r\n");
      out.write("                <!-- /# row -->\r\n");
      out.write("                <section id=\"main-content\">\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"col-lg-12\">\r\n");
      out.write("                            <div class=\"card\">\r\n");
      out.write("                                <div class=\"card-title\">\r\n");
      out.write("                                <!-- 1. 코로나/백신 정보 (자동 슬라이드) -->\r\n");
      out.write("                                    <h4>자동 배너, 코로나 확진자 수/백신접종현황/예방접종 사전예약 날짜/QnA</h4>\r\n");
      out.write("\r\n");
      out.write("<!-- 자동배너 (이미지 넣고, 수정해야함) -->\r\n");
      out.write("  <div id=\"container\">\r\n");
      out.write("    <div class=\"slide_wrap\">\r\n");
      out.write("      <div class=\"slide_box\">\r\n");
      out.write("        <div class=\"slide_list clearfix\">\r\n");
      out.write("          <div class=\"slide_content slide01\">\r\n");
      out.write("            <p>1</p>\r\n");
      out.write("          </div>\r\n");
      out.write("          <div class=\"slide_content slide02\">\r\n");
      out.write("            <p>2</p>\r\n");
      out.write("          </div>\r\n");
      out.write("          <div class=\"slide_content slide03\">\r\n");
      out.write("            <p>3</p>\r\n");
      out.write("          </div>\r\n");
      out.write("          <div class=\"slide_content slide04\">\r\n");
      out.write("            <p>4</p>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- // .slide_list -->\r\n");
      out.write("      </div>\r\n");
      out.write("      <!-- // .slide_box -->\r\n");
      out.write("      <div class=\"slide_btn_box\">\r\n");
      out.write("        <button type=\"button\" class=\"slide_btn_prev\">이전</button>\r\n");
      out.write("        <button type=\"button\" class=\"slide_btn_next\">다음</button>\r\n");
      out.write("      </div>\r\n");
      out.write("      <!-- // .slide_btn_box -->\r\n");
      out.write("      <ul class=\"slide_pagination\"></ul>\r\n");
      out.write("      <!-- // .slide_pagination -->\r\n");
      out.write("    </div>\r\n");
      out.write("    <!-- // .slide_wrap -->\r\n");
      out.write("  </div>\r\n");
      out.write("  <!-- // .container -->\r\n");
      out.write("  <hr>\r\n");
      out.write("  \r\n");
      out.write(" \r\n");
      out.write("  <!-- 2. 코로나/ 백신 정보로 넘어가는 버튼 -->\r\n");
      out.write("<h4>버튼을 클릭하면 해당 페이지로 이동함</h4>\r\n");
      out.write("<br>\r\n");
      out.write("<a class=\"btn\" href=\"coronaInfo.jsp\">코로나 정보</a>\r\n");
      out.write("<a class=\"btn\" href=\"vaccinInfo.jsp\">백신/예방접종 정보</a>\r\n");
      out.write("<a class=\"btn\" href=\"qna.jsp\">QnA</a>\r\n");
      out.write("<a class=\"btn\" href=\"test.jsp\">test</a>\r\n");
      out.write("<hr>\r\n");
      out.write("\r\n");
      out.write("<!-- 3. 실시간 뉴스 -->\r\n");
      out.write("<h4>크롤링으로 실시간 뉴스 가져오기</h4>\r\n");
      out.write("  \r\n");
      out.write("                                </div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <!-- /# card -->\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <!-- /# column -->\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <!-- /# row -->\r\n");
      out.write("                </section>\r\n");
      out.write("            </div>\r\n");
      out.write("<!-- ---------------------------------------------------------------------------------------- -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <!-- jquery vendor -->\r\n");
      out.write("    <script src=\"/semi/resources/js/lib/jquery.min.js\"></script>\r\n");
      out.write("    <script src=\"/semi/resources/js/lib/jquery.nanoscroller.min.js\"></script>\r\n");
      out.write("    <script src=\"/semi/resources/js/lib/bootstrap.min.js\"></script><script src=\"assets/js/scripts.js\"></script>\r\n");
      out.write("    <!-- scripit init-->\r\n");
      out.write("\r\n");
      out.write("<!-- 자동배너 부분의 스크립트 -->\r\n");
      out.write("<script>\r\n");
      out.write("    (function () {\r\n");
      out.write("      const slideList = document.querySelector('.slide_list');  // Slide parent dom\r\n");
      out.write("      const slideContents = document.querySelectorAll('.slide_content');  // each slide dom\r\n");
      out.write("      const slideBtnNext = document.querySelector('.slide_btn_next'); // next button\r\n");
      out.write("      const slideBtnPrev = document.querySelector('.slide_btn_prev'); // prev button\r\n");
      out.write("      const pagination = document.querySelector('.slide_pagination');\r\n");
      out.write("      const slideLen = slideContents.length;  // slide length\r\n");
      out.write("      const slideWidth = 400; // slide width\r\n");
      out.write("      const slideSpeed = 300; // slide speed\r\n");
      out.write("      const startNum = 0; // initial slide index (0 ~ 4)\r\n");
      out.write("      \r\n");
      out.write("      slideList.style.width = slideWidth * (slideLen + 2) + \"px\";\r\n");
      out.write("      \r\n");
      out.write("      // Copy first and last slide\r\n");
      out.write("      let firstChild = slideList.firstElementChild;\r\n");
      out.write("      let lastChild = slideList.lastElementChild;\r\n");
      out.write("      let clonedFirst = firstChild.cloneNode(true);\r\n");
      out.write("      let clonedLast = lastChild.cloneNode(true);\r\n");
      out.write("\r\n");
      out.write("      // Add copied Slides\r\n");
      out.write("      slideList.appendChild(clonedFirst);\r\n");
      out.write("      slideList.insertBefore(clonedLast, slideList.firstElementChild);\r\n");
      out.write("\r\n");
      out.write("      // Add pagination dynamically\r\n");
      out.write("      let pageChild = '';\r\n");
      out.write("      for (var i = 0; i < slideLen; i++) {\r\n");
      out.write("        pageChild += '<li class=\"dot';\r\n");
      out.write("        pageChild += (i === startNum) ? ' dot_active' : '';\r\n");
      out.write("        pageChild += '\" data-index=\"' + i + '\"><a href=\"#\"></a></li>';\r\n");
      out.write("      }\r\n");
      out.write("      pagination.innerHTML = pageChild;\r\n");
      out.write("      const pageDots = document.querySelectorAll('.dot'); // each dot from pagination\r\n");
      out.write("\r\n");
      out.write("      slideList.style.transform = \"translate3d(-\" + (slideWidth * (startNum + 1)) + \"px, 0px, 0px)\";\r\n");
      out.write("\r\n");
      out.write("      let curIndex = startNum; // current slide index (except copied slide)\r\n");
      out.write("      let curSlide = slideContents[curIndex]; // current slide dom\r\n");
      out.write("      curSlide.classList.add('slide_active');\r\n");
      out.write("\r\n");
      out.write("      /** Next Button Event */\r\n");
      out.write("      slideBtnNext.addEventListener('click', function() {\r\n");
      out.write("        if (curIndex <= slideLen - 1) {\r\n");
      out.write("          slideList.style.transition = slideSpeed + \"ms\";\r\n");
      out.write("          slideList.style.transform = \"translate3d(-\" + (slideWidth * (curIndex + 2)) + \"px, 0px, 0px)\";\r\n");
      out.write("        }\r\n");
      out.write("        if (curIndex === slideLen - 1) {\r\n");
      out.write("          setTimeout(function() {\r\n");
      out.write("            slideList.style.transition = \"0ms\";\r\n");
      out.write("            slideList.style.transform = \"translate3d(-\" + slideWidth + \"px, 0px, 0px)\";\r\n");
      out.write("          }, slideSpeed);\r\n");
      out.write("          curIndex = -1;\r\n");
      out.write("        }\r\n");
      out.write("        curSlide.classList.remove('slide_active');\r\n");
      out.write("        pageDots[(curIndex === -1) ? slideLen - 1 : curIndex].classList.remove('dot_active');\r\n");
      out.write("        curSlide = slideContents[++curIndex];\r\n");
      out.write("        curSlide.classList.add('slide_active');\r\n");
      out.write("        pageDots[curIndex].classList.add('dot_active');\r\n");
      out.write("      });\r\n");
      out.write("\r\n");
      out.write("      /** Prev Button Event */\r\n");
      out.write("      slideBtnPrev.addEventListener('click', function() {\r\n");
      out.write("        if (curIndex >= 0) {\r\n");
      out.write("          slideList.style.transition = slideSpeed + \"ms\";\r\n");
      out.write("          slideList.style.transform = \"translate3d(-\" + (slideWidth * curIndex) + \"px, 0px, 0px)\";\r\n");
      out.write("        }\r\n");
      out.write("        if (curIndex === 0) {\r\n");
      out.write("          setTimeout(function() {\r\n");
      out.write("            slideList.style.transition = \"0ms\";\r\n");
      out.write("            slideList.style.transform = \"translate3d(-\" + (slideWidth * slideLen) + \"px, 0px, 0px)\";\r\n");
      out.write("          }, slideSpeed);\r\n");
      out.write("          curIndex = slideLen;\r\n");
      out.write("        }\r\n");
      out.write("        curSlide.classList.remove('slide_active');\r\n");
      out.write("        pageDots[(curIndex === slideLen) ? 0 : curIndex].classList.remove('dot_active');\r\n");
      out.write("        curSlide = slideContents[--curIndex];\r\n");
      out.write("        curSlide.classList.add('slide_active');\r\n");
      out.write("        pageDots[curIndex].classList.add('dot_active');\r\n");
      out.write("      });\r\n");
      out.write("\r\n");
      out.write("      /** Pagination Button Event */\r\n");
      out.write("      let curDot;\r\n");
      out.write("      Array.prototype.forEach.call(pageDots, function (dot, i) {\r\n");
      out.write("        dot.addEventListener('click', function (e) {\r\n");
      out.write("          e.preventDefault();\r\n");
      out.write("          curDot = document.querySelector('.dot_active');\r\n");
      out.write("          curDot.classList.remove('dot_active');\r\n");
      out.write("          \r\n");
      out.write("          curDot = this;\r\n");
      out.write("          this.classList.add('dot_active');\r\n");
      out.write("\r\n");
      out.write("          curSlide.classList.remove('slide_active');\r\n");
      out.write("          curIndex = Number(this.getAttribute('data-index'));\r\n");
      out.write("          curSlide = slideContents[curIndex];\r\n");
      out.write("          curSlide.classList.add('slide_active');\r\n");
      out.write("          slideList.style.transition = slideSpeed + \"ms\";\r\n");
      out.write("          slideList.style.transform = \"translate3d(-\" + (slideWidth * (curIndex + 1)) + \"px, 0px, 0px)\";\r\n");
      out.write("        });\r\n");
      out.write("      });\r\n");
      out.write("    })();\r\n");
      out.write("  </script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
