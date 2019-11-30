package com.mvc.foodonwheels.adminBeans;

import java.sql.Date;

public class OrderBean {
	private int oId;
	private int oHotelId;
	private int oCustomerId;
	private int oItemId;
	private String oStatus;
	private Date oDate;
	public Date getoDate() {
		return oDate;
	}
	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}	
	public int getOId() {
		return oId;
	}
	public void setOId(int oId) {
		this.oId = oId;
	}
	public int getOHotelId() {
		return oHotelId;
	}
	public void setOHotelId(int oHotelId) {
		this.oHotelId = oHotelId;
	}
	public int getOCustomerId() {
		return oCustomerId;
	}
	public void setOCustomerId(int oCustomerId) {
		this.oCustomerId = oCustomerId;
	}
	public int getOItemId() {
		return oItemId;
	}
	public void setOItemId(int oItemId) {
		this.oItemId = oItemId;
	}
	public String getOStatus() {
		return oStatus;
	}
	public void setOStatus(String oStatus) {
		this.oStatus = oStatus;
	}
}
