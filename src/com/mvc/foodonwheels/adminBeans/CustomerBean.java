package com.mvc.foodonwheels.adminBeans;

public class CustomerBean {
	private int cId;
	private String cName;
	private String cEmail;
	private String cPassword;
	private String cMobile;
	private String cAddress;
	private String uName;
	private int cPincode;
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public int getcPincode() {
		return cPincode;
	}
	public void setcPincode(int cPincode) {
		this.cPincode = cPincode;
	}
		public String getCMobile() {
		return cMobile;
	}
	public void setCMobile(String cMobile) {
		this.cMobile = cMobile;
	}
	public int getCId() {
		return cId;
	}
	public void setCId(int cId) {
		this.cId = cId;
	}
	public String getCName() {
		return cName;
	}
	public void setCName(String cName) {
		this.cName = cName;
	}
	public String getCEmail() {
		return cEmail;
	}
	public void setCEmail(String cEmail) {
		this.cEmail = cEmail;
	}
	public String getCPassword() {
		return cPassword;
	}
	public void setCPassword(String cPassword) {
		this.cPassword = cPassword;
	}
	public String getCAddress() {
		return cAddress;
	}
	public void setCAddress(String cAddress) {
		this.cAddress = cAddress;
	}
}
