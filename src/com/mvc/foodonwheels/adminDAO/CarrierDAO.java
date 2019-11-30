package com.mvc.foodonwheels.adminDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mvc.foodonwheels.adminBeans.CarrierBean;

public class CarrierDAO {
	 static Connection con=null;
     static PreparedStatement pst=null;
     static ResultSet rs=null;
	 static boolean flag=false;
	//----------
	 /**
	    *
	    * @author : Jickson 
	    * @date   : 13/11/2019
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
     
   //-----------------
   /**
   *
   * @author : Jickson 
   * @date   : 13/11/2019
 	 * @version: 1.0
 	 * @purpose: carrier view
 	 * @param  : Nothing
 	 * @throws :Exception in case of connection
 	 * @return : ResultSet
   */
   
   public static ResultSet viewCarrier() throws SQLException{
 	   try{
 	            
 	       con=getDbConnection();
 	       pst=con.prepareStatement("select * from TBL_CARRIERS_LIST");
 	       rs=pst.executeQuery();
 	        
 	        
 	     } catch(Exception e){
 	        e.printStackTrace();
 	     }
 	
 	    return rs;
 	        
 	  } 
   //----------------------------
   
   //----------------------------
   /**
   *
   * @author : Jickson 
   * @date   : 13/11/2019
 	 * @version: 1.0
 	 * @purpose: delete carrier
 	 * @param  : carrierBean
 	 * @throws :Exception in case of connection
 	 * @return : boolean
   */
   public static boolean deleteCarrier(CarrierBean carrierBean){
 	   try{
 	   con=getDbConnection();
 	   pst=con.prepareStatement("delete from TBL_CARRIERS_LIST where CARRIER_ID=?");
 	   pst.setInt(1,carrierBean.getCarrierId());
 	   pst.executeUpdate();
 	   flag=true;
 	   System.out.print("carrier deleted");
 	   }catch(Exception e){
 		   e.printStackTrace();
 	   }
 	   return flag;
   }
   //-----------------
 
   //-----------------
   /**
   *
   * @author : Jickson 
   * @date   : 14/10/2019
 	 * @version: 1.0
 	 * @purpose: get carrier details
 	 * @param  : carrierBean
 	 * @throws :Exception in case of connection
 	 * @return : ResultSet
   */
   
   public static ResultSet getCarrierDetails(CarrierBean carrierBean) throws SQLException{
 	   try{
 	            
 	       con=getDbConnection();
 	       pst=con.prepareStatement("select * from TBL_CARRIERS_LIST where CARRIER_ID=?");
 	       pst.setInt(1,carrierBean.getCarrierId());
 	       rs=pst.executeQuery();
 	     } catch(Exception e){
 	        e.printStackTrace();
 	     }
 	
 	    return rs;
 	        
 	  } 
   //----------------------------
   
   //----------------------------
   /**
   *
   * @author : Jickson 
   * @date   : 15/11/2019
 	 * @version: 1.0
 	 * @purpose: edit carriers action page
 	 * @param  : carrierBean
 	 * @throws : Exception in case of connection
 	 * @return : boolean
   */
   public static boolean editCarrierActions(CarrierBean carrierBean){
 	   try{
 		   con=getDbConnection();
 		   pst=con.prepareStatement("update TBL_CARRIERS_LIST set CARRIER_NAME=?,CARRIER_PASSWORD=? where CARRIER_ID=?");
 		   pst.setString(1,carrierBean.getCarrierName());
 		   pst.setString(2,carrierBean.getCarrierPassword());
 		   pst.setInt(3, carrierBean.getCarrierId());
 		   rs=pst.executeQuery();
 		   flag=true;
 	   }catch(Exception e){
 		   e.printStackTrace();
 	   }
 	   return flag;
   }
   //--------------
   
 //-------------
   /**
   *
   * @author : Jickson 
   * @date   : 15/11/2019
 	 * @version: 1.0
 	 * @purpose: add carrier 
 	 * @param  : carrierBean
 	 * @throws :Exception in case of connection
 	 * @return : boolean
   */
   
   
   
   public static boolean insertCarrier(CarrierBean carrierBean) throws SQLException{
      
       try{
           
       con=getDbConnection();
       pst=con.prepareStatement("insert into TBL_CARRIERS_LIST(CARRIER_NAME,CARRIER_PASSWORD)values(?,?)");
       pst.setString(1, carrierBean.getCarrierName());
       pst.setString(2, carrierBean.getCarrierPassword()); 
       pst.executeUpdate();
       flag=true;
   } catch(Exception e){
       e.printStackTrace();
   }
   return flag;
       
 }
   
 //--------------------- end-------------------
   
}
