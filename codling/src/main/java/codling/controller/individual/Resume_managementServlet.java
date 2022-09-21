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

import codling.dao.IndividualDao;
import codling.dao.InformationDao;
import codling.identity.Apply;
import codling.identity.Career;
import codling.identity.CoverLetter;
import codling.identity.Education;
import codling.identity.Individual;
import codling.identity.License;

@WebServlet("/resume_management")
public class Resume_managementServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("indiId");

		// 회원 이름 가져오기
		InformationDao infoDao = new InformationDao();
		Map<String, String> map = infoDao.getIndiName(id);
		String name = map.get(id);
		request.setAttribute("name", name);

		// 지원한 공고
		IndividualDao indiDao = new IndividualDao();
		List<Apply> applys = indiDao.getApply(id);
		request.setAttribute("applys", applys);

		// 이력서 제목 스택, 학력정보, 경력정보, 자격증 - 김태희
		Individual individual = indiDao.getIndividual(id);
		Education education = indiDao.getEducation(id);
		Career career = indiDao.getCareer(id);
		License license = indiDao.getLicense(id);

		request.setAttribute("license", license);
		request.setAttribute("career", career);
		request.setAttribute("individual", individual);
		request.setAttribute("education", education);
		// - 김태희

		// 자기소개서
		List<CoverLetter> coverLetters = indiDao.getCoverLetter(id);
		request.setAttribute("coverLetters", coverLetters);

		request.setAttribute("replacePrevChar", "\r\n"); // 줄바꿈 <br>처리를 위해
		request.setAttribute("replaceCurrChar", "\\n"); // 줄바꿈 <br>처리를 위해
		request.getRequestDispatcher("/WEB-INF/individual/resume_management.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("indiId");

		request.setCharacterEncoding("UTF-8");
		String crud = request.getParameter("crud");
		int no = 0;
		String title, content;

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		CoverLetter coverLetter = null;
		IndividualDao indiDao = new IndividualDao();
		boolean result = false;
		switch (crud) {
		case "c":
			title = request.getParameter("selfTitle");
			content = request.getParameter("selfContent");

			coverLetter = new CoverLetter(0, id, title, content);
			result = indiDao.insertCoverLetter(coverLetter);

			if (result)
				out.print("<script>alert('자기소개서 작성이 완료되었습니다.'); location.href = 'resume_management';</script>");
			else
				out.print("<script>alert('자기소개서 작성이 실패하였습니다.'); location.href = 'resume_management';</script>");
			break;

		case "u":
			String no_ = request.getParameter("coverLetterNo");
			if (no_ != null && !no_.equals(""))
				no = Integer.parseInt(no_);
			title = request.getParameter("selfTitle");
			content = request.getParameter("selfContent");

			coverLetter = new CoverLetter(no, id, title, content);
			result = indiDao.updateCoverLetter(coverLetter);

			if (result)
				out.print("<script>alert('자기소개서 수정이 완료되었습니다.'); location.href = 'resume_management';</script>");
			else
				out.print("<script>alert('자기소개서 수정이 실패하였습니다.'); location.href = 'resume_management';</script>");
			break;

		case "d":
			String no__ = request.getParameter("no");
			if (no__ != null && !no__.equals(""))
				no = Integer.parseInt(no__);

			result = indiDao.deleteCoverLetter(no);

			if (result)
				out.print("<script>alert('자기소개를 삭제하였습니다.'); location.href = 'resume_management';</script>");
			else
				out.print("<script>alert('자기소개서 삭제에 실패하였습니다.'); location.href = 'resume_management';</script>");
			break;
		}
	}
}