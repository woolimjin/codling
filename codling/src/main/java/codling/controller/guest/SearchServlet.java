package codling.controller.guest;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.CorporationDao;
import codling.dao.InformationDao;
import codling.identity.Announcement;
import codling.identity.Field;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String indiId = (String) session.getAttribute("indiId");
		String corpId = (String) session.getAttribute("corpId");

		InformationDao infoDao = new InformationDao();
		if (indiId != null) {
			Map<String, String> map = infoDao.getIndiName(indiId);
			String indiName = map.get(indiId);
			request.setAttribute("indiName", indiName);
		} else if (corpId != null) {
			Map<String, String> map = infoDao.getCorpName(corpId);
			String corpName = map.get(corpId);
			request.setAttribute("corpName", corpName);
		}

		String search = request.getParameter("search");
		String[] zone_ = request.getParameterValues("zone");
		String[] career_ = request.getParameterValues("career");
		String[] task_ = request.getParameterValues("task");
		String zone = "";
		String careers = "";
		String task = "";

		if (zone_ != null) {
			for (int i = 0; i < zone_.length; i++) {
				if (i != zone_.length - 1)
					zone += (zone_[i] + "|");
				else
					zone += zone_[i];
			}
		} else
			zone = "[가-힇]|[a-z]|[0-9]";

		if (career_ != null) {
			for (int i = 0; i < career_.length; i++) {
				if (i != career_.length - 1) {
					if (career_[i].equals("경력") || career_[i] == "경력")
						careers += "[0-9]";
					else
						careers += (career_[i] + "|");
				} else {
					if (career_[i].equals("경력") || career_[i] == "경력")
						careers += "[0-9]";
					else
						careers += career_[i];
				}
			}
		} else
			careers = "[가-힇]|[a-z]|[0-9]";

		if (task_ != null) {
			for (int i = 0; i < task_.length; i++) {
				if (i != task_.length - 1)
					task += (task_[i] + "|");
				else
					task += task_[i];
			}
		} else
			task = "[가-힇]|[a-z]|[0-9]";

		CorporationDao corpDao = new CorporationDao();
		ArrayList<Field> filed = corpDao.getTask();
		ArrayList<Announcement> announcement = corpDao.getSearch(search, zone, careers, task);

		request.setAttribute("zone", zone_);
		request.setAttribute("career", career_);
		request.setAttribute("task", task_);
		request.setAttribute("search", search);
		request.setAttribute("filed", filed);
		request.setAttribute("announcement", announcement);
		request.getRequestDispatcher("/WEB-INF/guest/search.jsp").forward(request, response);
	}
}