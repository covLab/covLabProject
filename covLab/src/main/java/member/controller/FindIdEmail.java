package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.servcie.MemberService;

/**
 * Servlet implementation class FindIdEmail
 */
@WebServlet("/findidemail")
public class FindIdEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
		
		String useremail = request.getParameter("useremail");
		String username = request.getParameter("username");
		String userid= new MemberService().searchUserIdEmail(useremail,username);
		System.out.print(useremail + username);
		
		if(userid != null ) {
			RequestDispatcher view =request.getRequestDispatcher("views/member/findid.jsp");
			request.setAttribute("userid", userid);
			  view.forward(request, response);
			 System.out.println(userid);
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