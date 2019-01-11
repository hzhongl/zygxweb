package com.hxx.po;

public class Customer {
	private String cId;
	private String cAccount;
	private String 	cPassword;
	private String cRealName;
	private String cAge;
	private String cPhone;
	private String cIdNumber;
	private String cEmail;
	private String cType;
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public String getcAccount() {
		return cAccount;
	}
	public void setcAccount(String cAccount) {
		this.cAccount = cAccount;
	}
	public String getcPassword() {
		return cPassword;
	}
	public void setcPassword(String cPassword) {
		this.cPassword = cPassword;
	}
	public String getcRealName() {
		return cRealName;
	}
	public void setcRealName(String cRealName) {
		this.cRealName = cRealName;
	}
	public String getcAge() {
		return cAge;
	}
	public void setcAge(String cAge) {
		this.cAge = cAge;
	}
	public String getcPhone() {
		return cPhone;
	}
	public void setcPhone(String cPhone) {
		this.cPhone = cPhone;
	}
	public String getcIdNumber() {
		return cIdNumber;
	}
	public void setcIdNumber(String cIdNumber) {
		this.cIdNumber = cIdNumber;
	}
	public String getcEmail() {
		return cEmail;
	}
	public void setcEmail(String cEmail) {
		this.cEmail = cEmail;
	}
	public String getcType() {
		return cType;
	}
	public void setcType(String cType) {
		this.cType = cType;
	}
	@Override
	public String toString() {
		return "Customer [cId=" + cId + ", cAccount=" + cAccount + ", cPassword=" + cPassword + ", cRealName="
				+ cRealName + ", cAge=" + cAge + ", cPhone=" + cPhone + ", cIdNumber=" + cIdNumber + ", cEmail="
				+ cEmail + ", cType=" + cType + "]";
	}
	
	
}
