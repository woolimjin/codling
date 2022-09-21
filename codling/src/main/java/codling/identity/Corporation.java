package codling.identity;

public class Corporation {
	private String id, password, corporateName, corporatePhone, ceoName, corporateNumber, fileName, logo_fileName, address, detailAddress;
	
	public Corporation() {}

	public Corporation(String id, String password, String corporateName, String corporatePhone, String ceoName, String corporateNumber, String fileName, String logo_fileName, String address, String detailAddress) {
		super();
		this.id = id;
		this.password = password;
		this.corporateName = corporateName;
		this.corporatePhone = corporatePhone;
		this.ceoName = ceoName;
		this.corporateNumber = corporateNumber;
		this.fileName = fileName;
		this.logo_fileName = logo_fileName;
		this.address = address;
		this.detailAddress = detailAddress;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCorporateName() {
		return corporateName;
	}

	public void setCorporateName(String corporateName) {
		this.corporateName = corporateName;
	}

	public String getCorporatePhone() {
		return corporatePhone;
	}

	public void setCorporatePhone(String corporatePhone) {
		this.corporatePhone = corporatePhone;
	}

	public String getCeoName() {
		return ceoName;
	}

	public void setCeoName(String ceoName) {
		this.ceoName = ceoName;
	}

	public String getCorporateNumber() {
		return corporateNumber;
	}

	public void setCorporateNumber(String corporateNumber) {
		this.corporateNumber = corporateNumber;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getLogo_fileName() {
		return logo_fileName;
	}

	public void setLogo_fileName(String logo_fileName) {
		this.logo_fileName = logo_fileName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	

	
}