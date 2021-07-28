package board.comments.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.comments.model.service.CommentsService;
import board.comments.model.vo.Comments;

/**
 * Servlet implementation class CommentsReplyUpdateServlet
 */
@WebServlet("/cupdate")
public class CommentsUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentsUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		Comments comments = new Comments();
		
		comments.setComNo(Integer.parseInt(request.getParameter("comNo")));
		comments.setComContent(request.getParameter("content"));
		comments.setBoardRef(Integer.parseInt(request.getParameter("boardRef")));
		
		int currentPage = Integer.parseInt(request.getParameter("page"));
		
		System.out.println("cupdate : "+comments);
		int result = new CommentsService().updateComments(comments);
		
		if(result > 0) {
			response.sendRedirect("bdetail?bno="+comments.getBoardRef()+"&page="+currentPage);
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", comments.getBoardRef()+"번 글 "+comments.getComNo()+"번 댓글 수정 실패...");
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
