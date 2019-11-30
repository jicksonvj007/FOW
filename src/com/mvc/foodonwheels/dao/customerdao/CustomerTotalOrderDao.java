package com.mvc.foodonwheels.dao.customerdao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mvc.foodonwheels.beans.customerbean.CustomerTotalOrderBean;

public class CustomerTotalOrderDao {
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
		public boolean insertCpmpleteOrderData(CustomerTotalOrderBean customerTotalOrderBean) {
			try {
				con = getDbConnection();
				pst = con.prepareStatement(
						"insert into TB_CUSTOMER_TOTAL_ORDER(TORDER_COUNT,TORDER_PRICE,TORDER_DATE,CUSTOMER_ID)values(?,?,?,?)");
				pst.setInt(1, customerTotalOrderBean.getTorderCount());
				pst.setInt(2, customerTotalOrderBean.getTorderPrice());
				pst.setInt(4, customerTotalOrderBean.getCustomerId());
				java.util.Date today = new java.util.Date();
				Date date = new java.sql.Date(today.getTime());
				pst.setDate(3, date);
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
