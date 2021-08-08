package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 * Servlet implementation class UserDeleteServlet
 */
@WebServlet("/duser")
public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String userid = request.getParameter("userid");
            String userpwd = request.getParameter("userpwd");
		
            String cryptoUserpwd = null;
    		try {
    			MessageDigest md = 
    					MessageDigest.getInstance("SHA-512");
    			
    			byte[] pwdValues = 
    					userpwd.getBytes(Charset.forName("UTF-8"));
    		
    			md.update(pwdValues);
    			
    			cryptoUserpwd = Base64.getEncoder()
    							.encodeToString(pwdValues);
    			//확인
    			System.out.println(cryptoUserpwd);
    			System.out.println(cryptoUserpwd.length());
    		} catch (NoSuchAlgorithmException e) {
    			e.printStackTrace();
    		}
    		
    		
    		
		int result = new MemberService().deleteMember(userid , cryptoUserpwd); 
		   System.out.println(userid);
	       System.out.println(userpwd);
	    
		if(result > 0) {
			//회원 정보 삭제 성공하면, 자동 로그아웃되게 함
			response.sendRedirect("/semi/logout");

		
			   
		

			 
		}else {
			RequestDispatcher view = 
					request.getRequestDispatcher(
							"views/common/error.jsp");
			request.setAttribute("message", 
					userid + "님, 회원 탈퇴 실패! 비밀번호가 틀렸습니다.");
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
