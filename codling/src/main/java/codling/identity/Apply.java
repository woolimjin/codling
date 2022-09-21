package codling.identity;

public class Apply {
	private int no, jobOpening_no, field_no, coverLetter_no;
	private String individual_id, status;
	private String corporateName, fieldName, career, pay;
	
	public Apply() {}

	public Apply(int no, String individual_id, int jobOpening_no, int field_no, int coverLetter_no, String status) {
		super();
		this.no = no;
		this.individual_id = individual_id;
		this.jobOpening_no = jobOpening_no;
		this.field_no = field_no;
		this.coverLetter_no = coverLetter_no;
		this.status = status;
	}

	public Apply(int no, String individual_id, int jobOpening_no, int field_no, int coverLetter_no, String status,
			String corporateName, String fieldName, String career, String pay) {
		super();
		this.no = no;
		this.individual_id = individual_id;
		this.jobOpening_no = jobOpening_no;
		this.field_no = field_no;
		this.coverLetter_no = coverLetter_no;
		this.status = status;
		this.corporateName = corporateName;
		this.fieldName = fieldName;
		this.career = career;
		this.pay = pay;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getJobOpening_no() {
		return jobOpening_no;
	}

	public void setJobOpening_no(int jobOpening_no) {
		this.jobOpening_no = jobOpening_no;
	}

	public int getField_no() {
		return field_no;
	}

	public void setField_no(int field_no) {
		this.field_no = field_no;
	}

	public int getCoverLetter_no() {
		return coverLetter_no;
	}

	public void setCoverLetter_no(int coverLetter_no) {
		this.coverLetter_no = coverLetter_no;
	}

	public String getIndividual_id() {
		return individual_id;
	}

	public void setIndividual_id(String individual_id) {
		this.individual_id = individual_id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCorporateName() {
		return corporateName;
	}

	public void setCorporateName(String corporateName) {
		this.corporateName = corporateName;
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

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}
}