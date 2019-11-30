package com.mvc.foodonwheels.dao.customerdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.foodonwheels.beans.customerbean.CustomerViewItemsBean;

public class CustomerViewItemsDao {
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
		public ArrayList<CustomerViewItemsBean> selectItemsFromDb(CustomerViewItemsBean customerViewItemsBean){
			ArrayList<CustomerViewItemsBean> al=new ArrayList<CustomerViewItemsBean>();
			try {
				con=getDbConnection();
		        pst=con.prepareStatement("select * from TBL_ITEMS_LIST where HOTEL_ID=?");
		        pst.setInt(1, customerViewItemsBean.getHotelId());
		        rs=pst.executeQuery();
		        while (rs.next()) {
		        	CustomerViewItemsBean bean=new CustomerViewItemsBean();
		        	bean.setItemId(rs.getInt("ITEM_ID"));
		        	bean.setItemName(rs.getString("ITEM_NAME"));
		        	bean.setItemPrice(rs.getString("ITEM_PRICE"));
		        	bean.setHotelId(rs.getInt("HOTEL_ID"));
		        	al.add(bean);
		        }
			}catch(Exception e){
				e.printStackTrace();
			}
			return al;
		}
		public ArrayList<CustomerViewItemsBean> selectOneItemFromDb(CustomerViewItemsBean customerViewItemsBean){
			ArrayList<CustomerViewItemsBean> al=new ArrayList<CustomerViewItemsBean>();
			try {
				con=getDbConnection();
		        pst=con.prepareStatement("select * from TBL_ITEMS_LIST where ITEM_ID=?");
		        pst.setInt(1, customerViewItemsBean.getItemId());
		        rs=pst.executeQuery();
		        while (rs.next()) {
		        	CustomerViewItemsBean bean=new CustomerViewItemsBean();
		        	bean.setItemId(rs.getInt("ITEM_ID"));
		        	bean.setItemName(rs.getString("ITEM_NAME"));
		        	bean.setItemPrice(rs.getString("ITEM_PRICE"));
		        	bean.setHotelId(rs.getInt("HOTEL_ID"));
		        	al.add(bean);
		        }
			}catch(Exception e){
				e.printStackTrace();
			}
			return al;
		}
}
