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
import codling.dao.InformationDao;
import codling.identity.Field;
import codling.identity.JobOpening;

@WebServlet("/jobOpening_update")
public class JobOpening_updateServlet extends HttpServlet {
	int no, prev_fieldSize, curr_fieldSize;
	int[] field_no;
	String[] prev_fieldNames;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("corpId");

		InformationDao infoDao = new InformationDao();
		Map<String, String> map = infoDao.getCorpName(id);
		String name = map.get(id);

		request.setAttribute("name", name);

		String no_ = request.getParameter("no");
		if (no_ != null && !no_.equals(""))
			no = Integer.parseInt(no_);

		CorporationDao corpDao = new CorporationDao();
		JobOpening jobOpening = corpDao.getJobOpening(no);
		List<Field> fields = corpDao.getAllField(no);

		prev_fieldSize = fields.size(); // 수정 전 field 갯수
		field_no = new int[prev_fieldSize];
		prev_fieldNames = new String[prev_fieldSize];
		for (int i = 0; i < fields.size(); i++) {
			field_no[i] = fields.get(i).getNo();
			prev_fieldNames[i] = fields.get(i).getName();
		}

		request.setAttribute("jobOpening", jobOpening);
		request.setAttribute("fields", fields);
		request.setAttribute("replaceChar", "\n"); // 줄바꿈 <br>처리를 위해

		request.getRequestDispatcher("/WEB-INF/corporation/jobOpening_update.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("corpId");

		String title = request.getParameter("title");
		String region = request.getParameter("address");
		String detailRegion = "";
		String detailRegion_ = request.getParameter("detailAddress");
		if (detailRegion_ != null && !detailRegion_.equals(""))
			detailRegion = detailRegion_;
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String process = request.getParameter("process");

		String[] nameList = request.getParameterValues("name");
		String[] careerList = request.getParameterValues("career");
		String[] positionList = request.getParameterValues("position");
		String[] payList = request.getParameterValues("pay");
		String[] workDayList = request.getParameterValues("workday");
		String[] stackList = request.getParameterValues("stack");
		String[] workList = request.getParameterValues("work");
		String[] requirementList = request.getParameterValues("requirement");
		String[] preferenceList = request.getParameterValues("preference");
		
		JobOpening jobOpening = new JobOpening(no, id, title, region, detailRegion, process, startDate, endDate, 0, 0);

		CorporationDao corpDao = new CorporationDao();
		boolean jobOpeningResult = corpDao.updateJobOpening(jobOpening);

		boolean fieldResult = true;
		curr_fieldSize = nameList.length - 1;
		
		for(int i = 0; i < nameList.length - 1; i++) {
			if (i < prev_fieldSize) {
				Field field = new Field(field_no[i], no, nameList[i], careerList[i], positionList[i], payList[i],
						workDayList[i], workList[i], stackList[i], requirementList[i], preferenceList[i]);
				boolean result = corpDao.updateField(field);
				if (!result)
					fieldResult = false;
			}
		}
		
		if (curr_fieldSize <= prev_fieldSize) {
			List<Field> fields = corpDao.getAllField(no);
			List<String> names = new ArrayList<String>();
			for (String name : nameList) {
				names.add(name);
			}

			for (int i = 0; i < fields.size(); i++) {
				if (!names.contains(fields.get(i).getName())) {
					boolean result = corpDao.deleteField(fields.get(i).getName());
				}
			}
		} else if (curr_fieldSize > prev_fieldSize) {
			for(int i = prev_fieldSize ; i < curr_fieldSize; i++) {
				List<Field> fields = new ArrayList<Field>();
				Field field = new Field(0, no, nameList[i], careerList[i], positionList[i], payList[i], workDayList[i], workList[i], stackList[i], requirementList[i], preferenceList[i]);
				fields.add(field);
				boolean result = corpDao.insertField(fields);
				if(!result) fieldResult = false;
			}
		}

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (jobOpeningResult && fieldResult)
			out.print("<script>alert('공고수정이 완료되었습니다.'); location.href = 'job_accountment?no=" + no + "';</script>");
		else
			out.print("<script>alert('공고수정에 실패하였습니다.'); location.href = 'job_accountment?no=" + no + "';</script>");
	}
}