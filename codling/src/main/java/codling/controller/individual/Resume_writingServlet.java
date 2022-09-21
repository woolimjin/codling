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
import codling.identity.License;
import codling.identity.Portfolio;

@MultipartConfig(
	fileSizeThreshold = 1024*1024,
	maxFileSize = 1024*1024*50,
	maxRequestSize = 1024*1024*50*5 
)
@WebServlet("/resume_writing")
public class Resume_writingServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String indiId = (String)session.getAttribute("indiId");
		
		InformationDao infoDao = new InformationDao();
		if(indiId != null) {		
			Map<String, String> map = infoDao.getIndiName(indiId);
			String name = map.get(indiId);
			request.setAttribute("name", name);
		}
		// resume_writing.jsp로 이동
		request.getRequestDispatcher("/WEB-INF/individual/resume_writing.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String indiId = (String)session.getAttribute("indiId");
		
		IndividualDao dao = new IndividualDao();
		
		List<Education> educationList = new ArrayList<Education>();
		//학력정보
		String[] school_ = request.getParameterValues("school");
		String[] schoolName_ = request.getParameterValues("schoolName");
		String[] schoolStartDate_ = request.getParameterValues("schoolStartDate");
		String[] schoolEndDate_ = request.getParameterValues("schoolEndDate");
		String[] status_ = request.getParameterValues("status");
		String[] department_ = request.getParameterValues("department");
		String[] score_ = request.getParameterValues("score");
		
		String school = "";
		String schoolName = "";
		String schoolStartDate = "";
		String schoolEndDate = "";
		String status = "";
		String department = "";
		String score = "";
		
		for(int i = 0; i < schoolName_.length-1; i++) {
			if(i != schoolName_.length-2) {
				school += (school_[i] + " / ");
				schoolName += (schoolName_[i] + " / ");
				schoolStartDate += (schoolStartDate_[i] + " / ");
				schoolEndDate += (schoolEndDate_[i] + " / ");
				status += (status_[i] + " / ");
				department += (department_[i] + " / ");
				if(score_[i].equals("") || score_[i] == "") score_[i] = "0";
				score += (score_[i] + " / ");
			}else {
				school += school_[i];
				schoolName += schoolName_[i];
				schoolStartDate += schoolStartDate_[i];
				schoolEndDate += schoolEndDate_[i];
				status += status_[i];
				department += department_[i];
				if(score_[i].equals("") || score_[i] == "") score_[i] = "0";
				score += score_[i];
			}
		}
		
		if(!schoolName.equals("") && schoolName != "") {
			Education education = new Education(0, indiId, school, schoolName, schoolStartDate, schoolEndDate, status, department, score);
			educationList.add(education);
		}

		boolean educationResult = dao.setEducation(educationList);
		
		//resumetitle stack update
		String resumetitle = request.getParameter("resumetitle");
		String stack = request.getParameter("stack");
		boolean resumeTitleStack = dao.upDateResumeTitleStack(resumetitle, stack, indiId);
		
		//경력사항
		Career careerList = null;
		String[] prev_company_ = request.getParameterValues("prev_company");
		String[] tenureStart_ = request.getParameterValues("tenureStart");
		String[] tenureEnd_ = request.getParameterValues("tenureEnd");
		String[] position_ = request.getParameterValues("position");
		String[] company_department_ = request.getParameterValues("company_department");
		String[] work_content_ = request.getParameterValues("work_content");
		
		String prev_company ="";
		String tenureStart ="";
		String tenureEnd ="";
		String position ="";
		String company_department ="";
		String work_content ="";
		
		for(int i = 0; i < prev_company_.length-1; i++) {
			if(i != prev_company_.length-2) {
				
				prev_company += (prev_company_[i] + " / ");
				tenureStart += (tenureStart_[i] + " / ");
				tenureEnd += (tenureEnd_[i] + " / ");
				position += (position_[i] + " / ");
				company_department += (company_department_[i] + " / ");
				work_content += (work_content_[i] + " / ");
			}else {
				prev_company += prev_company_[i];
				tenureStart += tenureStart_[i];
				tenureEnd += tenureEnd_[i];
				position += position_[i];
				company_department += company_department_[i];
				work_content += work_content_[i];
			}
		}
		
		boolean careerResult = false;
		if(!prev_company.equals("") && prev_company != "") {
			careerList = new Career(0, indiId, prev_company, tenureStart, tenureEnd, position, company_department, work_content);
			careerResult = dao.setCareer(careerList);
		}else {
			careerList = new Career(0, indiId, "", "", "", "", "", "");
			careerResult = dao.setCareer(careerList);
		}
		
		//자격증내역
		List<License> licenseList = new ArrayList<License>();
		String[] license_name_ = request.getParameterValues("license_name");
		String[] agency_ = request.getParameterValues("agency");
		String[] pass_ = request.getParameterValues("pass");
		String[] acquireDate_ = request.getParameterValues("acquireDate");
		String license_name = "";
		String agency = "";
		String pass = "";
		String acquireDate = "";
		
		for(int i = 0; i < license_name_.length-1; i++) {
			if(!license_name_[i].equals("") && license_name_[i] != "") {
				if(i != license_name_.length-2) {
					license_name += (license_name_[i] + " / ");
					agency += (agency_[i] + " / ");
					pass += (pass_[i] + " / ");
					acquireDate += (acquireDate_[i] + " / ");
				}else {
					license_name += license_name_[i];
					agency += agency_[i];
					pass += pass_[i];
					acquireDate += acquireDate_[i];
				}
			}
		}
		
		int licenseResult = 0;
		
		if(!license_name.equals("") && license_name != "") {
			License license = new License(0, indiId, license_name, agency, pass, acquireDate);
			licenseList.add(license);
			licenseResult = dao.setLicense(licenseList);
		}else {
			License license = new License(0, indiId, "", "", "", "");
			licenseList.add(license);
			licenseResult = dao.setLicense(licenseList);
		}
		
		//포트폴리오
		Portfolio portfolioList = null;
		
		String[] portfolio_name_ = request.getParameterValues("portfolio_name");
		String[] detail_ = request.getParameterValues("detail");
		String[] url_ = request.getParameterValues("url");
		String portfolio_name = "";
		String detail = "";
		String url = "";
		for(int i = 0; i < portfolio_name_.length-1; i++) {
			if(i != portfolio_name_.length -2) {
				if(portfolio_name_[i].equals("") && portfolio_name_[i] == "") portfolio_name_[i] = "제목 없음";
				portfolio_name += (portfolio_name_[i] + "/");
				if(detail_[i].equals("") && detail_[i] == "") detail_[i] = "상세 내용 없음";
				detail += (detail_[i] + "/");
				url += (url_[i] + "|");
			}else {
				if(portfolio_name_[i].equals("") && portfolio_name_[i] == "") portfolio_name_[i] = "제목 없음";
				portfolio_name += portfolio_name_[i];
				if(detail_[i].equals("") && detail_[i] == "") detail_[i] = "상세 내용 없음";
				detail += detail_[i];
				url += url_[i];
			}
		}
		
		boolean portfolioResult = false;
		if(!url.equals("") && url != "") {
			portfolioList = new Portfolio(0, indiId, portfolio_name, detail, url, "", "", "", "","");
			portfolioResult = dao.setportfolio(portfolioList);
		}else {
			portfolioList = new Portfolio(0, indiId, "", "", "", "", "", "", "","");
			portfolioResult = dao.setportfolio(portfolioList);
		}
		
		//첨부파일
		Portfolio fileuploadList = null;
		Collection<Part> parts = request.getParts(); //파일 열러개 검사
		StringBuilder builder = new StringBuilder();
		StringBuilder builders = new StringBuilder();
		StringBuilder builder_fileaddress = new StringBuilder();
		for(Part p : parts) { //파일 여러개 가지고오기
			
			if(!p.getName().equals("fileName")) continue;
			if(p.getSize() == 0) continue;
			
			Part filePart = p; // 업로드한 파일 가지고오기
			String fileName_ = filePart.getSubmittedFileName(); //파일명 읽어오기
			builder.append(fileName_);
			builder.append("/");
			builders.append(p.getSize());
			builders.append("/");
			
			InputStream fis = filePart.getInputStream();
			
			String realPath = request.getServletContext().getRealPath("/upload");
			
			File path = new File(realPath);
			if(!path.exists())
				path.mkdirs();
			
			String filePath = realPath + File.separator + fileName_;
			FileOutputStream fos = new FileOutputStream(filePath);
			
			builder_fileaddress.append(filePath);
			builder_fileaddress.append("|");
			
			byte[] buf = new byte[1024];
			int fileSize_;
			while((fileSize_ = fis.read(buf)) != -1)
				fos.write(buf,0,fileSize_);
			
			fos.close();
			fis.close();
			
		}
		
		if(builder.toString() != "" && !builder.toString().equals("")) {
			builder.delete(builder.length()-1, builder.length());
			builders.delete(builders.length()-1, builders.length());
			builder_fileaddress.delete(builder_fileaddress.length()-1, builder_fileaddress.length());
		}
		
		String[] fileTitle_ = request.getParameterValues("fileTitle");
		String[] file_detail_ = request.getParameterValues("file_detail");
		String fileTitle = "";
		String file_detail = "";
		
		for(int i = 0; i < fileTitle_.length-1; i++) {
			if(i != fileTitle_.length-2) {
				if(fileTitle_[i].equals("") && fileTitle_[i] == "") fileTitle_[i] = "첨부파일 제목 없음";
				fileTitle += (fileTitle_[i] + "/");
				if(file_detail_[i].equals("") && file_detail_[i] == "") file_detail_[i] = "첨부파일 내용 없음";
				file_detail += (file_detail_[i] + "/");
			}else {
				if(fileTitle_[i].equals("") && fileTitle_[i] == "") fileTitle_[i] = "첨부파일 제목 없음";
				fileTitle += fileTitle_[i];
				if(file_detail_[i].equals("") && file_detail_[i] == "") file_detail_[i] = "첨부파일 내용 없음";
				file_detail += file_detail_[i];
			}
		}
		
		boolean fileuploadResult = false;
		if(!builder.toString().equals("") && builder.toString() != "") {
			fileuploadList = new Portfolio(0, indiId, "", "", "", fileTitle, builder.toString(), builder_fileaddress.toString(), file_detail, builders.toString());
			fileuploadResult = dao.setfile(fileuploadList);
		}else {
			fileuploadList = new Portfolio(0, indiId, "", "", "", "", "", "", "", "");
			fileuploadResult = dao.setfile(fileuploadList);
		}
		
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(educationResult && resumeTitleStack)
			out.print("<script>alert('이력서 등록에 성공하였습니다.'); location.href = 'resume_management';</script>");
		else
			out.print("<script>alert('이력서 등록에 실패하였습니다.\n이력서 제목 또는 학력 스택을 확인해주세요.'); location.href = 'resume_writing';</script>");
		}
	}
