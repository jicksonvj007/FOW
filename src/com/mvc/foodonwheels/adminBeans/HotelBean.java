package com.mvc.foodonwheels.adminBeans;
public class HotelBean {
	private int hId;
	private String hName;
	private String hAddress;	
	private String hLocality;
	private String hDistrict;
	private String hPassword;
	public String gethLocality() {
		return hLocality;
	}
	public void sethLocality(String hLocality) {
		this.hLocality = hLocality;
	}
	public String gethDistrict() {
		return hDistrict;
	}
	public void sethDistrict(String hDistrict) {
		this.hDistrict = hDistrict;
	}
	public String gethPassword() {
		return hPassword;
	}
	public void sethPassword(String hPassword) {
		this.hPassword = hPassword;
	}
	public int getHId() {
		return hId;
	}
	public void setHId(int hId) {
		this.hId = hId;
	}
	public String getHName() {
		return hName;
	}
	public void setHName(String hName) {
		this.hName = hName;
	}
	public String getHAddress() {
		return hAddress;
	}
	public void setHAddress(String hAddress) {
		this.hAddress = hAddress;
	}	
}
