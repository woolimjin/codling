package codling.controller.corporation;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import codling.dao.CorporationDao;
import codling.identity.Corporation;

@MultipartConfig(
		fileSizeThreshold = 1024*1024,
		maxFileSize = 1024*1024*50,
		maxRequestSize = 1024*1024*50*5 
	)

@WebServlet("/corporation_modify")
public class Corporation_modifyServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("corpId");
		String corporateName = (String)session.getAttribute("corpcorporateName");
		
		
		// id값으로 기업회원 정보 가져오기
		CorporationDao dao = new CorporationDao();
		Corporation corporation = dao.getCorporation(id);
		
		request.setAttribute("corporation", corporation);
		request.getRequestDispatcher("/WEB-INF/corporation/corporation_modify.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("corpId");
		
		CorporationDao dao = new CorporationDao();
		Corporation corporations = dao.getCorporation(id);
		
		//form에서 가져온 값 DB에 넣기 
		String password = request.getParameter("pw");
		String corporateName = request.getParameter("companyName");
		String corporatePhone = "010" + request.getParameter("corporatePhone");
		String ceoName = request.getParameter("ceoName");
		String corporateNumber = request.getParameter("companyNum");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		
		String de_password = corporations.getPassword();
		String de_fileName = corporations.getFileName();
		String de_logo_fileName = corporations.getLogo_fileName();
		
		//증빙서류 첨부파일
		Collection<Part> parts = request.getParts(); //파일 열러개 검사
		String fileName = "";
		for(Part p : parts) { //파일 여러개 가지고오기
			
			if(!p.getName().equals("fileName")) continue;
			if(p.getSize() == 0) continue;
			
			Part filePart = p; // 업로드한 파일 가지고오기
			fileName = filePart.getSubmittedFileName(); //파일명 읽어오기
			
			InputStream fis = filePart.getInputStream();
			
			String realPath = request.getServletContext().getRealPath("/upload");
			
			File path = new File(realPath);
			if(!path.exists())
				path.mkdirs();
			
			String filePath = realPath + File.separator + fileName;
			FileOutputStream fos = new FileOutputStream(filePath);
			
			byte[] buf = new byte[1024];
			int fileSize_;
			while((fileSize_ = fis.read(buf)) != -1)
				fos.write(buf,0,fileSize_);
			
			fos.close();
			fis.close();
			
		}
		
		//회사 로고 이미지
		Collection<Part> partsimg = request.getParts(); //파일 열러개 검사
		String logo_fileName = "";
		for(Part p : partsimg) { //파일 여러개 가지고오기
			
			if(!p.getName().equals("logo_fileName")) continue;
			if(p.getSize() == 0) continue;
			
			Part filePart = p; // 업로드한 파일 가지고오기
			logo_fileName = filePart.getSubmittedFileName(); //파일명 읽어오기
			
			InputStream fis = filePart.getInputStream();
			
			String realPath = request.getServletContext().getRealPath("/upload");
			
			File path = new File(realPath);
			if(!path.exists())
				path.mkdirs();
			
			String filePath = realPath + File.separator + logo_fileName;
			FileOutputStream fos = new FileOutputStream(filePath);
			
			byte[] buf = new byte[1024];
			int fileSize_;
			while((fileSize_ = fis.read(buf)) != -1)
				fos.write(buf,0,fileSize_);
			
			fos.close();
			fis.close();
			
		}
		if(password.equals("") || password == null) password = de_password;
		
		if(fileName.equals("") || fileName == null) fileName = de_fileName;
		
		if(logo_fileName.equals("") || logo_fileName == null) logo_fileName = de_logo_fileName;
		
		Corporation corporation = new Corporation(id, password, corporateName, corporatePhone, ceoName, corporateNumber, fileName, logo_fileName, address, detailAddress);
		
		boolean result = dao.updateCorporation(corporation);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if (result)
			out.print("<script>alert('내 정보 수정에 성공하였습니다.'); location.href = 'corporationInfo';</script>");
		else
			out.print("<script>alert('이력서 수정에 실패하였습니다\\n이력서 제목 또는 학력사항 스택을 확인해주세요.'); location.href = 'corporation_modify';</script>");
	}
}
