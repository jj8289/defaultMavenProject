package kr.co.jj.common.vo;

public enum WorkPT {
	
	A("신경계 치료"), B("통증 치료"), C("심플"), D("10분 메뉴얼"), E("도수 치료(30분 이상)"), F("운동 치료");
	
	final private String name;
	
	public String getName() {
		return name;
	}
	
	private WorkPT(String name) {
		this.name= name;
	}
}
