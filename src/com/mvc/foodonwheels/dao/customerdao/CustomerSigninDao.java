package com.mvc.foodonwheels.dao.customerdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.foodonwheels.beans.customerbean.CustomerSigninBean;
import com.mvc.foodonwheels.dao.customerdao.DBDAO;

public class CustomerSigninDao {
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
	public boolean insertUserData(CustomerSigninBean customerSigninBean){
		try {
			con=getDbConnection();
	        pst=con.prepareStatement("insert into TBL_CUSTOMER_REGISTER(CUSTOMER_NAME,CUSTOMER_PHONE,CUSTOMER_EMAIL,CUSTOMER_HOUSENAME,CUSTOMER_PINCODE,CUSTOMER_USERNAME,CUSTOMER_PASSWORD)values(?,?,?,?,?,?,?)");
	        pst.setString(1, customerSigninBean.getName());
	        pst.setString(2, customerSigninBean.getPhone());
	        pst.setString(3, customerSigninBean.getUemail());
	        pst.setString(4, customerSigninBean.getHousename());
	        pst.setString(5, customerSigninBean.getPincode());
	        pst.setString(6, customerSigninBean.getUsername());
	        pst.setString(7, customerSigninBean.getPasswordd());
	        i=pst.executeUpdate();
	        if(i>0){
	        	flag=true;
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	public ArrayList<CustomerSigninBean> selectUserFromDb(CustomerSigninBean customerSigninBean){
		ArrayList<CustomerSigninBean> csb=new ArrayList<CustomerSigninBean>();
		try {
			con=getDbConnection();
	        pst=con.prepareStatement("select * from TBL_CUSTOMER_REGISTER where CUSTOMER_USERNAME=? and CUSTOMER_PASSWORD=?");
	        pst.setString(1, customerSigninBean.getUsername());
	        pst.setString(2, customerSigninBean.getPasswordd());
	        rs=pst.executeQuery();
	        while (rs.next()) {
	        	CustomerSigninBean userData=new CustomerSigninBean();
	        	userData.setUserid(rs.getInt("CUSTOMER_ID"));
	        	userData.setName(rs.getString("CUSTOMER_NAME"));
	        	userData.setPhone(rs.getString("CUSTOMER_PHONE"));
	        	userData.setUemail(rs.getString("CUSTOMER_EMAIL"));
	        	userData.setUsername(rs.getString("CUSTOMER_USERNAME"));
	        	userData.setPasswordd(rs.getString("CUSTOMER_PASSWORD"));
	        	userData.setHousename(rs.getString("CUSTOMER_HOUSENAME"));
	        	userData.setPincode(rs.getString("CUSTOMER_PINCODE"));
				csb.add(userData);
			}
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
		return csb;
	}
	
}
