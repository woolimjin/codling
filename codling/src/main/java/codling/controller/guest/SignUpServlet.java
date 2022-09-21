package codling.controller.guest;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Collection;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import codling.dao.CorporationDao;
import codling.dao.IndividualDao;
import codling.identity.Corporation;
import codling.identity.Individual;
import codling.identity.Portfolio;

@MultipartConfig(
		fileSizeThreshold = 1024*1024,
		maxFileSize = 1024*1024*50,
		maxRequestSize = 1024*1024*50*5 
	)

@WebServlet("/signUp")
public class SignUpServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/guest/signUp.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		
		String num_ = request.getParameter("num");
		int num = 0;
		
		if(num_ != null && !num_.equals("")) num = Integer.parseInt(num_);
		
		if(num == 1) {  // 개인 회원가입
			
			String iId = request.getParameter("id");
			String iPw = request.getParameter("pw");
			String iName = request.getParameter("name");
			String iBirth = request.getParameter("yy")+request.getParameter("mm")+request.getParameter("dd");
			String iGender = request.getParameter("gender");
			String iEmail = request.getParameter("email");
			String iPhone = request.getParameter("phoneInd1")+request.getParameter("phoneInd2");
			String iAddress = request.getParameter("address");
			String iDetailAddress = request.getParameter("detailAddress");
			Individual individual = new Individual(iId, iPw, iName, iBirth, iGender, iEmail, iPhone, iAddress, iDetailAddress, null, null);
			
			IndividualDao dao = new IndividualDao();
			boolean result = dao.insertIndividual(individual);
			
			PrintWriter out = response.getWriter();
			if(result) {
				out.print("<script>	alert(\"Welcome🍏\");location.href='login';</script>");
				out.flush();
			} else {
				out.print("<script>alert('회원가입에 실패하였습니다. 다시 시도해주세요.');location.href='signUp';</script>");
				out.flush();
			}
			
			
		} else if(num == 2) {  // 기업 회원가입
			String cId = request.getParameter("corId");
			String cPw = request.getParameter("corPw");
			String cPhone = request.getParameter("localNum")+request.getParameter("corptel");
			String cName = request.getParameter("companyName");
			String cCeo = request.getParameter("representative");
			String cNumber = request.getParameter("companyNum");
			String cAddress = request.getParameter("address2");
			String cDetailAddress = request.getParameter("detailAddress2");
			
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
			
			Corporation corporation = new Corporation(cId, cPw, cName, cPhone, cCeo, cNumber, fileName, logo_fileName, cAddress, cDetailAddress);
			
			CorporationDao dao = new CorporationDao();
			boolean result = dao.insertCorporation(corporation);
			PrintWriter out = response.getWriter();
			if(result) {
				out.print("<script>	alert(\"Welcome🍏\");location.href='login';</script>");
				out.flush();
			} else {
				out.print("<script>alert('회원가입에 실패하였습니다. 다시 시도해주세요.');location.href='signUp';</script>");
				out.flush();
			}
		}
	}
}
	
