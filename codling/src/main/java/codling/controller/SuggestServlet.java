package codling.controller;

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import codling.dao.CorporationDao;

@WebServlet("/suggest")
public class SuggestServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String keyword = request.getParameter("keyword");

		CorporationDao dao = new CorporationDao();
		List<String> list = dao.getAllStack(keyword);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print(list.size());
		out.print("|");
		for(int i = 0; i < list.size(); i++) {
			String data = list.get(i);
			out.print(data);
			if(i < list.size() - 1) out.print(",");
		}
	}
}