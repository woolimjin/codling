package codling.controller.guest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import codling.dao.InformationDao;

@WebServlet("/indi_findPassword")
public class Indi_findPasswordServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/guest/indi_findPassword.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		
		InformationDao infoDao = new InformationDao();
		
		boolean result = infoDao.findIndiPassword(id, email);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result) {
			request.setAttribute("position", "individual");
			request.setAttribute("id", id);
			
			request.getRequestDispatcher("/WEB-INF/guest/updatePassword.jsp").forward(request, response);
		} else {
			out.print("<script>alert('가입이 되어있지 않은 회원입니다.\\n아이디와 이메일을 다시 확인해 주세요.'); location.href='indi_findPassword';</script>");
		}
	}
}