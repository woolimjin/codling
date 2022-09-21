package codling.controller.corporation;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import codling.identity.Corporation;
import codling.identity.JobOpening;

import org.apache.commons.codec.binary.Hex;

@WebServlet("/payResult")
public class PayResult_Servlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String corpId = (String)session.getAttribute("corpId");
		String id = corpId;
		int no = Integer.parseInt(request.getParameter("no"));
		
		CorporationDao corpoDao = new CorporationDao();
		InformationDao infoDao = new InformationDao();
		
		if(corpId != null) {
			Map<String, String> map = infoDao.getCorpName(corpId);
			String corpName = map.get(corpId);
			request.setAttribute("name", corpName);
		}
		
	    String authResultCode 	= (String)request.getParameter("AuthResultCode"); 	// 인증결과 : 0000(성공)
	    if(authResultCode == "0000" || authResultCode.equals("0000")) {
		    int number = corpoDao.getadvertisement_max() + 1;
			corpoDao.advertisement_upload(number, no);
	    }
	    String authResultMsg 	= (String)request.getParameter("AuthResultMsg"); 	// 인증결과 메시지
	    String nextAppURL 		= (String)request.getParameter("NextAppURL"); 		// 승인 요청 URL
	    String txTid 			= (String)request.getParameter("TxTid"); 			// 거래 ID
	    String authToken 		= (String)request.getParameter("AuthToken"); 		// 인증 TOKEN
	    String payMethod 		= (String)request.getParameter("PayMethod"); 		// 결제수단
	    String mid 				= (String)request.getParameter("MID"); 				// 상점 아이디
	    String moid 			= (String)request.getParameter("Moid"); 			// 상점 주문번호
	    String amt 				= (String)request.getParameter("Amt"); 				// 결제 금액
	    String reqReserved 		= (String)request.getParameter("ReqReserved"); 		// 상점 예약필드
	    String netCancelURL 	= (String)request.getParameter("NetCancelURL"); 	// 망취소 요청 URL
	    
	    request.setAttribute("netCancelURL", netCancelURL);
	    request.setAttribute("reqReserved", reqReserved);
	    request.setAttribute("amt", amt);
	    request.setAttribute("moid", moid);
	    request.setAttribute("mid", mid);
	    request.setAttribute("payMethod", payMethod);
	    request.setAttribute("payMethod", payMethod);
	    request.setAttribute("authToken", authToken);
	    request.setAttribute("txTid", txTid);
		request.setAttribute("nextAppURL", nextAppURL);
		request.setAttribute("authResultMsg", authResultMsg);
		request.setAttribute("authResultCode", authResultCode);
		
		request.getRequestDispatcher("/WEB-INF/corporation/payResult_utf.jsp").forward(request, response);
	}
	
//	@Override
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		HttpSession session = request.getSession();
//		String id = (String)session.getAttribute("corpId");
//		
//		InformationDao dao = new InformationDao();
//		boolean result = dao.deleteCorporation(id);
//		
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html; charset=UTF-8");
//		PrintWriter out = response.getWriter();
//		if(result) {
//			out.print("<script>alert('회원탈퇴가 완료되었습니다.');location.href='index';</script>");
//			out.flush();
//			session.invalidate();
//		} else {
//			out.print("<script>alert('회원탈퇴에 실패하였습니다.');location.href='corporationInfo';</script>");
//			out.flush();
//		}
//	}
}