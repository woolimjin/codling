package codling.controller.individual;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.IndividualDao;
import codling.dao.InformationDao;
import codling.identity.Individual;

@WebServlet("/individual_modify")
public class Individual_modifyServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String indiId = (String) session.getAttribute("indiId");

		InformationDao infoDao = new InformationDao();
		if (indiId != null) {
			Map<String, String> map = infoDao.getIndiName(indiId);
			String indiName = map.get(indiId);
			request.setAttribute("indiName", indiName);
		}

		// id값으로 기업회원 정보 가져오기
		IndividualDao dao = new IndividualDao();
		Individual individual = dao.getIndividual(indiId);

		request.setAttribute("individual", individual);
		request.getRequestDispatcher("/WEB-INF/individual/individual_modify.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String indiId = (String) session.getAttribute("indiId");
		
		IndividualDao indiDao = new IndividualDao();
		
		// form에서 가져온 값 DB에 넣기
		Individual update_infoList = null;
		
		String password = "";
		
		String id = request.getParameter("id");
		password = request.getParameter("pw");
		if(password == "" && password.equals("")) 
			password = request.getParameter("defualt_password");
		String name = request.getParameter("name");
		String year = request.getParameter("selyear");
		String month = request.getParameter("selmonth");
		String day = request.getParameter("selday");
		String birthday = year + "-" + month + "-" + day;
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phone = "010" + request.getParameter("phone");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		
		boolean update_infoResult = false;
		if(indiId != "" && !indiId.equals(null)) {
			update_infoList = new Individual(id, password, name, birthday, gender, email, phone, address, detailAddress, "", "");
			update_infoResult = indiDao.myinfo_update(update_infoList);
		}
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if (update_infoResult)
			out.print("<script>alert('정보 수정에 성공하였습니다.'); location.href = 'individualInfo';</script>");
		else
			out.print("<script>alert('정보 수정에 실패하였습니다.'); location.href = 'individual_modify';</script>");
		
	}
}
