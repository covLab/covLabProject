@@ -1,78 +0,0 @@
package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;

/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/bdetail")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardDetailServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// �Խñ� �󼼺��� ó���� ��Ʈ�ѷ�
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		// ������ ó���� ���� ����
		int currentPage = 1;
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}

		// ���� ��ü �޼ҵ� �����ϰ� ����ޱ�
		BoardService bservice = new BoardService();

		// �ش� �ۿ� ���� ��ȸ�� 1���� : update
		bservice.addReadCount(boardNo);

		// �ش� �Խñ� ���� ���� : select
		Board board = bservice.selectBoard(boardNo);

		RequestDispatcher view = null;
		if (board != null) {
			view = request.getRequestDispatcher("views/board/boardDetailView.jsp");
			request.setAttribute("board", board);
			request.setAttribute("currentPage", currentPage);
			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", boardNo + "�� �Խñ� ����ȸ ����...");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}