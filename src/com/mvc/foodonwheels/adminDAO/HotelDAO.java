package com.mvc.foodonwheels.adminDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mvc.foodonwheels.adminBeans.HotelBean;

public class HotelDAO {
	static Connection con=null;
    static PreparedStatement pst=null;
    static ResultSet rs=null;
	 static boolean flag=false;
	//----------
	 /**
	  *
	  * @author : Jickson 
	  * @date   : 17/11/2019
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
		   
		}	catch(ClassNotFoundException  ex)		   {
			 ex.printStackTrace();
		}catch(SQLException e)		{
			e.printStackTrace();
		}
		return con;
  }
//-------------------------
  //-----------------
  /**
  *
  * @author : Jickson 
  * @date   : 17/11/2019
	 * @version: 1.0
	 * @purpose: hotel view
	 * @param  : Nothing
	 * @throws :Exception in case of connection
	 * @return : ResultSet
  */
  
  public static ResultSet viewHotel() throws SQLException{
	   try{
	            
	       con=getDbConnection();
	       pst=con.prepareStatement("select * from TBL_HOTELS_LIST");
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
	 * @purpose: delete hotel
	 * @param  : hotelBean
	 * @throws :Exception in case of connection
	 * @return : boolean
  */
  public static boolean deleteHotel(HotelBean hotelBean){
	   try{
	   con=getDbConnection();
	   pst=con.prepareStatement("delete from TBL_HOTELS_LIST where HOTEL_ID=?");
	   pst.setInt(1,hotelBean.getHId());
	   pst.executeUpdate();
	   flag=true;
	   System.out.print("hotel deleted");
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
  * @date   : 16/10/2019
	 * @version: 1.0
	 * @purpose: Get Hotel Details
	 * @param  : hotelBean
	 * @throws :Exception in case of connection
	 * @return : ResultSet
  */
  public static ResultSet getHotelDetails(HotelBean hotelBean) throws SQLException{
	   try{            
	       con=getDbConnection();
	       pst=con.prepareStatement("select * from TBL_HOTELS_LIST where HOTEL_ID=?");
	       pst.setInt(1,hotelBean.getHId());
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
  * @date   : 16/11/2019
	 * @version: 1.0
	 * @purpose: edit hotel 
	 * @param  : hotelBean
	 * @throws :Exception in case of connection
	 * @return : boolean
  */
  public static boolean editHotelActions(HotelBean hotelBean){
	   try{
		   con=getDbConnection();
		   pst=con.prepareStatement("update TBL_HOTELS_LIST set HOTEL_NAME=?,HOTEL_STREET_NAME=?,HOTEL_LOCALITY=?,HOTEL_DISTRICT=?,HOTEL_PASSWORD=? where HOTEL_ID=?");
		   pst.setString(1,hotelBean.getHName());
		   pst.setString(2,hotelBean.getHAddress());
		   pst.setString(3, hotelBean.gethLocality());
		   pst.setString(4, hotelBean.gethDistrict());
		   pst.setString(5, hotelBean.gethPassword());
		   pst.setInt(6, hotelBean.getHId());
		   rs=pst.executeQuery();
		   flag=true;
	   }catch(Exception e){
		   e.printStackTrace();
	   }
	   return flag;
  }
  //--------------

  /**
  *
  * @author : Jickson 
  * @date   : 17/11/2019
	 * @version: 1.0
	 * @purpose: add hotels 
	 * @param  : hotelBean
	 * @throws :Exception in case of connection
	 * @return : boolean
  */
  public static boolean insertHotel(HotelBean hotelBean) throws SQLException{
     
      try{
          
      con=getDbConnection();
      pst=con.prepareStatement("insert into TBL_HOTELS_LIST(HOTEL_NAME,HOTEL_STREET_NAME,HOTEL_LOCALITY,HOTEL_DISTRICT,HOTEL_PASSWORD)values(?,?,?,?,?)");
      pst.setString(1, hotelBean.getHName());
      pst.setString(2, hotelBean.getHAddress());
      pst.setString(3, hotelBean.gethLocality());
      pst.setString(4, hotelBean.gethDistrict());
      pst.setString(5, hotelBean.gethPassword());
      pst.executeUpdate();
      flag=true;
  } catch(Exception e){
      e.printStackTrace();
  }
  return flag;
      
}
  

//---------------------end------------
}
