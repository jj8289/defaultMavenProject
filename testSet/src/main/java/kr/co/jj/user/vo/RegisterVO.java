package kr.co.jj.user.vo;

public class RegisterVO {
	
	private String requireNo;
	private String userNo;
	private String salaryHour;
	private String salaryDay;
	private String searchType;		// one: 일일 / date: 기간 / dow: 요일
	private String searchDate;
	private String searchStart;
	private String searchEnd;
	private String searchDow;
	private String searchTime;		// 1 : 상관없음 / 2 : 오전 / 3 : 오후 / 4 : 하루	
	private String location1;
	private String location2;
	private String location3;
	private String location4;
	private String location5;
	private String createDate;
	
	public String getRequireNo() {
		return requireNo;
	}
	public void setRequireNo(String requireNo) {
		this.requireNo = requireNo;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getSalaryHour() {
		return salaryHour;
	}
	public void setSalaryHour(String salaryHour) {
		this.salaryHour = salaryHour;
	}
	public String getSalaryDay() {
		return salaryDay;
	}
	public void setSalaryDay(String salaryDay) {
		this.salaryDay = salaryDay;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchDate() {
		return searchDate;
	}
	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}
	public String getSearchStart() {
		return searchStart;
	}
	public void setSearchStart(String searchStart) {
		this.searchStart = searchStart;
	}
	public String getSearchEnd() {
		return searchEnd;
	}
	public void setSearchEnd(String searchEnd) {
		this.searchEnd = searchEnd;
	}
	public String getSearchDow() {
		return searchDow;
	}
	public void setSearchDow(String searchDow) {
		this.searchDow = searchDow;
	}
	public String getSearchTime() {
		return searchTime;
	}
	public void setSearchTime(String searchTime) {
		this.searchTime = searchTime;
	}
	public String getLocation1() {
		return location1;
	}
	public void setLocation1(String location1) {
		this.location1 = location1;
	}
	public String getLocation2() {
		return location2;
	}
	public void setLocation2(String location2) {
		this.location2 = location2;
	}
	public String getLocation3() {
		return location3;
	}
	public void setLocation3(String location3) {
		this.location3 = location3;
	}
	public String getLocation4() {
		return location4;
	}
	public void setLocation4(String location4) {
		this.location4 = location4;
	}
	public String getLocation5() {
		return location5;
	}
	public void setLocation5(String location5) {
		this.location5 = location5;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	
	@Override
	public String toString() {
		return "RegisterVO [requireNo=" + requireNo + ", userNo=" + userNo + ", salaryHour=" + salaryHour
				+ ", salaryDay=" + salaryDay + ", searchType=" + searchType + ", searchDate=" + searchDate
				+ ", searchStart=" + searchStart + ", searchEnd=" + searchEnd + ", searchDow=" + searchDow
				+ ", searchTime=" + searchTime + ", location1=" + location1 + ", location2=" + location2
				+ ", location3=" + location3 + ", location4=" + location4 + ", location5=" + location5 + ", createDate="
				+ createDate + "]";
	}
}
