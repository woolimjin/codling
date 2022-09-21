package codling.controller.corporation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.CorporationDao;
import codling.dao.IndividualDao;
import codling.dao.InformationDao;
import codling.identity.Announcement;
import codling.identity.Apply;
import codling.identity.Corporation;
import codling.identity.CoverLetter;
import codling.identity.Field;
import codling.identity.Individual;
import codling.identity.JobOpening;

@WebServlet("/jobOpening")
public class JobOpeningServlet extends HttpServlet {
	String indiId;
	IndividualDao indiDao;
	int no;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		indiId = (String)session.getAttribute("indiId");
		String corpId = (String)session.getAttribute("corpId");
		
		InformationDao infoDao = new InformationDao();
		if(indiId != null) {
			Map<String, String> map = infoDao.getIndiName(indiId);
			String indiName = map.get(indiId);
			request.setAttribute("indiName", indiName);
			
			indiDao = new IndividualDao();
			List<CoverLetter> coverLetters = indiDao.getAllCoverLetter(indiId);
			request.setAttribute("coverLetters", coverLetters);
		} else if(corpId != null) {
			Map<String, String> map = infoDao.getCorpName(corpId);
			String corpName = map.get(corpId);
			request.setAttribute("corpName", corpName);
		}
		String no_ = request.getParameter("no");
		if(!no_.equals("") && no_ != null) no = Integer.parseInt(no_);
		
		CorporationDao dao = new CorporationDao();
		dao.count(no);
		JobOpening jobOpening = dao.getJobOpening(no);
		List<Field> fields = dao.getAllField(no);
		
		String id = jobOpening.getCorporation_id();
		Corporation corporation = dao.getCorporation(id);
		ArrayList<Announcement> allJobOpenings = dao.getAllJobOpenings();
		ArrayList<Announcement> allJobOpeningtwo = dao.getAllJobOpenings();
		
		request.setAttribute("no", no_);
		request.setAttribute("allJobOpeningtwo", allJobOpeningtwo);
		request.setAttribute("allJobOpenings", allJobOpenings);
		request.setAttribute("corporation", corporation);
		request.setAttribute("jobOpening", jobOpening);
		request.setAttribute("fields", fields);
		request.setAttribute("replaceChar", "\n"); // 줄바꿈 <br>처리를 위해
		
		request.getRequestDispatcher("/WEB-INF/corporation/jobOpening.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		Individual individual = indiDao.getIndividual(indiId);
		if(individual.getResumeTitle() == null || individual.getResumeTitle().equals("")) {
			out.print("<script>alert('작성하신 이력서가 없습니다.\\n이력서 작성 후 지원해 주시기 바랍니다.'); location.href = 'jobOpening?no=" + no + "';</script>");
			return;
		}
		
		int coverLetterNo = 0;
		String coverLetterNo_ = request.getParameter("coverLetterNo");
		if(coverLetterNo_ != null && !coverLetterNo_.equals("")) coverLetterNo = Integer.parseInt(coverLetterNo_);
		
		int fieldNo = 0;
		String fieldNo_ = request.getParameter("fieldName");
		if(fieldNo_ != null && !fieldNo_.equals("")) fieldNo = Integer.parseInt(fieldNo_);
		
		Apply apply = new Apply(0, indiId, no, fieldNo, coverLetterNo, "");
		boolean applyResult = indiDao.insertApply(apply);
		
		if(applyResult) {
			out.print("<script>alert('공고 지원이 완료되었습니다. 좋은 결과를 기원합니다.'); location.href='jobOpening?no=" + no + "';</script>");
		} else {
			out.print("<script>alert('공고 지원이 실패하였습니다.'); location.href='jobOpening';</script>");
		}
	}

}
