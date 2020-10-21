package kr.co.jj.company.vo;

public class AddrDTO {
	private String sdNm;
	private String sgNm;
	private String dnNm;
	
	public String getSdNm() {
		return sdNm;
	}
	public void setSdNm(String sdNm) {
		this.sdNm = sdNm;
	}
	public String getSgNm() {
		return sgNm;
	}
	public void setSgNm(String sgNm) {
		this.sgNm = sgNm;
	}
	public String getDnNm() {
		return dnNm;
	}
	public void setDnNm(String dnNm) {
		this.dnNm = dnNm;
	}

	
	@Override
	public String toString() {
		return "AddrDTO [sdNm=" + sdNm + ", sgNm=" + sgNm + ", dnNm=" + dnNm + "]"; 
	}
}
