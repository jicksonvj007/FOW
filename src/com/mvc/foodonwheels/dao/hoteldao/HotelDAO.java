package com.mvc.foodonwheels.dao.hoteldao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.foodonwheels.beans.hotelbean.HotelBean;

public class HotelDAO {
	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rs = null;
	static int flag = 0;

	// ----------
	/**
	*
	* @author : Manu
	* @date   : 14/11/2019
	* @version: 1.0
	* @purpose: Initialize database connection values
	* @param  : Nothing
	* @return : Nothing
    *
	*/

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
	// -------------
	
	/**
	*
	* @author : Manu
	* @date   : 14/11/2019
	* @version: 1.0
	* @purpose: Login
	* @param  : hotelbean
	* @return : Integer
    *
	*/

	public static int check(HotelBean hotelbean) throws SQLException {
		int count = 0;
		try {

			con = getDbConnection();
			pst = con.prepareStatement(
					"select count(*) as count from TBL_HOTELS_LIST where HOTEL_NAME=? and HOTEL_PASSWORD=? ");
			pst.setString(1, hotelbean.getUser());
			pst.setString(2, hotelbean.getPass());
			rs = pst.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
			flag = 1;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;

	}

	// ------------
	
	/**
	*
	* @author : Manu
	* @date   : 14/11/2019
	* @version: 1.0
	* @purpose: Insert Item
	* @param  : hotelbean
	* @return : Integer
    *
	*/

	public static int item(HotelBean hotelbean) throws SQLException {

		try {

			con = getDbConnection();
			pst = con.prepareStatement("insert into TBL_ITEMS_LIST(ITEM_NAME,ITEM_PRICE,HOTEL_ID) values(?,?,?)");

			pst.setString(1, hotelbean.getItem());
			pst.setInt(2, hotelbean.getAmount());
			pst.setInt(3, hotelbean.getHid());
			pst.executeUpdate();
			flag = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	// ------------
	
	/**
	*
	* @author : Manu
	* @date   : 15/11/2019
	* @version: 1.0
	* @purpose: Delete Item
	* @param  : hotelbean
	* @return : Integer
    *
	*/
	public static int itemDelete(HotelBean hotelbean) throws SQLException {

		try {

			con = getDbConnection();
			pst = con.prepareStatement("delete from TBL_ITEMS_LIST where ITEM_ID=?");
			pst.setInt(1, hotelbean.getIid());
			pst.executeUpdate();
			flag = 1;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	}

	// ------------
	
	/**
	*
	* @author : Manu
	* @date   : 15/11/2019
	* @version: 1.0
	* @purpose: Edit Item
	* @param  : hotelbean
	* @return : Integer
    *
	*/

	public static int itemEdit(HotelBean hotelbean) throws SQLException {

		try {

			con = getDbConnection();
			pst = con.prepareStatement("update TBL_ITEMS_LIST set ITEM_NAME=?,ITEM_PRICE=? where ITEM_ID=?");
			pst.setString(1, hotelbean.getItem());
			pst.setInt(2, hotelbean.getAmount());
			pst.setInt(3, hotelbean.getIid());
			pst.executeUpdate();

			flag = 1;
			System.out.print(hotelbean.getHid());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	}
	// ------------
	
	/**
	*
	* @author : Manu
	* @date   : 15/11/2019
	* @version: 1.0
	* @purpose: Edit Status
	* @param  : hotelbean
	* @return : Integer
    *
	*/

	public static int statusEdit(HotelBean hotelbean) throws SQLException {

		try {

			con = getDbConnection();
			pst = con.prepareStatement("update TBL_ORDERS_LIST set ORDER_STATUS = 'packed' where ORDER_ID=? ");

			pst.setInt(1, hotelbean.getOid());
			pst.executeUpdate();

			flag = 1;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	}
	// ------------
	
	/**
	*
	* @author : Manu
	* @date   : 14/11/2019
	* @version: 1.0
	* @purpose: Get Id
	* @param  : hotelbean
	* @return : Integer
    *
	*/

	public static int takeId(HotelBean hotelbean) throws SQLException {

		int i = 0;
		try {

			con = getDbConnection();
			pst = con.prepareStatement("select HOTEL_ID from TBL_HOTELS_LIST where HOTEL_NAME=? and HOTEL_PASSWORD=?");

			pst.setString(1, hotelbean.getUser());
			pst.setString(2, hotelbean.getPass());
			
System.out.print("user.....:"+hotelbean.getUser());
System.out.print("pass.....:"+hotelbean.getPass());

			rs = pst.executeQuery();
			while (rs.next()) {

				i = rs.getInt(1);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;

	}

	// -----------
	
	/**
	*
	* @author : Manu
	* @date   : 15/11/2019
	* @version: 1.0
	* @purpose: View Order
	* @param  : hotelbean
	* @return : Integer
    *
	*/
	public static ArrayList<HotelBean> orderView(HotelBean hotelbean) throws SQLException {

		ArrayList<HotelBean> lb = new ArrayList<HotelBean>();
		try {

			con = getDbConnection();
			pst = con.prepareStatement("select * from TBL_ORDERS_LIST where HOTEL_ID=?");
			pst.setInt(1, hotelbean.getHid());
			rs = pst.executeQuery();
			while (rs.next()) {
				HotelBean hotelbeans = new HotelBean();
				hotelbeans.setOid(rs.getInt(1));
				hotelbeans.setStatus(rs.getString(2));
				hotelbeans.setDate(rs.getString(3));
				hotelbeans.setHid(rs.getInt(4));
				hotelbeans.setCid(rs.getInt(5));
				hotelbeans.setIid(rs.getInt(6));

				lb.add(hotelbeans);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return lb;

	}

	// -----------
	
	/**
	*
	* @author : Manu
	* @date   : 15/11/2019
	* @version: 1.0
	* @purpose: View items
	* @param  : hotelbean
	* @return : Integer
    *
	*/

	public static ArrayList<HotelBean> itemView(HotelBean hotelbeans) throws SQLException {

		ArrayList<HotelBean> lb = new ArrayList<HotelBean>();
		try {

			con = getDbConnection();
			pst = con.prepareStatement("select * from TBL_ITEMS_LIST where HOTEL_ID=?");
			pst.setInt(1, hotelbeans.getHid());
			rs = pst.executeQuery();
			while (rs.next()) {
				HotelBean hotelbeanss = new HotelBean();
				hotelbeanss.setIid(rs.getInt(1));
				hotelbeanss.setItem(rs.getString(2));
				hotelbeanss.setAmount(rs.getInt(3));
				hotelbeanss.setHid(rs.getInt(4));

				lb.add(hotelbeanss);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return lb;

	}
	// -----------
}
