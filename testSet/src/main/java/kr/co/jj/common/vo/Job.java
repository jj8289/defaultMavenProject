package kr.co.jj.common.vo;

public enum Job {

	PT("물리치료사"), OT("작업치료사"), RN("간호사"), AN("간호조무사"), RT("방사선사"), MT("임상병리사"), DH("치위생사");
	
	final private String name;
	
	public String getName() {
		return name;
	}
	
	private Job(String name) {
		this.name= name;
	}
}
