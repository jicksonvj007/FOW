package com.mvc.foodonwheels.adminDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mvc.foodonwheels.adminBeans.OrderCustomerBean;

public class OrderDAO {
	static Connection con=null;
    static PreparedStatement pst=null;
    static ResultSet rs=null;
	 static boolean flag=false;
	//----------
	 /**
	  *
	  * @author : Jickson 
	  * @date   : 14/11/2019
		 * @version: 1.0
		 * @purpose: connectivity
		 * @param  : Nothing
		 * @throws :Exception in case of connection
		 * @return : Connection
	  */
    
  public static Connection getDbConnection()throws SQLException{  
		try{
				DBDAO.connect();
				con=DBDAO.getDbCon();		   
		}catch(ClassNotFoundException  ex)		   {
			 ex.printStackTrace();
		}catch(SQLException e)		{
			e.printStackTrace();
		}
		return con;
  }
  //------------------
  //-----------------from  view report
  /**
  *
  * @author : Jickson 
  * @date   : 16/10/2019
	 * @version: 1.0
	 * @purpose: user order view
	 * @param  : orderCustomerBean
	 * @throws :Exception in case of connection
	 * @return : ResultSet
  */
  
  public static ResultSet viewOrderDetails(OrderCustomerBean orderCustomerBean) throws SQLException{
	   try{
	            
	       con=getDbConnection();
	       pst=con.prepareStatement("select TBL_CUSTOMER_REGISTER.CUSTOMER_NAME,TBL_CUSTOMER_REGISTER.CUSTOMER_EMAIL,TBL_ORDERS_LIST.ORDER_STATUS from TBL_CUSTOMER_REGISTER inner join TBL_ORDERS_LIST on TBL_CUSTOMER_REGISTER.CUSTOMER_ID=? and TBL_ORDERS_LIST.CUSTOMER_ID=?");
	       //TBL_CUSTOMER.C_ID
	       pst.setInt(1, orderCustomerBean.getcId());
	       pst.setInt(2, orderCustomerBean.getcId());
	       rs=pst.executeQuery();    
	     } catch(Exception e){
	        e.printStackTrace();
	     }	
	    return rs;	        
	  } 
  //---------------------------- from view successful order
  /**
  *
  * @author : Jickson 
  * @date   : 15/10/2019
	 * @version: 1.0
	 * @purpose: successful order view
	 * @param  : orderCustomerBean
	 * @throws :Exception in case of connection
	 * @return : int
  */
  
  public static int viewSuccessfulOrder(OrderCustomerBean orderCustomerBean) throws SQLException{
	  int c=0;
	  try{
	            
	       con=getDbConnection();
	       String dt=orderCustomerBean.getoDate().toString();
	       pst=con.prepareStatement("select count(*) from TBL_ORDERS_LIST where ORDER_STATUS='delivered' and ORDER_DATE= date '"+dt+"'");
	       rs=pst.executeQuery();      
	       while(rs.next()){
	       	c=rs.getInt(1);
	       	System.out.print("conut...."+c);	
	       }
	     } catch(Exception e){
	        e.printStackTrace();
	     }
	
	    return c;
	        
	  } 
  //---------------------------
//---------------------------- from view pending order
  /**
  *
  * @author : Jickson 
  * @date   : 17/10/2019
	 * @version: 1.0
	 * @purpose: view pending order
	 * @param  : orderCustomerBean
	 * @throws :Exception in case of connection
	 * @return : int
  */
  
  public static int viewPendingOrder(OrderCustomerBean orderCustomerBean) throws SQLException{
	  int c=0;
	  try{     
	       con=getDbConnection();
	       String dt=orderCustomerBean.getoDate().toString();
	       pst=con.prepareStatement("select count(*) from TBL_ORDERS_LIST where ORDER_STATUS != 'delivered' and ORDER_STATUS != 'canceled' and ORDER_DATE = date '"+dt+"'");
	       rs=pst.executeQuery();                                   
	       System.out.print("count:"+c);
	       while(rs.next()){
	       	c=rs.getInt(1);
	       	System.out.print("conut...."+c);
	       }
	     } catch(Exception e){
	        e.printStackTrace();
	     }
	    return c;	        
	  } 
  //---------------------------end-------------
}
