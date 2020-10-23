package kr.co.jj.company.vo;

public class CompanyVO {
	
	private String companyNo;
	private String companyNm;
	private String managerId;
	private String managerPw;
	private String managerNm;
	private String phone;
	private String addr;
	private String tel;
	private String email;
	private String kind;
	private String intro;
	private String blackCnt;
	private String blackYn;
	private String sido;
	private String sigungu;
	private String dong;
	private String lat;
	private String logt;
	private String createDate;
	
	public String getCompanyNo() {
		return companyNo;
	}
	public void setCompanyNo(String companyNo) {
		this.companyNo = companyNo;
	}
	public String getCompanyNm() {
		return companyNm;
	}
	public void setCompanyNm(String companyNm) {
		this.companyNm = companyNm;
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
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
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getSigungu() {
		return sigungu;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLogt() {
		return logt;
	}
	public void setLogt(String logt) {
		this.logt = logt;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	
	@Override
	public String toString() {
		return "CompanyVO [companyNo=" + companyNo + ", companyNm=" + companyNm + ", managerId=" + managerId
				+ ", managerPw=" + managerPw + ", managerNm=" + managerNm + ", phone=" + phone + ", addr=" + addr
				+ ", tel=" + tel + ", email=" + email + ", kind=" + kind + ", intro=" + intro + ", blackCnt=" + blackCnt
				+ ", blackYn=" + blackYn + ", sido=" + sido + ", sigungu=" + sigungu + ", dong=" + dong + ", lat=" + lat
				+ ", logt=" + logt + ", createDate=" + createDate + "]";
	}

	
}
