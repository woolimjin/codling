package codling.controller.individual;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import codling.dao.IndividualDao;
import codling.dao.InformationDao;
import codling.identity.Career;
import codling.identity.Education;
import codling.identity.Individual;
import codling.identity.License;
import codling.identity.Portfolio;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 * 50 * 5)
@WebServlet("/resume_writingmodify")
public class Resume_writingmodifyServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String indiId = (String) session.getAttribute("indiId");

		InformationDao infoDao = new InformationDao();
		IndividualDao indiDao = new IndividualDao();

		if (indiId != null) {
			Map<String, String> map = infoDao.getIndiName(indiId);
			String name = map.get(indiId);
			Individual individual = indiDao.getIndividual(indiId);
			Education education = indiDao.getEducation(indiId);
			Career career = indiDao.getCareer(indiId);
			License license = indiDao.getLicense(indiId);
			Portfolio portfolio = indiDao.getportfolio(indiId);
			Portfolio fileupload = indiDao.getfileupload(indiId);

			request.setAttribute("fileupload", fileupload);
			request.setAttribute("portfolio", portfolio);
			request.setAttribute("license", license);
			request.setAttribute("career", career);
			request.setAttribute("education", education);
			request.setAttribute("individual", individual);
			request.setAttribute("name", name);
		}

		// resume_writing.jsp로 이동
		request.getRequestDispatcher("/WEB-INF/individual/resume_writingmodify.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String indiId = (String) session.getAttribute("indiId");

		IndividualDao dao = new IndividualDao();

		// resumetitle stack update
		String resumetitle = request.getParameter("resumetitle");
		String stack = request.getParameter("stack");
		boolean resumeTitleStack = dao.upDateResumeTitleStack(resumetitle, stack, indiId);

		// 학력정보 update
		Education education_updateList = null;
		String[] school_update_ = request.getParameterValues("school_update");
		String[] schoolName_update_ = request.getParameterValues("schoolName_update");
		String[] schoolStartDate_update_ = request.getParameterValues("schoolStartDate_update");
		String[] schoolEndDate_update_ = request.getParameterValues("schoolEndDate_update");
		String[] status_update_ = request.getParameterValues("status_update");
		String[] department_update_ = request.getParameterValues("department_update");
		String[] score_update_ = request.getParameterValues("score_update");

		String school_update = "";
		String schoolName_update = "";
		String schoolStartDate_update = "";
		String schoolEndDate_update = "";
		String status_update = "";
		String department_update = "";
		String score_update = "";

		for (int i = 0; i < school_update_.length - 1; i++) {
			if (i != school_update_.length - 2) {
				school_update += (school_update_[i] + " / ");
				schoolName_update += (schoolName_update_[i] + "/");
				schoolStartDate_update += (schoolStartDate_update_[i] + " / ");
				schoolEndDate_update += (schoolEndDate_update_[i] + " / ");
				status_update += (status_update_[i] + " / ");
				department_update += (department_update_[i] + "/");
				if (score_update_[i].equals("") || score_update_[i] == "")
					score_update_[i] = "0";
				score_update += (score_update_[i] + " / ");
			} else {
				school_update += school_update_[i];
				schoolName_update += schoolName_update_[i];
				schoolStartDate_update += schoolStartDate_update_[i];
				schoolEndDate_update += schoolEndDate_update_[i];
				status_update += status_update_[i];
				department_update += department_update_[i];
				if (score_update_[i].equals("") || score_update_[i] == "")
					score_update_[i] = "0";
				score_update += score_update_[i];
			}
		}

		boolean education_updateResult = false;
		if (!school_update.equals("") && school_update != "") {
			education_updateList = new Education(0, indiId, school_update, schoolName_update, schoolStartDate_update,
					schoolEndDate_update, status_update, department_update, score_update);
			education_updateResult = dao.education_update(education_updateList);
		}

		// 경력 update
		Career career_updateList = null;
		String[] prev_company_update_ = request.getParameterValues("prev_company_update");
		String[] tenureStart_update_ = request.getParameterValues("tenureStart_update");
		String[] tenureEnd_update_ = request.getParameterValues("tenureEnd_update");
		String[] position_update_ = request.getParameterValues("position_update");
		String[] company_department_update_ = request.getParameterValues("company_department_update");
		String[] work_content_update_ = request.getParameterValues("work_content_update");

		String prev_company_update = "";
		String tenureStart_update = "";
		String tenureEnd_update = "";
		String position_update = "";
		String company_department_update = "";
		String work_content_update = "";

		for (int i = 0; i < prev_company_update_.length - 1; i++) {
			if (!prev_company_update_[i].equals("") && prev_company_update_[i] != "") {
				if (i != prev_company_update_.length - 2) {
					prev_company_update += (prev_company_update_[i] + "/");
					tenureStart_update += (tenureStart_update_[i] + " / ");
					tenureEnd_update += (tenureEnd_update_[i] + " / ");
					position_update += (position_update_[i] + "/");
					company_department_update += (company_department_update_[i] + "/");
					work_content_update += (work_content_update_[i] + "/");
				} else {
					prev_company_update += prev_company_update_[i];
					tenureStart_update += tenureStart_update_[i];
					tenureEnd_update += tenureEnd_update_[i];
					position_update += position_update_[i];
					company_department_update += company_department_update_[i];
					work_content_update += work_content_update_[i];
				}
			}
		}

		boolean career_updateResult = false;
		if (!prev_company_update.equals("") && prev_company_update != "") {
			career_updateList = new Career(0, indiId, prev_company_update, tenureStart_update, tenureEnd_update,
					position_update, company_department_update, work_content_update);
			career_updateResult = dao.career_update(career_updateList);
		} else if (prev_company_update.equals("") && prev_company_update == "") {
			career_updateList = new Career(0, indiId, "", "", "", "", "", "");
			career_updateResult = dao.career_update(career_updateList);
		}

		// 자격증 update
		License license_updateList = null;
		String[] license_name_update_ = request.getParameterValues("license_name_update");
		String[] agency_update_ = request.getParameterValues("agency_update");
		String[] pass_update_ = request.getParameterValues("pass_update");
		String[] acquireDate_update_ = request.getParameterValues("acquireDate_update");

		String license_name_update = "";
		String agency_update = "";
		String pass_update = "";
		String acquireDate_update = "";

		for (int i = 0; i < license_name_update_.length - 1; i++) {
			if (!license_name_update_[i].equals("") && license_name_update_[i] != "") {
				if (i != license_name_update_.length - 2) {
					license_name_update += (license_name_update_[i] + " / ");
					agency_update += (agency_update_[i] + " / ");
					pass_update += (pass_update_[i] + " / ");
					acquireDate_update += (acquireDate_update_[i] + " / ");
				} else {
					license_name_update += license_name_update_[i];
					agency_update += agency_update_[i];
					pass_update += pass_update_[i];
					acquireDate_update += acquireDate_update_[i];
				}
			}
		}
		boolean license_updateResult = false;
		if (!license_name_update.equals("") && license_name_update != "") {
			license_updateList = new License(0, indiId, license_name_update, agency_update, pass_update,
					acquireDate_update);
			license_updateResult = dao.license_update(license_updateList);
		} else if (license_name_update.equals("") && license_name_update == "") {
			license_updateList = new License(0, indiId, "", "", "", "");
			license_updateResult = dao.license_update(license_updateList);
		}

		// 포트폴리오 update
		Portfolio portfolio_updateList = null;

		String[] portfolio_name_update_ = request.getParameterValues("portfolio_name_update");
		String[] detail_update_ = request.getParameterValues("detail_update");
		String[] url_update_ = request.getParameterValues("url_update");
		String portfolio_name_update = "";
		String detail_update = "";
		String url_update = "";
		for (int i = 0; i < portfolio_name_update_.length - 1; i++) {
			if (i != portfolio_name_update_.length - 2) {
				if (portfolio_name_update_[i].equals("") && portfolio_name_update_[i] == "")
					portfolio_name_update_[i] = "제목 없음.";
				portfolio_name_update += (portfolio_name_update_[i] + "/");
				if (detail_update_[i].equals("") && detail_update_[i] == "")
					detail_update_[i] = "상세내용 없음.";
				detail_update += (detail_update_[i] + "/");
				url_update += (url_update_[i] + "|");
			} else {
				if (portfolio_name_update_[i].equals("") && portfolio_name_update_[i] == "")
					portfolio_name_update_[i] = "제목 없음.";
				portfolio_name_update += portfolio_name_update_[i];
				if (detail_update_[i].equals("") && detail_update_[i] == "")
					detail_update_[i] = "상세내용 없음.";
				detail_update += detail_update_[i];
				url_update += url_update_[i];
			}
		}

		boolean portfolio_updateResult = false;
		if (!portfolio_name_update.equals("") && portfolio_name_update != "") {
			portfolio_updateList = new Portfolio(0, indiId, portfolio_name_update, detail_update, url_update, "", "",
					"", "", "");
			portfolio_updateResult = dao.portfolio_update(portfolio_updateList);
		} else if (portfolio_name_update.equals("") && portfolio_name_update == "") {
			portfolio_updateList = new Portfolio(0, indiId, "", "", "", "", "", "", "", "");
			portfolio_updateResult = dao.portfolio_update(portfolio_updateList);
		}

		// 첨부파일 update
		Portfolio fileupload_updateList = null;
		Collection<Part> parts = request.getParts(); // 파일 열러개 검사
		StringBuilder builder = new StringBuilder();
		StringBuilder builders = new StringBuilder();
		StringBuilder builder_fileaddress = new StringBuilder();
		for (Part p : parts) { // 파일 여러개 가지고오기

			if (!p.getName().equals("fileName"))
				continue;
			if (p.getSize() == 0)
				continue;

			Part filePart = p; // 업로드한 파일 가지고오기
			String fileName_ = filePart.getSubmittedFileName(); // 파일명 읽어오기
			builder.append(fileName_);
			builder.append("/");
			builders.append(p.getSize());
			builders.append("/");

			InputStream fis = filePart.getInputStream();

			String realPath = request.getServletContext().getRealPath("/upload");

			File path = new File(realPath);
			if (!path.exists())
				path.mkdirs();

			String filePath = realPath + File.separator + fileName_;
			FileOutputStream fos = new FileOutputStream(filePath);

			builder_fileaddress.append(filePath);
			builder_fileaddress.append("|");

			byte[] buf = new byte[1024];
			int fileSize_;
			while ((fileSize_ = fis.read(buf)) != -1)
				fos.write(buf, 0, fileSize_);

			fos.close();
			fis.close();

		}

		if (builder.toString() != "" && !builder.toString().equals("")) {
			builder.delete(builder.length() - 1, builder.length());
			builders.delete(builders.length() - 1, builders.length());
			builder_fileaddress.delete(builder_fileaddress.length() - 1, builder_fileaddress.length());
		}

		String[] fileTitle_ = request.getParameterValues("fileTitle");
		String[] file_detail_ = request.getParameterValues("file_detail");
		String fileTitle = "";
		String file_detail = "";

		for (int i = 0; i < fileTitle_.length - 1; i++) {
			if (i != fileTitle_.length - 2) {
				fileTitle += (fileTitle_[i] + "/");
				file_detail += (file_detail_[i] + "/");
			} else {
				fileTitle += fileTitle_[i];
				file_detail += file_detail_[i];
			}
		}

		String[] fileTitle_update_ = null;
		fileTitle_update_ = request.getParameterValues("fileTitle_update");
		String[] fileName_update_ = request.getParameterValues("fileName_update");
		String[] fileaddress_update_ = request.getParameterValues("fileaddress_update");
		String[] file_detail_update_ = request.getParameterValues("file_detail_update");
		String[] fileSize_update_ = request.getParameterValues("fileSize_update");

		String fileTitle_update = "";
		String fileName_update = "";
		String fileaddress_update = "";
		String file_detail_update = "";
		String fileSize_update = "";

		if (fileTitle_update_ != null) {
			for (int i = 0; i < fileTitle_update_.length; i++) {
				if (i != fileTitle_update_.length - 1) {
					fileTitle_update += (fileTitle_update_[i] + "/");
					fileName_update += (fileName_update_[i] + "/");
					fileaddress_update += (fileaddress_update_[i] + "|");
					file_detail_update += (file_detail_update_[i] + "/");
					fileSize_update += (fileSize_update_[i] + "/");
				} else {
					fileTitle_update += fileTitle_update_[i];
					fileName_update += fileName_update_[i];
					fileaddress_update += fileaddress_update_[i];
					file_detail_update += file_detail_update_[i];
					fileSize_update += fileSize_update_[i];
				}
			}
		}
		if (!fileTitle.equals("") && fileTitle != "" && fileTitle_update_ != null) {
			fileTitle_update += ("/" + fileTitle);
			fileName_update += ("/" + builder.toString());
			fileaddress_update += ("|" + builder_fileaddress.toString());
			file_detail_update += ("/" + file_detail);
			fileSize_update += ("/" + builders.toString());
		} else {
			fileTitle_update += fileTitle;
			fileName_update += builder.toString();
			fileaddress_update += builder_fileaddress.toString();
			file_detail_update += file_detail;
			fileSize_update += builders.toString();
		}

		boolean fileupload_updateResult = false;
		if (!fileTitle_update.equals("") && fileTitle_update != null) {
			fileupload_updateList = new Portfolio(0, indiId, "", "", "", fileTitle_update, fileName_update,
					fileaddress_update, file_detail_update, fileSize_update);
			fileupload_updateResult = dao.fileupload_update(fileupload_updateList);
		} else {
			fileupload_updateList = new Portfolio(0, indiId, "", "", "", "", "", "", "", "");
			fileupload_updateResult = dao.fileupload_update(fileupload_updateList);
		}

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (resumeTitleStack && education_updateResult)
			out.print("<script>alert('이력서 수정에 성공하였습니다.'); location.href = 'resume_management';</script>");
		else
			out.print("<script>alert('이력서 수정에 실패하였습니다\\n이력서 제목 또는 학력사항 스택을 확인해주세요.'); location.href = 'resume_writingmodify';</script>");
	}
}
