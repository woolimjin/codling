package codling.controller.individual;

import java.io.IOException;
import java.io.PrintWriter;
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
import codling.identity.Apply;
import codling.identity.Career;
import codling.identity.CoverLetter;
import codling.identity.Education;
import codling.identity.Individual;
import codling.identity.License;
import codling.identity.Portfolio;

@WebServlet("/resume_preview")
public class Resume_previewServlet extends HttpServlet {
	int no; // 지원no
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		InformationDao infoDao = new InformationDao();
		IndividualDao indiDao = new IndividualDao();
		CorporationDao corpDao = new CorporationDao();
		String name = ""; // 회원 이름
		
		if(session.getAttribute("indiId") != null) {
			String id = (String)session.getAttribute("indiId");
			name = infoDao.getIndividualName(id);
		} else if(session.getAttribute("corpId") != null) {
			String id = (String)session.getAttribute("corpId");
			name = infoDao.getCorporationName(id);
		}
		
		
		String id = request.getParameter("id"); // 개인회원 id
		String c_no = request.getParameter("coverLetter_no");
		int coverLetter_no = -1;
		if(c_no != null && !c_no.equals("")) coverLetter_no = Integer.parseInt(c_no);
		
		Map<String, String> map = infoDao.getIndiName(id);
		Individual individual = indiDao.getIndividual(id);
		Education education = indiDao.getEducation(id);
		Career career = indiDao.getCareer(id);
		License license = indiDao.getLicense(id);
		Portfolio portfolio = indiDao.getportfolio(id);
		Portfolio fileupload = indiDao.getfileupload(id);
		String escape = "\r\n" ;
		List<CoverLetter> coverLetter = indiDao.getCoverLetter(id);
		List<Apply> apply = indiDao.getApply(id);
		
		// 지원상태 (미열람 -> 열람)
		String no_ = request.getParameter("no");
		if(no_ != null && !no_.equals("")) no = Integer.parseInt(no_);
		String status = request.getParameter("status"); // 지원상태(미열람, 열람, 수락, 거절)
		if(status != null && status.equals("미열람")) {
			corpDao.updateStatus(no, "열람");
		}
		
		request.setAttribute("coverLetter_no", coverLetter_no);
		request.setAttribute("apply", apply);
		request.setAttribute("coverLetter", coverLetter);
		request.setAttribute("escape", escape);
		request.setAttribute("fileupload", fileupload);
		request.setAttribute("portfolio", portfolio);
		request.setAttribute("license", license);
		request.setAttribute("career", career);
		request.setAttribute("education", education);
		request.setAttribute("individual", individual);
		request.setAttribute("name", name);	
		request.setAttribute("status", status);

		// resume_preview.jsp로 이동
		request.getRequestDispatcher("/WEB-INF/individual/resume_preview.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("indiId");
		
		CorporationDao corpDao = new CorporationDao();
		int jobOpening_no = corpDao.getJobOpening_no(no);  // 공고no
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String ar = request.getParameter("ar");
		// 이력서 수락(accept)
		if(ar.equals("a")) {
			
			boolean result = corpDao.updateStatus(no, "수락");
			if(result)
				out.print("<script>alert('이력서를 수락하였습니다.');"
						+ "location.href = 'applicant_status?no=" + jobOpening_no + "';</script>");
		
		// 이력서 거절(refuse)
		} else if(ar.equals("r")) { 
			
			boolean result = corpDao.updateStatus(no, "거절");
			if(result)
				out.print("<script>alert('이력서를 거절하였습니다.');"
						+ "location.href = 'applicant_status?no=" + jobOpening_no + "';</script>");
			
		}
	}
}