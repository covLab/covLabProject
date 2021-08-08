package member.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.servcie.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class EnrollServlet
 */
@WebServlet("/enroll")
public class EnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
        request.setCharacterEncoding("utf-8");
		
	
		Member member = new Member();
		
		member.setUserId(request.getParameter("userid"));
		member.setUserName(request.getParameter("username"));
		//member.setUserPwd(request.getParameter("userpwd"));
		member.setUserRn(request.getParameter("userrn"));
		member.setUserEmail(request.getParameter("email"));
		member.setUserPhone(request.getParameter("phone"));
		member.setUserAddress(request.getParameter("address"));
		member.setSmsAgr(request.getParameter("smsagr"));
	
		
		String userpw = request.getParameter("userpw");
		
		String cryptoUserpw = null;
		try {
			MessageDigest md = 
					MessageDigest.getInstance("SHA-512");
		
			byte[] pwValues = 
					userpw.getBytes(Charset.forName("UTF-8"));
			
			md.update(pwValues);
			
			cryptoUserpw = Base64.getEncoder()
							.encodeToString(pwValues);
		
			System.out.println(cryptoUserpw);
			System.out.println(cryptoUserpw.length());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		member.setUserPw(cryptoUserpw);
		//--------------------------------------------------------
		
		
		int result = new MemberService().insertMember(member);
		
	
		if(result > 0) {
			
			response.sendRedirect("/semi/index.jsp");
		}else {
			
			RequestDispatcher view = 
					request.getRequestDispatcher("views/common/error.jsp");
			
			
			request.setAttribute("message", "회원 가입 실패!");
			
			
			view.forward(request, response);
		}
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
