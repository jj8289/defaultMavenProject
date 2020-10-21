package kr.co.jj.company.vo;

public class AddrVO {
	private String rownum;
	
	private String addrNo;
	private String sdNm;
	private String sgNm;
	private String dnNm;
	
	public String getRownum() {
		return rownum;
	}
	public void setRownum(String rownum) {
		this.rownum = rownum;
	}
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
		return "AddrVO [rownum=" + rownum + ", addrNo=" + addrNo + ", sdNm=" + sdNm + ", sgNm=" + sgNm + ", dnNm="
				+ dnNm + "]";
	}
	
	
//	public enum sgValue {
//	    경기도("10") // 무료발송베이스 횟수
//	    , PASSWORDERRORCOUNT("0") // 비밀번호 오류횟수
//	    , PASSWORDERRORYN("N"); // 비밀번호 오류잠김여부
//
//	    private final String value;
//
//	    private CompanyBaseDefaultValue(String value) {
//	      this.value = value;
//	    }
//
//	    public String getValue() {
//	      return value;
//	    }
//	  }
}
