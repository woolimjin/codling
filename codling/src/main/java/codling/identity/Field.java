package codling.identity;

public class Field {
	private int no, jobOpening_no;
	private String name, career, position, pay, workDay, work, stack, requirement, preference;
	
	public Field() {}

	public Field(int no, int jobOpening_no, String name, String career, String position, String pay, String workDay,
			String work, String stack, String requirement, String preference) {
		super();
		this.no = no;
		this.jobOpening_no = jobOpening_no;
		this.name = name;
		this.career = career;
		this.position = position;
		this.pay = pay;
		this.workDay = workDay;
		this.work = work;
		this.stack = stack;
		this.requirement = requirement;
		this.preference = preference;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public String getWorkDay() {
		return workDay;
	}

	public void setWorkDay(String workDay) {
		this.workDay = workDay;
	}

	public String getWork() {
		return work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	public String getStack() {
		return stack;
	}

	public void setStack(String stack) {
		this.stack = stack;
	}

	public String getRequirement() {
		return requirement;
	}

	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}

	public String getPreference() {
		return preference;
	}

	public void setPreference(String preference) {
		this.preference = preference;
	}
}