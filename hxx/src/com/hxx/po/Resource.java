package com.hxx.po;

public class Resource {
	
	private int rId;
	
	private String rName;
	
	private String rCreatetime;
	
	private String rUrl;
	
	private String rContent;
	
	private String rPass;
	private String rHot;
	private String cId;
	
	private String lId;

	private Lable lable;
	private HotResources hotresources;
	private Customer customer;
	
	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public String getrCreatetime() {
		return rCreatetime;
	}

	public void setrCreatetime(String rCreatetime) {
		this.rCreatetime = rCreatetime;
	}

	public String getrUrl() {
		return rUrl;
	}

	public void setrUrl(String rUrl) {
		this.rUrl = rUrl;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public String getrPass() {
		return rPass;
	}

	public void setrPass(String rPass) {
		this.rPass = rPass;
	}

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	public String getlId() {
		return lId;
	}

	public void setlId(String lId) {
		this.lId = lId;
	}

	public Lable getLable() {
		return lable;
	}

	public void setLable(Lable lable) {
		this.lable = lable;
	}

	public HotResources getHotresources() {
		return hotresources;
	}

	public void setHotresources(HotResources hotresources) {
		this.hotresources = hotresources;
	}
	
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getrHot() {
		return rHot;
	}

	public void setrHot(String rHot) {
		this.rHot = rHot;
	}

	public String toString() {
		return "Resource [rId=" + rId + ", rName=" + rName + ", rCreatetime=" + rCreatetime + ", rUrl=" + rUrl
				+ ", rContent=" + rContent + ", rPass=" + rPass + ", rHot=" + rHot + ", cId=" + cId + ", lId=" + lId
				+ ", lable=" + lable + ", hotresources=" + hotresources + ", customer=" + customer + "]";
	}
	
	
}
