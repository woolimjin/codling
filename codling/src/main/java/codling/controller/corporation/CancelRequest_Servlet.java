package codling.controller.corporation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.CorporationDao;
import codling.dao.InformationDao;
import codling.identity.Corporation;

@WebServlet("/cancelRequest")
public class CancelRequest_Servlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String corpId = (String)session.getAttribute("corpId");
		String id = corpId;
		int no = Integer.parseInt(request.getParameter("no"));
		
		InformationDao infoDao = new InformationDao();
		CorporationDao corporDao = new CorporationDao();
		if(corpId != null) {
			Map<String, String> map = infoDao.getCorpName(corpId);
			String corpName = map.get(corpId);
			request.setAttribute("name", corpName);
		}
		
		request.setAttribute("no", no);
		request.getRequestDispatcher("/WEB-INF/corporation/cancelRequest_utf.jsp").forward(request, response);
	}
	
//	@Override
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		HttpSession session = request.getSession();
//		String id = (String)session.getAttribute("corpId");
//		
//		InformationDao dao = new InformationDao();
//		boolean result = dao.deleteCorporation(id);
//		
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html; charset=UTF-8");
//		PrintWriter out = response.getWriter();
//		if(result) {
//			out.print("<script>alert('회원탈퇴가 완료되었습니다.');location.href='index';</script>");
//			out.flush();
//			session.invalidate();
//		} else {
//			out.print("<script>alert('회원탈퇴에 실패하였습니다.');location.href='corporationInfo';</script>");
//			out.flush();
//		}
//	}
}