package kr.co.jj.common.vo;

public class JobVO {
	private String jobNo;
	private String jobNm;
	
	public String getJobNo() {
		return jobNo;
	}
	public void setJobNo(String jobNo) {
		this.jobNo = jobNo;
	}
	public String getJobNm() {
		return jobNm;
	}
	public void setJobNm(String jobNm) {
		this.jobNm = jobNm;
	}
	
	@Override
	public String toString() {
		return "JobVO [jobNo=" + jobNo + ", jobNm=" + jobNm + "]";
	}
}


