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

@WebServlet("/corporationInfo")
public class CorpInfoServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String indiId = (String)session.getAttribute("indiId");
		String corpId = (String)session.getAttribute("corpId");
		String id = corpId;
		
		InformationDao infoDao = new InformationDao();
		if(indiId != null) {
			Map<String, String> map = infoDao.getIndiName(indiId);
			String indiName = map.get(indiId);
			request.setAttribute("indiName", indiName);
		} else if(corpId != null) {
			Map<String, String> map = infoDao.getCorpName(corpId);
			String corpName = map.get(corpId);
			request.setAttribute("corpName", corpName);
		}
		
		CorporationDao dao = new CorporationDao();
		Corporation corporation = dao.getCorporation(id);
		
		request.setAttribute("corporation", corporation);
		request.getRequestDispatcher("/WEB-INF/corporation/corporation_info.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("corpId");
		
		InformationDao dao = new InformationDao();
		boolean result = dao.deleteCorporation(id);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(result) {
			out.print("<script>alert('회원탈퇴가 완료되었습니다.');location.href='index';</script>");
			out.flush();
			session.invalidate();
		} else {
			out.print("<script>alert('회원탈퇴에 실패하였습니다.');location.href='corporationInfo';</script>");
			out.flush();
		}
	}
}