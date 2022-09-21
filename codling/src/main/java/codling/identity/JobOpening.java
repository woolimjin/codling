package codling.identity;

public class JobOpening {
	private int no, count, advertisement;
	private String corporation_id, title, region, detailRegion, process, startDate, endDate;
	
	public JobOpening() {}

	public JobOpening(int no, String corporation_id, String title, String region, String detailRegion, String process, String startDate, String endDate,
			int count, int advertisement) {
		super();
		this.no = no;
		this.corporation_id = corporation_id;
		this.title = title;
		this.region = region;
		this.detailRegion = detailRegion;
		this.process = process;
		this.startDate = startDate;
		this.endDate = endDate;
		this.count = count;
		this.count = advertisement;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getAdvertisement() {
		return advertisement;
	}

	public void setAdvertisement(int advertisement) {
		this.advertisement = advertisement;
	}

	public String getCorporation_id() {
		return corporation_id;
	}

	public void setCorporation_id(String corporation_id) {
		this.corporation_id = corporation_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getDetailRegion() {
		return detailRegion;
	}

	public void setDetailRegion(String detailRegion) {
		this.detailRegion = detailRegion;
	}

	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


}