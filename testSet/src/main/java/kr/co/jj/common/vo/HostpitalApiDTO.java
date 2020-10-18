package kr.co.jj.common.vo;

public class HostpitalApiDTO {
	private String KEY;
	private String Type;
	private String pIndex;
	private String pSize;
	private String SIGUN_NM;
	private String SIGUN_CD;
	
	public String getKEY() {
		return KEY;
	}
	public void setKEY(String kEY) {
		KEY = kEY;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	public String getpIndex() {
		return pIndex;
	}
	public void setpIndex(String pIndex) {
		this.pIndex = pIndex;
	}
	public String getpSize() {
		return pSize;
	}
	public void setpSize(String pSize) {
		this.pSize = pSize;
	}
	public String getSIGUN_NM() {
		return SIGUN_NM;
	}
	public void setSIGUN_NM(String sIGUN_NM) {
		SIGUN_NM = sIGUN_NM;
	}
	public String getSIGUN_CD() {
		return SIGUN_CD;
	}
	public void setSIGUN_CD(String sIGUN_CD) {
		SIGUN_CD = sIGUN_CD;
	}
	@Override
	public String toString() {
		return "HostpitalApiDTO [KEY=" + KEY + ", Type=" + Type + ", pIndex=" + pIndex + ", pSize=" + pSize
				+ ", SIGUN_NM=" + SIGUN_NM + ", SIGUN_CD=" + SIGUN_CD + "]";
	}
	
	
	
}
