package kr.co.jj.user.vo;

public class CompanyVO {
	
	private String companyNo;
	private String managerId;
	private String managerPw;
	private String managerNm;
	private String phone;
	private String addr;
	private String email;
	private String kind;
	private String intro;
	private String blackCnt;
	private String blackYn;
	private String createDate;
	
	public String getCompanyNo() {
		return companyNo;
	}
	public void setCompanyNo(String companyNo) {
		this.companyNo = companyNo;
	}
	public String getManagerId() {
		return managerId;
	}
	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}
	public String getManagerPw() {
		return managerPw;
	}
	public void setManagerPw(String managerPw) {
		this.managerPw = managerPw;
	}
	public String getManagerNm() {
		return managerNm;
	}
	public void setManagerNm(String managerNm) {
		this.managerNm = managerNm;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getBlackCnt() {
		return blackCnt;
	}
	public void setBlackCnt(String blackCnt) {
		this.blackCnt = blackCnt;
	}
	public String getBlackYn() {
		return blackYn;
	}
	public void setBlackYn(String blackYn) {
		this.blackYn = blackYn;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	
	@Override
	public String toString() {
		return "CompanyVO [companyNo=" + companyNo + ", managerId=" + managerId + ", managerPw=" + managerPw
				+ ", managerNm=" + managerNm + ", phone=" + phone + ", addr=" + addr + ", email=" + email + ", kind="
				+ kind + ", intro=" + intro + ", blackCnt=" + blackCnt + ", blackYn=" + blackYn + ", createDate="
				+ createDate + "]";
	}
	
}
