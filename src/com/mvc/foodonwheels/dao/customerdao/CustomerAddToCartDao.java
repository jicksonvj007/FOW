package com.mvc.foodonwheels.dao.customerdao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.foodonwheels.beans.customerbean.CustomerAddToCartBean;

public class CustomerAddToCartDao {
	// ------------------------
	/**
	 * @author : Archana S
	 * @date : 14-11-2019
	 * @see : DBDAO
	 * @version : 1.0
	 * @purpose : this class is used to do operations in cusomer_register table
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

	// -------------END-----Connection calling Function---------------
	// -------------START-----Insert Function---------------
	public boolean insertToCartData(CustomerAddToCartBean customerAddToCartBean) {
		try {
			con = getDbConnection();
			pst = con.prepareStatement(
					"insert into TBL_CART_LIST(ITEM_ID,CUSTOMER_ID,HOTEL_ID,CURRENT_DATE)values(?,?,?,?)");
			pst.setInt(1, customerAddToCartBean.getItemId());
			pst.setInt(2, customerAddToCartBean.getCustomerId());
			pst.setInt(3, customerAddToCartBean.getHotelId());
			java.util.Date today = new java.util.Date();
			Date date = new java.sql.Date(today.getTime());
			pst.setDate(4, date);
			i = pst.executeUpdate();
			if (i > 0) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public ArrayList<CustomerAddToCartBean> selectFromCartData(CustomerAddToCartBean customerAddToCartBean) {
		ArrayList<CustomerAddToCartBean> al = new ArrayList<CustomerAddToCartBean>();
		try {
			con = getDbConnection();
			pst = con.prepareStatement(
					"select c.CART_ID,c.ITEM_ID,c.CUSTOMER_ID,c.HOTEL_ID,i.ITEM_ID,i.ITEM_NAME,i.ITEM_PRICE from TBL_CART_LIST c,TBL_ITEMS_LIST i where c.ITEM_ID=i.ITEM_ID and c.CUSTOMER_ID=?");
			pst.setInt(1, customerAddToCartBean.getCustomerId());
			rs = pst.executeQuery();
			while (rs.next()) {
				CustomerAddToCartBean bean = new CustomerAddToCartBean();
				bean.setCartId(rs.getInt("CART_ID"));
				bean.setItemId(rs.getInt("ITEM_ID"));
				bean.setCustomerId(rs.getInt("CUSTOMER_ID"));
				bean.setHotelId(rs.getInt("HOTEL_ID"));
				bean.setItemName(rs.getString("ITEM_NAME"));
				bean.setItemPrice(rs.getString("ITEM_PRICE"));
				
				al.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public boolean deleteItemFromCartData(CustomerAddToCartBean customerAddToCartBean) {
		try {
			con = getDbConnection();
			/*
			pst = con.prepareStatement(
					"DELETE FROM TBL_CART_LIST  WHERE CART_ID = (SELECT x.id FROM (SELECT MAX(t.CART_ID) AS id FROM TBL_CART_LIST t where t.item_id=?) x) and CUSTOMER_ID=?");

			pst.setInt(1, customerAddToCartBean.getItemId());
			pst.setInt(2, customerAddToCartBean.getCustomerId());
			*/
			pst = con.prepareStatement(
					"DELETE FROM TBL_CART_LIST  WHERE CART_ID =?");
			pst.setInt(1, customerAddToCartBean.getCartId());
			
			
			i = pst.executeUpdate();
			if (i > 0) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean deleteAllItemsOfaUserFromCartData(CustomerAddToCartBean customerAddToCartBean) {
		try {
			con = getDbConnection();
			pst = con.prepareStatement("delete from TBL_CART_LIST where CUSTOMER_ID=?");
			pst.setInt(1, customerAddToCartBean.getCustomerId());
			i = pst.executeUpdate();
			if (i > 0) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

}
