package kr.co.jj.common.vo;

public class AddrVO {
	private String addrNo;
	private String sdNm;
	private String sgNm;
	private String dnNm;
	
	public String getAddrNo() {
		return addrNo;
	}
	public void setAddrNo(String addrNo) {
		this.addrNo = addrNo;
	}
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
		return "AddVO [addrNo=" + addrNo + ", sdNm=" + sdNm + ", sgNm=" + sgNm + ", dnNm=" + dnNm + "]";
	}
}	
