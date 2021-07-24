@@ -1,62 +0,0 @@
package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardDeleteServlet
 */
@WebServlet("/bdelete")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardDeleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// �Խñ�(����, ���, ����) ���� ó���� ��Ʈ�ѷ�
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		int boardLevel = Integer.parseInt(request.getParameter("level"));

		// ���� �޼ҵ�� ����
		// ���� ����� ������ ��, ���� ������ ���ϵ� ���� ó����
		if (new BoardService().deleteBoard(boardNum, boardLevel) > 0) {
			// ���� ����� ������ ��, ���� ������ ���ϵ� ���� ó����
			String renameFileName = request.getParameter("rfile");
			if (renameFileName != null) {
				String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles");
				new File(savePath + "\\" + renameFileName).delete();
			}
			response.sendRedirect("/first/blist?page=1");
		} else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", boardNum + "�� �� ���� ����..");
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