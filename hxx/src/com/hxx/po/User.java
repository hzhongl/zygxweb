package com.hxx.po;

public class User {
	
	private Integer uId;
	
	private String uAccount;
	
	private String uPassword;
	
	private String uRealName;
	
	private String uAge;
	
	private String uPhone;
	
	private String uIdNumber;
	
	private String uEmail;

	public Integer getuId() {
		return uId;
	}

	public void setuId(Integer uId) {
		this.uId = uId;
	}

	public String getuAccount() {
		return uAccount;
	}

	public void setuAccount(String uAccount) {
		this.uAccount = uAccount;
	}

	public String getuPassword() {
		return uPassword;
	}

	public void setuPassword(String uPassword) {
		this.uPassword = uPassword;
	}

	public String getuRealName() {
		return uRealName;
	}

	public void setuRealName(String uRealName) {
		this.uRealName = uRealName;
	}

	public String getuAge() {
		return uAge;
	}

	public void setuAge(String uAge) {
		this.uAge = uAge;
	}

	public String getuPhone() {
		return uPhone;
	}

	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}

	public String getuIdNumber() {
		return uIdNumber;
	}

	public void setuIdNumber(String uIdNumber) {
		this.uIdNumber = uIdNumber;
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}

	@Override
	public String toString() {
		return "User [uId=" + uId + ", uAccount=" + uAccount + ", uPassword=" + uPassword + ", uRealName=" + uRealName
				+ ", uAge=" + uAge + ", uPhone=" + uPhone + ", uIdNumber=" + uIdNumber + ", uEmail=" + uEmail + "]";
	}

	

}
