package codling.identity;

public class CoverLetter {
	private int no;
	private String individual_id, title, content;
	
	public CoverLetter() {}

	public CoverLetter(int no, String individual_id, String title, String content) {
		super();
		this.no = no;
		this.individual_id = individual_id;
		this.title = title;
		this.content = content;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}