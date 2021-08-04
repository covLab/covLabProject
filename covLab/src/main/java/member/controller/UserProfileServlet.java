package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.servcie.MemberService;
import member.model.vo.Profile;

/**
 * Servlet implementation class UserProfileServlet
 */
 @WebServlet("/uprofile") 
public class UserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		 String user_no = request.getParameter("user_no");
		
		Profile p = new MemberService().profile(userid);
		
		int num = new MemberService().snum(Integer.parseInt(user_no));
		System.out.println(num);
		RequestDispatcher view = null;
		if(p != null) {
			view = request.getRequestDispatcher(
					"views/member/myInfo.jsp");
			request.setAttribute("p", p);
			request.setAttribute("num", num);
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher(
					"views/common/error.jsp");
			request.setAttribute("message", "회원 조회 실패");
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
