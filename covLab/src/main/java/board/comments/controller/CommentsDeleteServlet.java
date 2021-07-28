package board.comments.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.View;

import board.comments.model.service.CommentsService;

/**
 * Servlet implementation class CommentsDeleteServlet
 */
@WebServlet("/cdelete")
public class CommentsDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentsDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//댓글 삭제
		request.setCharacterEncoding("utf-8");
		
		int comNo = Integer.parseInt(request.getParameter("comNo"));
		System.out.println("comNo : "+comNo);
		int boardRef = Integer.parseInt(request.getParameter("boardRef"));
		System.out.println("boardRef : "+boardRef);
		int currentPage = Integer.parseInt(request.getParameter("page"));
		System.out.println("page : "+currentPage);
		
		CommentsService cservice = new CommentsService();
		int result = cservice.deleteComments(comNo);
		
		
		RequestDispatcher view = null;
		if(result > 0) {
			response.sendRedirect("/semi/bdetail?bno="+boardRef+"&page="+currentPage);
			
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", boardRef+"번 글의 댓글 삭제 실패...");
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
