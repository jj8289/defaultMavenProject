package kr.co.jj.user.vo;

import java.util.List;

public class RegisterVO {
	
	private String reqNo;
	private String userNo;
	private String salaryHour;
	private String salaryDay;
	private String searchType;		// one: 일일 / date: 기간 / dow: 요일
	private String searchDate;
	private String searchStart;
	private String searchEnd;
	private String searchDow;
	private String searchTime;		// 1 : 상관없음 / 2 : 오전 / 3 : 오후 / 4 : 하루	
	private String location;
	private List<String> dowList;
	private List<String> locList;
	private String createDate;
	
	
	public String getReqNo() {
		return reqNo;
	}
	public void setReqNo(String reqNo) {
		this.reqNo = reqNo;
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public List<String> getDowList() {
		return dowList;
	}
	public void setDowList(List<String> dowList) {
		this.dowList = dowList;
	}
	public List<String> getLocList() {
		return locList;
	}
	public void setLocList(List<String> locList) {
		this.locList = locList;
	}
	@Override
	public String toString() {
		return "RegisterVO [reqNo=" + reqNo + ", userNo=" + userNo + ", salaryHour=" + salaryHour
				+ ", salaryDay=" + salaryDay + ", searchType=" + searchType + ", searchDate=" + searchDate
				+ ", searchStart=" + searchStart + ", searchEnd=" + searchEnd + ", searchDow=" + searchDow
				+ ", searchTime=" + searchTime + ", location=" + location + ", dowList=" + dowList + ", locList="
				+ locList + ", createDate=" + createDate + "]";
	}
}
