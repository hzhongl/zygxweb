package com.hxx.po;

public class Lable {
	private int lId;
	
	private String lLableName;

	public int getlId() {
		return lId;
	}

	public void setlId(int lId) {
		this.lId = lId;
	}

	public String getlLableName() {
		return lLableName;
	}

	public void setlLableName(String lLableName) {
		this.lLableName = lLableName;
	}

	@Override
	public String toString() {
		return "Lable [lId=" + lId + ", lLableName=" + lLableName + "]";
	}
	
	

}
