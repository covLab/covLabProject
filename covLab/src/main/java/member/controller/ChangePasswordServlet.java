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
import member.model.vo.Member;

/**
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/cpassword")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		
		// 비밀번호 변경
        Member member = new Member();
		
		String userid =request.getParameter("userid");
		//System.out.println("변경?"+userid);
		//member.setUserPwd(request.getParameter("nuserpw"));
       // String temp = request.getParameter("temp");
		String nuserpw = request.getParameter("nuserpw");
		System.out.println("비밀번호?"+nuserpw);
		String cryptoUserpw = null;
		try {
			MessageDigest md = 
					MessageDigest.getInstance("SHA-512");
		
			byte[] pwValues = 
					nuserpw.getBytes(Charset.forName("UTF-8"));
			
			md.update(pwValues);
			
			cryptoUserpw = Base64.getEncoder()
							.encodeToString(pwValues);
		
			System.out.println(cryptoUserpw);
			System.out.println(cryptoUserpw.length());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		member.setUserPw(cryptoUserpw);
		int result = new MemberService().updatePw(cryptoUserpw ,userid);
		System.out.println("변경?"+cryptoUserpw);
		if(result >0 ) {
			response.sendRedirect("/semi/index.jsp");
			
//			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
//			request.setAttribute("cryptoUserpw", 
//					cryptoUserpw);
//			view.forward(request, response);
//			 System.out.println("최종변경?"+cryptoUserpw);
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
