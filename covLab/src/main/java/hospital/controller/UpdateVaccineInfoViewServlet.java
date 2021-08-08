package hospital.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.model.service.HospitalService;
import hospital.model.vo.VaccineInfo;

/**
 * Servlet implementation class UpdateVaccineInfoViewServlet
 */
@WebServlet("/upvcinfoview")
public class UpdateVaccineInfoViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateVaccineInfoViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String vname = request.getParameter("vname");
		VaccineInfo vi = new HospitalService().selectVaccineInfo(vname);
		
		RequestDispatcher view = null;
		if(vi != null) {
			view = request.getRequestDispatcher("views/hospital/vaccineInfoUpdateView.jsp");
			request.setAttribute("vi", vi);
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher("views/board/boardError.jsp");
			request.setAttribute("message", vname+" 백신 정보 수정 실패..");
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
