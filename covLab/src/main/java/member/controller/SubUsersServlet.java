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
import member.model.vo.Member;
import member.model.vo.Profile;

/**
 * Servlet implementation class SubUsersServlet
 */
@WebServlet("/subusers")
public class SubUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubUsersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_no = request.getParameter("user_no");
		ArrayList<Profile> list= new MemberService().subSelectList(Integer.parseInt(user_no));
		
		RequestDispatcher view = null;
		if(list.size() >= 0) {
			view = request.getRequestDispatcher(
					"views/member/subUsers.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher(
					"views/common/error.jsp");
			request.setAttribute("message", "회원 전체 조회 실패");
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
