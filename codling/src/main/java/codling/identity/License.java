package codling.identity;

public class License {
	private int no;
	private String individual_id, name, agency, pass, acquireDate;
	
	public License() {}

	public License(int no, String individual_id, String name, String agency, String pass, String acquireDate) {
		super();
		this.no = no;
		this.individual_id = individual_id;
		this.name = name;
		this.agency = agency;
		this.pass = pass;
		this.acquireDate = acquireDate;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAgency() {
		return agency;
	}

	public void setAgency(String agency) {
		this.agency = agency;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getAcquireDate() {
		return acquireDate;
	}

	public void setAcquireDate(String acquireDate) {
		this.acquireDate = acquireDate;
	}
}