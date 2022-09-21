package codling.controller.corporation;

import java.io.IOException;
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
import codling.identity.Applicant;
import codling.identity.Career;
import codling.identity.Education;
import codling.identity.Field;
import codling.identity.JobOpening;

@WebServlet("/applicant_status")
public class Applicant_statusServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("corpId");
		
		InformationDao infoDao = new InformationDao();
		Map<String, String> map = infoDao.getCorpName(id);
		String name = map.get(id);
		request.setAttribute("name", name);
		
		// parameter로 전달받은 no
		int no = 0;
		String no_ = request.getParameter("no");
		if(no_ != null && !no_.equals("")) no = Integer.parseInt(no_);
		
		CorporationDao corpDao = new CorporationDao();
		IndividualDao indiDao = new IndividualDao();
		// 공고 현황
		JobOpening jobOpening = corpDao.getJobOpening(no); // 공고no에 맞는 공고
		List<Field> fields = corpDao.getAllField(no);      // 공고no에 맞는 분야들
		
		request.setAttribute("fields", fields);
		request.setAttribute("jobOpening", jobOpening);
		
		
		// 지원자 현황
		List<Applicant> applicants = corpDao.getApplicant(no);
		List<Education> educations = null;
		List<Career> careers = null;
		String individual_id = "";

		for(int i = 0; i < applicants.size(); i++) {
			individual_id = applicants.get(i).getId();
			
			// 지원자 학력
			educations = indiDao.getEducations(individual_id);
			// 지원자 경력
			careers = indiDao.getCareers(individual_id);
			
		}
		

		request.setAttribute("careers", careers);
		request.setAttribute("educations", educations);
		request.setAttribute("applicants", applicants);
		request.getRequestDispatcher("/WEB-INF/corporation/applicant_status.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}