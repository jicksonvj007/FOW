package com.mvc.foodonwheels.dao.carrierDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.foodonwheels.beans.carrierBean.CarrierBean;

public class CarrierDAO {
	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rs = null;
	static boolean flag = false;

	// ------------------------Get Connection-----START--------------------//
	/**
	 *
	 * @author : ANU
	 * @see : DBDAO.connect()
	 * @return : Connection
	 * @version : 1.0
	 * @purpose : Database Connection
	 * @param :
	 *            Nothing
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

	// -------------------------Get Connection-----END---------------------//

	// ------------------------check username-----START--------------------//
	/**
	 *
	 * @author : ANU
	 * @see : Nothing
	 * @return : ResultSet
	 * @version : 1.0
	 * @purpose : to check username
	 * @param :  Nothing
	 *            
	 */
	public static ResultSet check(CarrierBean carrierBean) throws SQLException {
		try {
			con = getDbConnection();
			pst = con.prepareStatement(
					"select carrier_name,CARRIER_PASSWORD from tbl_carriers_list where carrier_name=? and carrier_password=?");
			pst.setString(1, carrierBean.getName());
			pst.setString(2, carrierBean.getPswd());
			rs = pst.executeQuery();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	// ----------------------check username-----END--------------------------------//
	
	// ------------------------view orders-----START--------------------------------//
		/**
		 *
		 * @author : ANU
		 * @see : Nothing
		 * @return : ArrayList
		 * @version : 1.0
		 * @purpose : to view orders list
		 * @param :  name
		 *            
		 */

	public static ArrayList<CarrierBean> viewOrderTable(String name) throws SQLException {
		ArrayList<CarrierBean> lb = new ArrayList<CarrierBean>();
		try {
			con = getDbConnection();
			pst = con.prepareStatement(
					"select * from tbl_orders_list where order_status='packed' or order_status='picked up' or order_status='delivered'");
			rs = pst.executeQuery();
			while (rs.next()) {
				CarrierBean carrierBean = new CarrierBean();
				carrierBean.setOid(rs.getInt(1));
				carrierBean.setOstatus(rs.getString(2));
				carrierBean.setOdate(rs.getString(3));
				carrierBean.setHid(rs.getInt(4));
				carrierBean.setCid(rs.getInt(5));
				carrierBean.setIid(rs.getInt(6));
				lb.add(carrierBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lb;
	}
	
	// ------------------------view orders-----END--------------------------------//
	
	// ------------------------change status pickup-----START--------------------------------//
			/**
			 *
			 * @author : ANU
			 * @see : Nothing
			 * @return : boolean
			 * @version : 1.0
			 * @purpose : to update status to picked up
			 * @param :  Nothing
			 *            
			 */
	
	

	public static boolean updateStatusp(CarrierBean carrierBean) throws SQLException {
		boolean flag = false;
		try {
			con = getDbConnection();
			pst = con.prepareStatement("update tbl_orders_list set order_status='picked up' where order_id=?");
			pst.setInt(1, carrierBean.getOid());
			pst.executeUpdate();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	// ------------------------change status pickup-----END--------------------------------//
	
	// ------------------------change status delivered-----START--------------------------------//
				/**
				 *
				 * @author : ANU
				 * @see : Nothing
				 * @return : boolean
				 * @version : 1.0
				 * @purpose : to update status to delivered
				 * @param :  Nothing
				 *            
				 */

	public static boolean updateStatusd(CarrierBean carrierBean) throws SQLException {
		boolean flag = false;
		try {
			con = getDbConnection();
			pst = con.prepareStatement("update tbl_orders_list set order_status='delivered' where order_id=?");
			pst.setInt(1, carrierBean.getOid());
			pst.executeUpdate();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	// ------------------------change status delivered-----END--------------------------------//

}
