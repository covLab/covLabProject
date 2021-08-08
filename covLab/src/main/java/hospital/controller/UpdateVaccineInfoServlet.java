package hospital.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.model.service.HospitalService;
import hospital.model.vo.VaccineInfo;

/**
 * Servlet implementation class UpdateVaccineInfoServlet
 */
@WebServlet("/updatevcinfo")
public class UpdateVaccineInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateVaccineInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		VaccineInfo vi = new VaccineInfo();
		vi.setVacName(request.getParameter("vname"));
		vi.setMadeByCompany(request.getParameter("vcompany"));
		vi.setMadeInCountry(request.getParameter("vcountry"));
		vi.setMaxIocCount(Integer.parseInt(request.getParameter("maxcnt")));
		vi.setExpDur(request.getParameter("vexp"));
		System.out.println(vi);
		if(new HospitalService().updateVaccineInfo(vi)>0) {
			//response.sendRedirect("vcmanage");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			String str = "";
			str = "<script language='javascript'>";
			str += "opener.window.location.reload();"; // 오프너 새로고침
			str += "self.close();"; // 창닫기
			str += "</script>";
			out.print(str);
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/board/boardError.jsp");
			request.setAttribute("message", vi.getVacName() + " 백신정보 수정 실패..");
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
