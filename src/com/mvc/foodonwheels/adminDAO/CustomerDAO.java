package com.mvc.foodonwheels.adminDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mvc.foodonwheels.adminBeans.CustomerBean;

public class CustomerDAO {
	 static Connection con=null;
     static PreparedStatement pst=null;
     static ResultSet rs=null;
	 static boolean flag=false;
	//----------
	 /**
-	     *
 	     * @author : Jickson 
	     * @date   : 13/10/2019
		 * @version: 1.0
		 * @purpose: get connection
		 * @param  : Nothing
		 * @throws :Exception in case of connection
		 * @return : Connectivity
	   */
     
   public static Connection getDbConnection()throws SQLException{
		try{
				DBDAO.connect();
				con=DBDAO.getDbCon();		   
		}	catch(ClassNotFoundException  ex)		   {
			 ex.printStackTrace();
		}catch(SQLException e)		{
			e.printStackTrace();
		}
		return con;
   }
 //------------- insert
   /**
   *
   * @author : Jickson 
   * @date   : 14/10/2019
	 * @version: 1.0
	 * @purpose: insert user
	 * @param  : customerBean
	 * @throws :Exception in case of connection
	 * @return : boolean
   */
   
   
   public static boolean insert(CustomerBean customerBean) throws SQLException{
       try{
       con=getDbConnection();
       pst=con.prepareStatement("insert into TBL_CUSTOMER_REGISTER(CUSTOMER_NAME,CUSTOMER_EMAIL,CUSTOMER_PASSWORD,CUSTOMER_HOUSENAME,CUSTOMER_PHONE)values(?,?,?,?,?)");
       pst.setString(1, customerBean.getCName());
       pst.setString(2, customerBean.getCEmail());
       pst.setString(3, customerBean.getCPassword());
       pst.setString(4, customerBean.getCAddress());
       pst.setString(5, customerBean.getCMobile());
       pst.executeUpdate();
       flag=true;
       System.out.println("inserted");
   } catch(Exception e){
       e.printStackTrace();
   }
   return flag;    
   }
   
   //--------------------------
   
   //-----------------
   /**
   *
   * @author : Jickson 
   * @date   : 16/10/2019
	 * @version: 1.0
	 * @purpose: user view
	 * @param  : Nothing
	 * @throws :Exception in case of connection
	 * @return : ResultSet
   */
   
   public static ResultSet viewConsumers() throws SQLException{
	   try{
	            
	       con=getDbConnection();
	       pst=con.prepareStatement("select * from TBL_CUSTOMER_REGISTER");
	       rs=pst.executeQuery();
	        
	        
	     } catch(Exception e){
	        e.printStackTrace();
	     }
	
	    return rs;
	        
	  } 
   //---------------------------- 
   /**
   *
   * @author : Jickson 
   * @date   : 15/11/2019
	 * @version: 1.0
	 * @purpose: delete customer
	 * @param  : customerBean
	 * @throws :Exception in case of connection
	 * @return : boolean
   */
   public static boolean deleteCustomer(CustomerBean customerBean){
	   try{
	   con=getDbConnection();
	   pst=con.prepareStatement("delete from TBL_CUSTOMER_REGISTER where CUSTOMER_ID=?");
	   pst.setInt(1,customerBean.getCId());
	   pst.executeUpdate();
	   flag=true;
	   System.out.print("customer deleted");
	   }catch(Exception e){
		   e.printStackTrace();
	   }
	   return flag;
   }
   //-----------------
   /**
   *
   * @author : Jickson 
   * @date   : 15/10/2019
	 * @version: 1.0
	 * @purpose: getConsumers details
	 * @param  : customerBean
	 * @throws :Exception in case of connection
	 * @return : ResultSet
    */
/*  
   public static ResultSet getConsumers(CustomerBean customerBean) throws SQLException{
	   try{
	            
	       con=getDbConnection();
	       pst=con.prepareStatement("select * from TBL_CUSTOMER_REGISTER where CUSTOMER_ID=?");
	       pst.setInt(1,customerBean.getCId());
	       rs=pst.executeQuery();
	        
	        
	     } catch(Exception e){
	        e.printStackTrace();
	     }
	
	    return rs;
	        
	  } 
*/   //----------------------------
   
   /**
   *
   * @author : Jickson 
   * @date   : 11/11/2019
	 * @version: 1.0
	 * @purpose: edit customer 
	 * @param  : Nothing
	 * @throws :Exception in case of connection
	 * @return : boolean
   */
/*   public static boolean editCustomerAction(CustomerBean customerBean){
	   try{
		   con=getDbConnection();
		   pst=con.prepareStatement("update TBL_CUSTOMER_REGISTER set CUSTOMER_NAME=?,CUSTOMER_EMAIL=?,CUSTOMER_PASSWORD=?,CUSTOMER_HOUSENAME=?,CUSTOMER_PHONE=? where CUSTOMER_ID=?");
		   pst.setString(1,customerBean.getCName());
		   pst.setString(2,customerBean.getCEmail());
		   pst.setString(3,customerBean.getCPassword());
		   pst.setString(4,customerBean.getCAddress());
		   pst.setString(5,customerBean.getCMobile());
		   pst.setInt(6, customerBean.getCId());
		   rs=pst.executeQuery();
		   flag=true;
	   }catch(Exception e){
		   e.printStackTrace();
	   }
	   return flag;
   }
*/   //--------------
   
   //---------------------
}
