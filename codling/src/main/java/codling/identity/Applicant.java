package codling.identity;

public class Applicant {
	private int no, coverLetter_no;
	private String id, resumeTitle, name, fieldName, career, stack, education, email, phone, status;
	
	public Applicant(int no, String id, String resumeTitle, String name, String fieldName, String stack, String email,
			String phone, int coverLetter_no, String status) {
		super();
		this.no = no;
		this.id = id;
		this.resumeTitle = resumeTitle;
		this.name = name;
		this.fieldName = fieldName;
		this.stack = stack;
		this.email = email;
		this.phone = phone;
		this.coverLetter_no = coverLetter_no;
		this.status = status;
	}

	public Applicant(int no, String id, String resumeTitle, String name, String fieldName, String career, String stack,
			String education, String email, String phone, int coverLetter_no, String status) {
		super();
		this.no = no;
		this.id = id;
		this.resumeTitle = resumeTitle;
		this.name = name;
		this.fieldName = fieldName;
		this.career = career;
		this.stack = stack;
		this.education = education;
		this.email = email;
		this.phone = phone;
		this.coverLetter_no = coverLetter_no;
		this.status = status;
	}
	
	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getResumeTitle() {
		return resumeTitle;
	}
	
	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getFieldName() {
		return fieldName;
	}
	
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	
	public String getCareer() {
		return career;
	}
	
	public void setCareer(String career) {
		this.career = career;
	}
	
	public String getStack() {
		return stack;
	}
	
	public void setStack(String stack) {
		this.stack = stack;
	}
	
	public String getEducation() {
		return education;
	}
	
	public void setEducation(String education) {
		this.education = education;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public int getCoverLetter_no() {
		return coverLetter_no;
	}

	public void setCoverLetter_no(int coverLetter_no) {
		this.coverLetter_no = coverLetter_no;
	}

	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}	
}