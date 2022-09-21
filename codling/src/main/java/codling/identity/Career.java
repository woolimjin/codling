package codling.identity;

public class Career {
	private int no;
	
	private String individual_id, prev_company, tenureStart, tenureEnd, position, department, work_content;
	
	public Career() {}
	
	public Career(int no, String individual_id, String prev_company, String tenureStart, String tenureEnd, String position, String department, String work_content) {
		super();
		this.no = no;
		this.individual_id = individual_id;
		this.prev_company = prev_company;
		this.tenureStart = tenureStart;
		this.tenureEnd = tenureEnd;
		this.position = position;
		this.department = department;
		this.work_content = work_content;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getIndividual_id() {
		return individual_id;
	}

	public void setIndividual_id(String individual_id) {
		this.individual_id = individual_id;
	}

	public String getPrev_company() {
		return prev_company;
	}

	public void setPrev_company(String prev_company) {
		this.prev_company = prev_company;
	}

	public String getTenureStart() {
		return tenureStart;
	}

	public void setTenureStart(String tenureStart) {
		this.tenureStart = tenureStart;
	}

	public String getTenureEnd() {
		return tenureEnd;
	}

	public void setTenureEnd(String tenureEnd) {
		this.tenureEnd = tenureEnd;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getWork_content() {
		return work_content;
	}

	public void setWork_content(String work_content) {
		this.work_content = work_content;
	}

	
	
	
}