package codling.controller.corporation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.CorporationDao;
import codling.identity.Announcement;
import codling.identity.Corporation;
import codling.identity.Field;
import codling.identity.JobOpening;

@WebServlet("/job_accountment")
public class Job_accountmentServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("corpId");
		
		CorporationDao corpDao = new CorporationDao();
		
		String no_ = request.getParameter("no");
		int no = 0;
		if(no_ != null && !no_.equals("")) no = Integer.parseInt(no_);
		Corporation corporation = corpDao.getCorporation(id);
		JobOpening jobOpening = corpDao.getJobOpening(no);
		List<Field> fields = corpDao.getAllField(no);
		ArrayList<Announcement> allJobOpenings = corpDao.getAllJobOpenings();
		
		request.setAttribute("allJobOpenings", allJobOpenings);
		request.setAttribute("no", no_);
		request.setAttribute("corporation", corporation);
		request.setAttribute("jobOpening", jobOpening);
		request.setAttribute("fields", fields);
		request.setAttribute("replaceChar", "\n"); // 줄바꿈 <br>처리를 위해
		
		request.getRequestDispatcher("/WEB-INF/corporation/job_accountment.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		CorporationDao corpDao = new CorporationDao();
		int no = Integer.parseInt(request.getParameter("no"));
		int number_ = corpDao.getadvertisement_max();
		boolean result = false;
		JobOpening jobOpening = corpDao.getJobOpening(no);
		int re_number = jobOpening.getAdvertisement();
		if(number_ >= (re_number + 6)) {
			int number = 1 + number_;
			result = corpDao.advertisement_upload(number, no);
		}else if(re_number == 0) {
			int number = 1 + number_;
			result = corpDao.advertisement_upload(number, no);
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if (result)
			out.print("<script>alert('공고 업로드에 성공하였습니다.'); location.href = 'jobOpening_management';</script>");
		else
			out.print("<script>alert('공고 업로드에 실패하였습니다\\n공고를 연속해서 업로드 할 수 없습니다.'); location.href = 'job_accountment?no=" +no+ "';</script>");
	}
}
