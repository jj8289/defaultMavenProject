package kr.co.jj.common.vo;

public enum WorkFlag {
	
	one("일일"), part("단기/장기"), sat("토요일 고정");
	
	final private String name;
	
	public String getName() {
		return name;
	}
	
	private WorkFlag(String name) {
		this.name= name;
	}
}
