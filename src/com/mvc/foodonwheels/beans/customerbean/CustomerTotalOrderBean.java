package com.mvc.foodonwheels.beans.customerbean;

public class CustomerTotalOrderBean {
	protected int torderCount;
	protected int torderPrice;
	protected int customerId;
	public int getTorderCount() {
		return torderCount;
	}
	public void setTorderCount(int torderCount) {
		this.torderCount = torderCount;
	}
	public int getTorderPrice() {
		return torderPrice;
	}
	public void setTorderPrice(int torderPrice) {
		this.torderPrice = torderPrice;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	
}
