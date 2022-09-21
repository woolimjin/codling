package codling.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import codling.identity.Announcement;
import codling.identity.Apply;
import codling.identity.Career;
import codling.identity.CoverLetter;
import codling.identity.Education;
import codling.identity.Individual;
import codling.identity.JobOpening;
import codling.identity.License;
import codling.identity.Portfolio;

public class IndividualDao {
	final static String DB_URL = "jdbc:mysql://localhost:3306/codling";
	final static String DB_NAME = "codling";
	final static String DB_PASSWORD = "1234";

	static Connection conn;
	static PreparedStatement pstmt;
	static ResultSet rs;

	protected Connection getConnection() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(DB_URL, DB_NAME, DB_PASSWORD);
		return conn;
	}

	// 개인회원 정보
		public Individual getIndividual(String id) {
			Individual individual = null;
			String query = "SELECT * FROM individual WHERE id = ?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					String password = rs.getString("password");
					String name = rs.getString("name");
					String birth = rs.getString("birth");
					String gender = rs.getString("gender");
					String email = rs.getString("email");
					String phone = rs.getString("phone");
					String address = rs.getString("address");
					String detailAddress = rs.getString("detailAddress");
					String resumeTitle = rs.getString("resumeTitle");
					String stack = rs.getString("stack");
					
					individual = new Individual(id, password, name, birth, gender, email, phone, address, detailAddress, resumeTitle, stack);
					
				}
				
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e) {
				System.out.println("getIndividual Error : " + e.getMessage());
			}
			return individual;
		}

	// 개인회원 회원가입
	public boolean insertIndividual(Individual individual) {
		boolean result = false;
		String query = "INSERT INTO individual VALUES (?,DEFAULT,?,?,?,?,?,?,?,?,DEFAULT,DEFAULT)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, individual.getId());
			pstmt.setString(2, individual.getPassword());
			pstmt.setString(3, individual.getName());
			pstmt.setString(4, individual.getBirth());
			pstmt.setString(5, individual.getGender());
			pstmt.setString(6, individual.getEmail());
			pstmt.setString(7, individual.getPhone());
			pstmt.setString(8, individual.getAddress());
			pstmt.setString(9, individual.getDetailAddress());

			if (pstmt.executeUpdate() == 1)
				result = true;

			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("insertIndividual Error : " + e.getMessage());
		}
		return result;
	}

	// 자기소개서 가져오기
	public List<CoverLetter> getCoverLetter(String individual_id) {
		List<CoverLetter> coverLetterList = new ArrayList<CoverLetter>();
		String query = "SELECT * FROM coverLetter WHERE individual_id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, individual_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String content = rs.getString("content");

				CoverLetter coverLetter = new CoverLetter(no, individual_id, title, content);
				coverLetterList.add(coverLetter);
			}
			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("getCoverLetter Error : " + e.getMessage());
		}
		return coverLetterList;
	}

	// 자기소개서 작성
	public boolean insertCoverLetter(CoverLetter coverLetter) {
		boolean result = false;
		String query = "INSERT INTO coverLetter " + "VALUES(DEFAULT, ?, ?, ?)";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, coverLetter.getIndividual_id());
			pstmt.setString(2, coverLetter.getTitle());
			pstmt.setString(3, coverLetter.getContent());

			if (pstmt.executeUpdate() == 1)
				result = true;

			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("deleteCoverLetter Error : " + e.getMessage());
		}
		return result;
	}
	
	// 자기소개서 전부 가져오기
		public List<CoverLetter> getAllCoverLetter(String individual_id) {
			List<CoverLetter> coverLetterList = new ArrayList<CoverLetter>();
			String query = "SELECT * FROM coverLetter WHERE individual_id = ?";
			try {
				conn= getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, individual_id);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					int no = rs.getInt("no");
					String title = rs.getString("title");
					String content = rs.getString("content");
					
					CoverLetter coverLetter = new CoverLetter(no, individual_id, title, content);
					coverLetterList.add(coverLetter);
				}
				rs.close();
				pstmt.close();
				conn.close();
				
			} catch(Exception e) {
				System.out.println("getCoverLetter Error : " + e.getMessage());
			}
			return coverLetterList;
		}

	// 자기소개서 수정
	public boolean updateCoverLetter(CoverLetter coverLetter) {
		boolean result = false;
		String query = "UPDATE coverLetter " + "SET individual_id = ?, title = ?, content = ? " + "WHERE no = ?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, coverLetter.getIndividual_id());
			pstmt.setString(2, coverLetter.getTitle());
			pstmt.setString(3, coverLetter.getContent());
			pstmt.setInt(4, coverLetter.getNo());

			if (pstmt.executeUpdate() == 1)
				result = true;

			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("updateCoverLetter Error : " + e.getMessage());
		}
		return result;
	}

	// 자기소개서 삭제
	public boolean deleteCoverLetter(int no) {
		boolean result = false;
		String query = "DELETE FROM coverLetter WHERE no = ?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);

			if (pstmt.executeUpdate() == 1)
				result = true;

			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("deleteCoverLetter Error : " + e.getMessage());
		}
		return result;
	}

	// 개인회원 지원하기
	public boolean insertApply(Apply apply) {
		boolean result = false;
		String query = "INSERT INTO apply VALUES(DEFAULT, ?, ?, ?, ?, DEFAULT)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, apply.getIndividual_id());
			pstmt.setInt(2, apply.getJobOpening_no());
			pstmt.setInt(3, apply.getField_no());
			pstmt.setInt(4, apply.getCoverLetter_no());

			if (pstmt.executeUpdate() == 1)
				result = true;

			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("insertApply Error : " + e.getMessage());
		}
		return result;
	}

	// 지원한 공고 데이터 가져오기
	public List<Apply> getApply(String individual_id) {
		List<Apply> applys = new ArrayList<Apply>();
		String query = "SELECT A.*, C.corporateName, F.name AS fieldName, F.career, F.pay FROM apply A "
				+ "JOIN corporation C "
				+ "ON C.id = (SELECT corporation_id FROM jobOpening WHERE no = A.jobOpening_no) " + "JOIN field F "
				+ "ON F.no = A.field_no " + "WHERE individual_id = ?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, individual_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int no = rs.getInt("no");
				int jobOpening_no = rs.getInt("jobOpening_no");
				int field_no = rs.getInt("field_no");
				int coverLetter_no = rs.getInt("coverLetter_no");
				String status = rs.getString("status");
				String corporateName = rs.getString("corporateName");
				String fieldName = rs.getString("fieldName");
				String career = rs.getString("career");
				String pay = rs.getString("pay");

				Apply apply = new Apply(no, individual_id, jobOpening_no, field_no, coverLetter_no, status,
						corporateName, fieldName, career, pay);
				applys.add(apply);
			}

			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("getApply Error : " + e.getMessage());
		}
		return applys;
	}

	// insert dao

	// 이력서 이력서 title stack update
	public boolean upDateResumeTitleStack(String title, String stack, String indiId) {
		boolean result = false;
		String query = "UPDATE individual " + "SET resumeTitle = ?, stack = ? " + "WHERE id = ?";
		try {
			if (!title.equals("") && !stack.equals("") && !indiId.equals("")) {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, title);
				pstmt.setString(2, stack);
				pstmt.setString(3, indiId);
				if (pstmt.executeUpdate() == 1)
					result = true;
				pstmt.close();
				conn.close();
			}
		} catch (Exception e) {
			System.out.println("upDateResumeTitleStack errors : " + e.getMessage());
		}
		return result;
	}

	// 이력서 학력 insert
	public boolean setEducation(List<Education> educationList) {
		boolean result = false;
		int count = 0;
		String query = "INSERT INTO education VALUES(DEFAULT,?,?,?,?,?,?,?,?)";

		try {
			for (int i = 0; i < educationList.size(); i++) {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				Education education = educationList.get(i);
				pstmt.setString(1, education.getIndividual_id());
				pstmt.setString(2, education.getSchool());
				pstmt.setString(3, education.getSchoolName());
				pstmt.setString(4, education.getSchoolStartDate());
				pstmt.setString(5, education.getSchoolEndDate());
				pstmt.setString(6, education.getStatus());
				pstmt.setString(7, education.getDepartment());
				pstmt.setString(8, education.getScore());

				if (pstmt.executeUpdate() == 1)
					count++;

				pstmt.close();
				conn.close();
			}

			if (count == educationList.size())
				result = true;
		} catch (Exception e) {
			System.out.println("setEducation errors : " + e.getMessage());
		}
		return result;
	}

	// 이력서 경력사항 insert
	public boolean setCareer(Career careerList) {
		boolean result = false;
		String query = "INSERT INTO career VALUES(DEFAULT,?,?,?,?,?,?,?)";

		try {
			if (!careerList.getIndividual_id().equals("") && careerList.getIndividual_id() != "") {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				Career career = careerList;
				pstmt.setString(1, career.getIndividual_id());
				pstmt.setString(2, career.getPrev_company());
				pstmt.setString(3, career.getTenureStart());
				pstmt.setString(4, career.getTenureEnd());
				pstmt.setString(5, career.getPosition());
				pstmt.setString(6, career.getDepartment());
				pstmt.setString(7, career.getWork_content());

				if (pstmt.executeUpdate() == 1)
					result = true;

				pstmt.close();
				conn.close();
			}
		} catch (Exception e) {
			System.out.println("setCareer errors :" + e.getMessage());
		}
		return result;
	}

	// 이력서 자격증 insert
	public int setLicense(List<License> licenseList) {
		int result = 0;
		String query = "INSERT INTO license VALUES(DEFAULT,?,?,?,?,?)";

		try {
			for (int i = 0; i < licenseList.size(); i++) {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				License license = licenseList.get(i);
				pstmt.setString(1, license.getIndividual_id());
				pstmt.setString(2, license.getName());
				pstmt.setString(3, license.getAgency());
				pstmt.setString(4, license.getPass());
				pstmt.setString(5, license.getAcquireDate());

				if (pstmt.executeUpdate() == 1)
					result++;

				pstmt.close();
				conn.close();
			}
		} catch (Exception e) {
			System.out.println("setLicense error : " + e.getMessage());
		}
		return result;

	}

	// 이력서 포트폴리오 insert
	public boolean setportfolio(Portfolio portfolioList) {
		boolean result = false;
		String query = "INSERT INTO portfolio VALUES(DEFAULT,?,?,?,?)";

		try {
			if (!portfolioList.getIndividual_id().equals("") && portfolioList.getIndividual_id() != "") {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				Portfolio portfolio = portfolioList;
				pstmt.setString(1, portfolio.getIndividual_id());
				pstmt.setString(2, portfolio.getName());
				pstmt.setString(3, portfolio.getDetail());
				pstmt.setString(4, portfolio.getUrl());

				if (pstmt.executeUpdate() == 1)
					result = true;

				pstmt.close();
				conn.close();
			}
		} catch (Exception e) {
			System.out.println("setportfolio errors : " + e.getMessage());
		}
		return result;
	}

	// 파일 업로드 insert
	public boolean setfile(Portfolio portfolioList) {
		boolean result = false;
		String query = "INSERT INTO fileupload VALUES(DEFAULT,?,?,?,?,?,?)";

		try {
			if (!portfolioList.getIndividual_id().equals("") && portfolioList.getIndividual_id() != "") {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				Portfolio portfolio = portfolioList;
				pstmt.setString(1, portfolio.getIndividual_id());
				pstmt.setString(2, portfolio.getTitle());
				pstmt.setString(3, portfolio.getFileName());
				pstmt.setString(4, portfolio.getFileaddress());
				pstmt.setString(5, portfolio.getFiledetail());
				pstmt.setString(6, portfolio.getFileSize());

				if (pstmt.executeUpdate() == 1)
					result = true;

				pstmt.close();
				conn.close();
			}
		} catch (Exception e) {
			System.out.println("setfile errors : " + e.getMessage());
		}
		return result;
	}

	// 불러오기 dao

	// 학력정보 가져오기
	public Education getEducation(String id) {
		Education education = null;
		String query = "SELECT * FROM education WHERE individual_id = ? order by no asc";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int no = rs.getInt("no");
				String individual_id = rs.getString("individual_id");
				String school = rs.getString("school");
				String schoolName = rs.getString("schoolName");
				String schoolStartDate = rs.getString("schoolStartDate");
				String schoolEndDate = rs.getString("schoolEndDate");
				String status = rs.getString("status");
				String department = rs.getString("department");
				String score = rs.getString("score");

				education = new Education(no, individual_id, school, schoolName, schoolStartDate, schoolEndDate, status,
						department, score);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("getEducation : " + e.getMessage());
		}
		return education;
	}

	// 학력정보들 가져오기
	public List<Education> getEducations(String id) {
		List<Education> educations = new ArrayList<Education>();
		String query = "SELECT * FROM education WHERE individual_id = ?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int no = rs.getInt("no");
				String individual_id = rs.getString("individual_id");
				String school = rs.getString("school");
				String schoolName = rs.getString("schoolName");
				String schoolStartDate = rs.getString("schoolStartDate");
				String schoolEndDate = rs.getString("schoolEndDate");
				String status = rs.getString("status");
				String department = rs.getString("department");
				String score = rs.getString("score");

				Education education = new Education(no, individual_id, school, schoolName, schoolStartDate,
						schoolEndDate, status, department, score);
				educations.add(education);
			}

			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("getEducation Error : " + e.getMessage());
		}
		return educations;
	}

	// 경력 가져오기
	public Career getCareer(String id) {
		Career career = null;
		String query = "SELECT * FROM career WHERE individual_id = ? order by no asc";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int no = rs.getInt("no");
				String individual_id = rs.getString("individual_id");
				String prev_company = rs.getString("prev_company");
				String tenureStart = rs.getString("tenureStart");
				String tenureEnd = rs.getString("tenureEnd");
				String position = rs.getString("position");
				String department = rs.getString("department");
				String work_content = rs.getString("work_content");

				career = new Career(no, individual_id, prev_company, tenureStart, tenureEnd, position, department,
						work_content);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("getCareer : " + e.getMessage());
		}
		return career;
	}

	// 경력들 가져오기
	public List<Career> getCareers(String id) {
		List<Career> careers = new ArrayList<Career>();
		String query = "SELECT * FROM career WHERE individual_id = ?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int no = rs.getInt("no");
				String individual_id = rs.getString("individual_id");
				String prev_company = rs.getString("prev_company");
				String tenureStart = rs.getString("tenureStart");
				String tenureEnd = rs.getString("tenureEnd");
				String position = rs.getString("position");
				String department = rs.getString("department");
				String work_content = rs.getString("work_content");

				Career career = new Career(no, individual_id, prev_company, tenureStart, tenureEnd, position,
						department, work_content);
				careers.add(career);
			}

			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("getCareers Error : " + e.getMessage());
		}
		return careers;
	}

	// 자격증 가지고오기
	public License getLicense(String id) {
		License license = null;
		String query = "SELECT * FROM license WHERE individual_id = ? order by no asc";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int no = rs.getInt("no");
				String individual_id = rs.getString("individual_id");
				String name = rs.getString("name");
				String agency = rs.getString("agency");
				String pass = rs.getString("pass");
				String acquireDate = rs.getString("acquireDate");

				license = new License(no, individual_id, name, agency, pass, acquireDate);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("getLicense : " + e.getMessage());
		}
		return license;
	}

	// 포트폴리오 가져오기
	public Portfolio getportfolio(String id) {
		Portfolio portfolio = null;
		String query = "SELECT * FROM portfolio WHERE individual_id = ? order by no asc";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int no = rs.getInt("no");
				String individual_id = rs.getString("individual_id");
				String name = rs.getString("name");
				String detail = rs.getString("detail");
				String url = rs.getString("url");

				portfolio = new Portfolio(no, individual_id, name, detail, url, "", "", "", "", "");
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("getportfolio : " + e.getMessage());
		}
		return portfolio;
	}

	// 첨부파일 가져오기
	public Portfolio getfileupload(String id) {
		Portfolio fileupload = null;
		String query = "SELECT * FROM fileupload WHERE individual_id = ? order by no asc";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int no = rs.getInt("no");
				String individual_id = rs.getString("individual_id");
				String title = rs.getString("title");
				String fileName = rs.getString("fileName");
				String fileaddress = rs.getString("fileaddress");
				String filedetail = rs.getString("filedetail");
				String fileSize = rs.getString("fileSize");

				fileupload = new Portfolio(no, individual_id, "", "", "", title, fileName, fileaddress, filedetail,
						fileSize);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("getfileupload : " + e.getMessage());
		}
		return fileupload;
	}

	// update dao

	// 이력서 학력 update
	public boolean education_update(Education education_updateList) {
		boolean result = false;
		String query = "UPDATE education " + "SET school = ?," + "schoolName = ?," + "schoolStartDate = ?,"
				+ "schoolEndDate = ?," + "department = ?," + "score = ?," + "status = ? " + "WHERE individual_id = ?";
		try {
			if (!education_updateList.getSchool().equals("") && education_updateList.getSchool() != "") {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				Education education_update = education_updateList;
				pstmt.setString(1, education_update.getSchool());
				pstmt.setString(2, education_update.getSchoolName());
				pstmt.setString(3, education_update.getSchoolStartDate());
				pstmt.setString(4, education_update.getSchoolEndDate());
				pstmt.setString(5, education_update.getDepartment());
				pstmt.setString(6, education_update.getScore());
				pstmt.setString(7, education_update.getStatus());
				pstmt.setString(8, education_update.getIndividual_id());
				if (pstmt.executeUpdate() == 1)
					result = true;

				pstmt.close();
				conn.close();
			}

		} catch (Exception e) {
			System.out.println("education_update errors : " + e.getMessage());
		}
		return result;
	}

	// 이력서 경력 update
	public boolean career_update(Career career_updateList) {
		boolean result = false;
		String query = "UPDATE career " + "SET prev_company = ?, " + "tenureStart = ?, " + "tenureEnd = ?, "
				+ "position = ?, " + "department = ?, " + "work_content = ? " + "WHERE individual_id = ?";
		try {
			if (!career_updateList.getIndividual_id().equals("") && career_updateList.getIndividual_id() != "") {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				Career career_update = career_updateList;
				pstmt.setString(1, career_update.getPrev_company());
				pstmt.setString(2, career_update.getTenureStart());
				pstmt.setString(3, career_update.getTenureEnd());
				pstmt.setString(4, career_update.getPosition());
				pstmt.setString(5, career_update.getDepartment());
				pstmt.setString(6, career_update.getWork_content());
				pstmt.setString(7, career_update.getIndividual_id());

				if (pstmt.executeUpdate() == 1)
					result = true;

				pstmt.close();
				conn.close();
			}

		} catch (Exception e) {
			System.out.println("career_update errors : " + e.getMessage());
		}
		return result;
	}

	// 자격증 update
	public boolean license_update(License license_updateList) {
		boolean result = false;
		String query = "UPDATE license " + "SET name = ?, " + "agency = ?, " + "pass = ?, " + "acquireDate = ? "
				+ "WHERE individual_id = ?";
		try {
			if (!license_updateList.getIndividual_id().equals("") && license_updateList.getIndividual_id() != "") {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				License license_update = license_updateList;
				pstmt.setString(1, license_update.getName());
				pstmt.setString(2, license_update.getAgency());
				pstmt.setString(3, license_update.getPass());
				pstmt.setString(4, license_update.getAcquireDate());
				pstmt.setString(5, license_update.getIndividual_id());

				if (pstmt.executeUpdate() == 1)
					result = true;

				pstmt.close();
				conn.close();
			}
		} catch (Exception e) {
			System.out.println("license_update errors : " + e.getMessage());
		}
		return result;
	}

	// 포트폴리오 update
	public boolean portfolio_update(Portfolio portfolio_updateList) {
		boolean result = false;
		String query = "UPDATE portfolio SET name = ?, " + "detail = ?, " + "url = ? " + "WHERE individual_id = ?";
		try {
			if (!portfolio_updateList.getIndividual_id().equals("") && portfolio_updateList.getIndividual_id() != "") {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				Portfolio portfolio_update = portfolio_updateList;
				pstmt.setString(1, portfolio_update.getName());
				pstmt.setString(2, portfolio_update.getDetail());
				pstmt.setString(3, portfolio_update.getUrl());
				pstmt.setString(4, portfolio_update.getIndividual_id());

				if (pstmt.executeUpdate() == 1)
					result = true;

				pstmt.close();
				conn.close();
			}
		} catch (Exception e) {
			System.out.println("portfolio_update errors : " + e.getMessage());
		}
		return result;
	}

	// 파일 update
	public boolean fileupload_update(Portfolio fileupload_updateList) {
		boolean result = false;
		String query = "UPDATE fileupload SET title = ?, " + "filename = ?, " + "fileaddress = ?, " + "filedetail = ?, "
				+ "fileSize = ? " + "WHERE individual_id = ?";
		try {
			if (!fileupload_updateList.getIndividual_id().equals("")
					&& fileupload_updateList.getIndividual_id() != "") {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				Portfolio fileupload_update = fileupload_updateList;
				pstmt.setString(1, fileupload_update.getTitle());
				pstmt.setString(2, fileupload_update.getFileName());
				pstmt.setString(3, fileupload_update.getFileaddress());
				pstmt.setString(4, fileupload_update.getFiledetail());
				pstmt.setString(5, fileupload_update.getFileSize());
				pstmt.setString(6, fileupload_update.getIndividual_id());

				if (pstmt.executeUpdate() == 1)
					result = true;

				pstmt.close();
				conn.close();
			}
		} catch (Exception e) {
			System.out.println("fileupload_update errors : " + e.getMessage());
		}
		return result;
	}
	//개인정보 수정
	public boolean myinfo_update(Individual update_infoList) {
		boolean result = false;
		String query = "UPDATE individual SET "
				+ "password = ?, "
				+ "name = ?, "
				+ "birth = ?, "
				+ "gender = ?, "
				+ "email = ?, "
				+ "phone = ?, "
				+ "address = ? "
				+ "WHERE id = ?";
		try {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				Individual info_update = update_infoList;
				pstmt.setString(1, info_update.getPassword());
				pstmt.setString(2, info_update.getName());
				pstmt.setString(3, info_update.getBirth());
				pstmt.setString(4, info_update.getGender());
				pstmt.setString(5, info_update.getEmail());
				pstmt.setString(6, info_update.getPhone());
				pstmt.setString(7, info_update.getAddress());
				pstmt.setString(8, info_update.getId());

				if (pstmt.executeUpdate() == 1)
					result = true;

				pstmt.close();
				conn.close();
			}catch (Exception e) {
			System.out.println("myinfo_update errors : " + e.getMessage());
		}
		return result;
	}
}