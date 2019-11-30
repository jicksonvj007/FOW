
  package com.mvc.foodonwheels.beans.hotelbean;
import java.sql.Date;
public class HotelBean {
	    private String user;
	    private String pass;
	    private String item;
	    private int itmNo;
	    private int amount;
	    private int hid;
	    private int iid;
	    private int oid;
	    
	    
		
		public int getOid() {
			return oid;
		}
		public void setOid(int oid) {
			this.oid = oid;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		public int getCid() {
			return cid;
		}
		public void setCid(int cid) {
			this.cid = cid;
		}
		private String status;
	    private String date;
	    private int cid;
		
		public int getIid() {
			return iid;
		}
		public void setIid(int iid) {
			this.iid = iid;
		}
		public int getHid() {
			return hid;
		}
		public void setHid(int hid) {
			this.hid = hid;
		}
		public String getItem() {
			return item;
		}
		public void setItem(String item) {
			this.item = item;
		}
		public int getItmNo() {
			return itmNo;
		}
		public void setItmNo(int itmno) {
			this.itmNo = itmno;
		}
		public int getAmount() {
			return amount;
		}
		public void setAmount(int amount) {
			this.amount = amount;
		}
		public String getUser() {
			return user;
		}
		public void setUser(String user) {
			this.user = user;
		}
		public String getPass() {
			return pass;
		}
		public void setPass(String pass) {
			this.pass = pass;
		}
		public String getUpdtor1() {
			// TODO Auto-generated method stub
			return null;
		}
	    
	    
}