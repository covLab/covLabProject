package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.servcie.MemberService;

/**
 * Servlet implementation class JavaSend
 */
@WebServlet("/searchId.do")
public class JavaSend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JavaSend() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
			Member member = MemberService.searchIdPw(m);
			if(member != null) {
				model.addAttribute("msg", "회원님의 아이디를 이메일로 전송하였습니다.");
				model.addAttribute("loc", "/searchIdPw.do");
				sendEmailID(member.getMId(), member.getMEmail());
			}else {
				model.addAttribute("msg", "일치하는 정보가 없습니다.");
				model.addAttribute("loc", "/searchIdPw.do");
			}
			return "common/msg";
		}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
