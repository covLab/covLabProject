package member.controller;

import java.io.IOException;

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
 * Servlet implementation class LoginServelt
 */
@WebServlet("/login")
public class LoginServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          request.setCharacterEncoding("utf-8");
		
	
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");

		//String  cryptoUserpwd = null;
//				try {
//					MessageDigest md = MessageDigest.getInstance("SHA-512");
//					
//					byte[] pwdValues = userpwd.getBytes(Charset.forName("UTF-8"));
//					
//					md.update(pwdValues);
//				
//					cryptoUserpwd = Base64.getEncoder().encodeToString(pwdValues);
//		
//					System.out.println(cryptoUserpwd);
//					System.out.println(cryptoUserpwd.length());
//					
//				} catch (NoSuchAlgorithmException e) {
//					e.printStackTrace();
//				}
		
		
		Member member = new MemberService().selectLogin(userid, userpw);
		
		
		if(member != null && member.getUserGrade().equals("U")) { //로그인 성공
			
			HttpSession session = request.getSession();
			System.out.println("생성된 세션 객체의 id : "
					+ session.getId());
			
			
			session.setAttribute("loginMember", member);
			
			//로그인 성공시 내보낼 페이지 지정
			response.sendRedirect("/semi/index.jsp");
			
		}else { //로그인 실패
			
			RequestDispatcher view = 
					request.getRequestDispatcher(
							"views/common/error.jsp");
			
			
			if(member != null 
					&& member.getUserGrade().equals("A")) {
				request.setAttribute("message", 
						"로그인 제한된 회원입니다. 관리자에게 문의하세요.");
			}
			
			if(member == null) {
				request.setAttribute("message", 
					"로그인 실패! 아이디 또는 암호를 다시 확인하고 로그인하세요.");
			}
			
			
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
