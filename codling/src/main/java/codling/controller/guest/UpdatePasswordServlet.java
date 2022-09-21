package codling.controller.guest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import codling.dao.InformationDao;

@WebServlet("/updatePassword")
public class UpdatePasswordServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String position = request.getParameter("position");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		InformationDao infoDao = new InformationDao();
		
		boolean result = false;
		
		if(position.equals("individual")) {
			result = infoDao.updateIndiPassword(id, password);
		} else if(position.equals("corporation")) {
			result = infoDao.updateCorpPassword(id, password);
		}
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result) {
			out.print("<script>alert('비밀번호가 변경되었습니다.'); location.href = 'index';</script>");
		} else {
			out.print("<script>alert('비밀번호 변경에 실패하였습니다.'); location.href = 'find_account';</script>");
		}
	}
}