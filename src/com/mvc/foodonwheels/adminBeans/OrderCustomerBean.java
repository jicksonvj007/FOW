package com.mvc.foodonwheels.adminBeans;
import java.sql.Date;
public class OrderCustomerBean {
	private int cId;
	private String cName;
	private String cEmail;
	private String cPassword;
	private String cAddress;
	private String uName;
	private int cPincode;
	
	private int oId;
	private int oHotelId;
	private int oCustomerId;
	private int oItemId;
	private String oStatus;
	private Date oDate;
	
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
	public Date getoDate() {
		return oDate;
	}
	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcEmail() {
		return cEmail;
	}
	public void setcEmail(String cEmail) {
		this.cEmail = cEmail;
	}
	public String getcPassword() {
		return cPassword;
	}
	public void setcPassword(String cPassword) {
		this.cPassword = cPassword;
	}
	public String getcAddress() {
		return cAddress;
	}
	public void setcAddress(String cAddress) {
		this.cAddress = cAddress;
	}
	public int getoId() {
		return oId;
	}
	public void setoId(int oId) {
		this.oId = oId;
	}
	public int getoHotelId() {
		return oHotelId;
	}
	public void setoHotelId(int oHotelId) {
		this.oHotelId = oHotelId;
	}
	public int getoCustomerId() {
		return oCustomerId;
	}
	public void setoCustomerId(int oCustomerId) {
		this.oCustomerId = oCustomerId;
	}
	public int getoItemId() {
		return oItemId;
	}
	public void setoItemId(int oItemId) {
		this.oItemId = oItemId;
	}
	public String getoStatus() {
		return oStatus;
	}
	public void setoStatus(String oStatus) {
		this.oStatus = oStatus;
	}	
}
