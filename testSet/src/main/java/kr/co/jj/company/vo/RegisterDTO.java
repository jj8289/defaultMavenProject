package kr.co.jj.company.vo;

import java.util.List;

public class RegisterDTO {
	private String workType;
	private String salaryHour;
	private String salaryDay;
	private String workDate;
	private String workStart;
	private List<String> dowList;
	private String timeFlag;
	private String workStTime;
	private String workEnTime;
	private String job;
	private String sex;
	private String age;
	private String career;
	private String lunchStTime;
	private String lunchEnTime;
	private String workFlag;
	private String work;
	private String insenFlag;
	private String detailWork;
	private List<String> workPtList;
	private List<String> detailWorkPtList;
	private String peerCnt;
	private String avgCnt;
	private String etc;
	
	public String getWorkType() {
		return workType;
	}
	public void setWorkType(String workType) {
		this.workType = workType;
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
	public String getWorkDate() {
		return workDate;
	}
	public void setWorkDate(String workDate) {
		this.workDate = workDate;
	}
	public String getWorkStart() {
		return workStart;
	}
	public void setWorkStart(String workStart) {
		this.workStart = workStart;
	}
	public List<String> getDowList() {
		return dowList;
	}
	public void setDowList(List<String> dowList) {
		this.dowList = dowList;
	}
	public String getTimeFlag() {
		return timeFlag;
	}
	public void setTimeFlag(String timeFlag) {
		this.timeFlag = timeFlag;
	}
	public String getWorkStTime() {
		return workStTime;
	}
	public void setWorkStTime(String workStTime) {
		this.workStTime = workStTime;
	}
	public String getWorkEnTime() {
		return workEnTime;
	}
	public void setWorkEnTime(String workEnTime) {
		this.workEnTime = workEnTime;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getLunchStTime() {
		return lunchStTime;
	}
	public void setLunchStTime(String lunchStTime) {
		this.lunchStTime = lunchStTime;
	}
	public String getLunchEnTime() {
		return lunchEnTime;
	}
	public void setLunchEnTime(String lunchEnTime) {
		this.lunchEnTime = lunchEnTime;
	}
	public String getWorkFlag() {
		return workFlag;
	}
	public void setWorkFlag(String workFlag) {
		this.workFlag = workFlag;
	}
	public String getWork() {
		return work;
	}
	public void setWork(String work) {
		this.work = work;
	}
	public String getInsenFlag() {
		return insenFlag;
	}
	public void setInsenFlag(String insenFlag) {
		this.insenFlag = insenFlag;
	}
	public String getDetailWork() {
		return detailWork;
	}
	public void setDetailWork(String detailWork) {
		this.detailWork = detailWork;
	}
	public List<String> getWorkPtList() {
		return workPtList;
	}
	public void setWorkPtList(List<String> workPtList) {
		this.workPtList = workPtList;
	}
	public List<String> getDetailWorkPtList() {
		return detailWorkPtList;
	}
	public void setDetailWorkPtList(List<String> detailWorkPtList) {
		this.detailWorkPtList = detailWorkPtList;
	}
	public String getPeerCnt() {
		return peerCnt;
	}
	public void setPeerCnt(String peerCnt) {
		this.peerCnt = peerCnt;
	}
	public String getAvgCnt() {
		return avgCnt;
	}
	public void setAvgCnt(String avgCnt) {
		this.avgCnt = avgCnt;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	
	@Override
	public String toString() {
		return "RegisterDTO [workType=" + workType + ", salaryHour=" + salaryHour + ", salaryDay=" + salaryDay
				+ ", workDate=" + workDate + ", workStart=" + workStart + ", dowList=" + dowList + ", timeFlag="
				+ timeFlag + ", workStTime=" + workStTime + ", workEnTime=" + workEnTime + ", job=" + job + ", sex="
				+ sex + ", age=" + age + ", career=" + career + ", lunchStTime=" + lunchStTime + ", lunchEnTime="
				+ lunchEnTime + ", workFlag=" + workFlag + ", work=" + work + ", insenFlag=" + insenFlag
				+ ", detailWork=" + detailWork + ", workPtList=" + workPtList + ", detailWorkPtList=" + detailWorkPtList
				+ ", peerCnt=" + peerCnt + ", avgCnt=" + avgCnt + ", etc=" + etc + "]";
	}
}
