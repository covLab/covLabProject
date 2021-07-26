package board.comments.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		int boardRef = Integer.parseInt(request.getParameter("bno"));
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int comNo = Integer.parseInt(request.getParameter("cno"));
		int cLevel = Integer.parseInt(request.getParameter("clevel"));
		System.out.println(boardRef +", "+currentPage+", "+comNo+", "+cLevel);
		
		
		
		if(new CommentsService().deleteComments(comNo, boardRef, cLevel)>0) {
			response.sendRedirect("/semi/bdetail?bno="+boardRef+"&page="+currentPage);
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
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
