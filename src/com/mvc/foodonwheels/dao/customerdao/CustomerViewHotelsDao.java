package com.mvc.foodonwheels.dao.customerdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.foodonwheels.beans.customerbean.CustomerViewHotelsBean;

public class CustomerViewHotelsDao {
	// ------------------------
		/**
	    * @author	:	Archana S
	    * @date		:	14-11-2019
	    * @see		:	DBDAO
	    * @version	:	1.0
	    * @purpose	:	this class is used to do operations in cusomer_register table
	    */
	// ---------------------------
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
	public ArrayList<CustomerViewHotelsBean> selectHotelsFromDb(){
		ArrayList<CustomerViewHotelsBean> csb=new ArrayList<CustomerViewHotelsBean>();
		try {
			con=getDbConnection();
	        pst=con.prepareStatement("select * from TBL_HOTELS_LIST");
	        rs=pst.executeQuery();
	        while (rs.next()) {
	        	CustomerViewHotelsBean HotelData=new CustomerViewHotelsBean();
	        	HotelData.setHotelid(rs.getInt("HOTEL_ID"));
	        	HotelData.setHotelname(rs.getString("HOTEL_NAME"));
	        	HotelData.setStreetname(rs.getString("HOTEL_STREET_NAME"));
	        	HotelData.setLocality(rs.getString("HOTEL_LOCALITY"));
	        	HotelData.setDistrict(rs.getString("HOTEL_DISTRICT"));
	        	HotelData.setPassword(rs.getString("HOTEL_PASSWORD"));
				csb.add(HotelData);
			}
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
		return csb;
	}
	
}
