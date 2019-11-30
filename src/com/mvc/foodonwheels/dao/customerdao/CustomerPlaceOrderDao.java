package com.mvc.foodonwheels.dao.customerdao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mvc.foodonwheels.beans.customerbean.CustomerPlaceOrderBean;

public class CustomerPlaceOrderDao {
	//------------------------
	/**
    * @author	:	Archana S
    * @date		:	14-11-2019
    * @see		:	DBDAO
    * @version	:	1.0
    * @purpose	:	this class is used to do operations in cusomer_register table
    */
//---------------------------
static Connection con = null;
static PreparedStatement pst = null;
static ResultSet rs = null;
static boolean flag = false;
static public int i;

// -------------START-----Connection calling Function---------------
public static Connection getDbConnection() throws SQLException {
	try {
		DBDAO.connect();
		con = DBDAO.getDbCon();
	} catch (ClassNotFoundException ex) {
		ex.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return con;
}
// -------------END-----Connection calling Function---------------
// -------------START-----Insert Function---------------
public boolean insertToOrdersData(CustomerPlaceOrderBean customerPlaceOrderBean){
	try {
		con=getDbConnection();
        pst=con.prepareStatement("insert into TBL_ORDERS_LIST(ORDER_STATUS,ORDER_DATE,HOTEL_ID,CUSTOMER_ID,ITEM_ID,ITEM_PRICE)values(?,?,?,?,?,?)");
        pst.setString(1, "New");
        java.util.Date today = new java.util.Date();
    	Date date =new java.sql.Date(today.getTime());
        pst.setDate(2, date);
        pst.setInt(3, customerPlaceOrderBean.getHotelId());
        pst.setInt(4, customerPlaceOrderBean.getCustomerId());
        pst.setInt(5, customerPlaceOrderBean.getItemId());
        pst.setString(6, customerPlaceOrderBean.getItemPrice());
        i=pst.executeUpdate();
        if(i>0){
        	flag=true;
        }
	} catch (Exception e) {
		e.printStackTrace();
	}
	return flag;
}
}
