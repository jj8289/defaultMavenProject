package kr.co.jj.company.vo;

public class RegisterVO {
	
	private String regNo;
	private String companyNo;
	private String salaryHour;
	private String salaryDay;
	private String workType;
	private String workDate;
	private String workStart;
	private String workDow;
	private String workTime;
	private String job;
	private String sex;
	private String age;
	private String career;
	private String createDate;
	private String lunchTime;
	private String lunchYn;
	private String etc;
	
	public String getRegNo() {
		return regNo;
	}
	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}
	public String getCompanyNo() {
		return companyNo;
	}
	public void setCompanyNo(String companyNo) {
		this.companyNo = companyNo;
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
	public String getWorkType() {
		return workType;
	}
	public void setWorkType(String workType) {
		this.workType = workType;
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
	public String getWorkDow() {
		return workDow;
	}
	public void setWorkDow(String workDow) {
		this.workDow = workDow;
	}
	public String getWorkTime() {
		return workTime;
	}
	public void setWorkTime(String workTime) {
		this.workTime = workTime;
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
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getLunchTime() {
		return lunchTime;
	}
	public void setLunchTime(String lunchTime) {
		this.lunchTime = lunchTime;
	}
	public String getLunchYn() {
		return lunchYn;
	}
	public void setLunchYn(String lunchYn) {
		this.lunchYn = lunchYn;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	
	@Override
	public String toString() {
		return "RegisterVO [regNo=" + regNo + ", companyNo=" + companyNo + ", salaryHour=" + salaryHour + ", salaryDay="
				+ salaryDay + ", workType=" + workType + ", workDate=" + workDate + ", workStart=" + workStart
				+ ", workDow=" + workDow + ", workTime=" + workTime + ", job=" + job + ", sex=" + sex + ", age=" + age
				+ ", career=" + career + ", createDate=" + createDate + ", lunchTime=" + lunchTime + ", lunchYn="
				+ lunchYn + ", etc=" + etc + "]";
	}
}
