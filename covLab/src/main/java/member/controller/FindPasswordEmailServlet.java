package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import member.model.servcie.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class FindPasswordEmailServlet
 */
@WebServlet("/findpwdemail")
public class FindPasswordEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPasswordEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userid = request.getParameter("userid");
		String useremail = request.getParameter("useremail");

		// 먼저 아이디로 회원정보를 받아오고 가져온 데이터에서 email값을 비교하여 존재하지 않으면 인증메일 보내지 못함
		
		 Member member = new MemberService().searchpwd(userid,useremail); 
		
		
		// mail server 설정
		String host = "smtp.gmail.com";
		String user = "djop1212@gmail.com"; // 자신의 네이버 계정
		String password = "ehtlfkr!2";// 자신의 네이버 패스워드

		// 메일 받을 주소
		String to_email = useremail;
	

		// SMTP 서버 정보를 설정한다.
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.debug", "true");

		// 인증 번호 생성기
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		String AuthenticationKey = temp.toString();
		

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		// email 전송
		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(user, "djop1212@gmail.com"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

			// 메일 제목
			msg.setSubject("안녕하세요  인증 메일입니다.");
			// 메일 내용
			msg.setText("인증 비밀번호는 :" + temp);

			Transport.send(msg);
			System.out.println("이메일 전송");
			System.out.println(AuthenticationKey);
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		HttpSession saveKey = request.getSession();
		saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
		
		
		
		String cryptoUserpw = null;
		try {
			MessageDigest md = 
					MessageDigest.getInstance("SHA-512");
		
			byte[] pwValues = 
					AuthenticationKey.getBytes(Charset.forName("UTF-8"));
			
			md.update(pwValues);
			
			cryptoUserpw = Base64.getEncoder()
							.encodeToString(pwValues);
		
			System.out.println(cryptoUserpw);
			System.out.println(cryptoUserpw.length());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		member.setUserPw(cryptoUserpw);
		int result = new MemberService().updateTempPw(cryptoUserpw, userid, useremail);
		System.out.println("서블릿"+cryptoUserpw);
		// 패스워드 바꿀때 뭘 바꿀지 조건에 들어가는 id
		/*
		 * req.setAttribute("id", memberId);
		 * req.getRequestDispatcher("/views/login_myPage/searchPasswordEnd.jsp").forward
		 * (req, resp);
		 */
      
//		PrintWriter out = response.getWriter();  
//		response.setContentType("text/html");  
//		out.println("<script type=\"text/javascript\">");  
//		out.println("alert('deadbeef');");  
//		out.println("</script>");
		 if(member != null && result>0) {
			  RequestDispatcher view = request.getRequestDispatcher("views/member/loginOrChange.jsp");
			  request.setAttribute("userid", userid);
			  request.setAttribute("AuthenticationKey", AuthenticationKey);
				 view.forward(request, response); 
			  
			}else {	
				RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
						request.setAttribute("message", 
								"회원 정보가 잘못 입력되었거나, 없습니다.");
						view.forward(request, response);
				}
	



	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
