package codling.controller.guest;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.InformationDao;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/guest/logIn.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String indiId = request.getParameter("perId");
		String corpId = request.getParameter("comId");
		
		String indiPw = request.getParameter("perPassword");
		String corpPw = request.getParameter("comPassword");
		
		InformationDao dao = new InformationDao();
		
		HttpSession session = request.getSession();
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String password = "";
		String name = "";
		if(indiId != null) {
			password = dao.getIndiPassword(indiId);
			if(indiPw.equals(password)) {
				session.setAttribute("indiId", indiId);
				
				name = dao.getIndividualName(indiId);
				out.print("<script>alert('" + name + "님 환영합니다.'); location.href = 'index';</script>");
			} else {
				out.print("<script>alert('아이디 또는 비밀번호를 확인해 주세요.'); history.back();</script>");
			}
		} else if(corpId != null) {
			password = dao.getCorpPassword(corpId);
			if(corpPw.equals(password)) {
				session.setAttribute("corpId", corpId);
				
				name = dao.getCorporationName(corpId);
				out.print("<script>alert('" + name + "님 환영합니다.'); location.href = 'index';</script>");
			} else {
				out.print("<script>alert('아이디 또는 비밀번호를 확인해 주세요.'); history.back();</script>");
			}
		} else {
			out.print("<script>alert('아이디 또는 비밀번호를 확인해 주세요.'); history.back();</script>");
		}
	}
}