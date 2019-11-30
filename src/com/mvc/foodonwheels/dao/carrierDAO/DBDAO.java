package com.mvc.foodonwheels.dao.carrierDAO;
//package com.mvc.foodonwheels.adminDAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DBDAO {
    private static Connection dbCon;
	private static String dbURL;
	private static String dbDriver;
	private static String userName;
	private static String passWord;
	
//--------------START------database initialization---------------//
	/**
	 *
	 * @author : ANU
	 * @date   : 30/10/2019
	 * @version: 1.0
	 * @purpose: Initialize database connection values
	 * @param  : Nothing
	 * @return : Nothing
	 * @see    : Nothing
	 */
	private static void dbInit(){		
	    try{		
		    dbDriver="oracle.jdbc.driver.OracleDriver";
		    dbURL="jdbc:oracle:thin:@localhost:1521:xe";
		    userName="project";
		    passWord="project";
	    }
	    catch(Exception e){
		    e.printStackTrace();
	    }
	}
	
	//-------------END---------database initialization---------------//	
	
	//--------------START----------database connection ------------//
	/**
	 *
	 * @author : ANU
	 * @date   : 30/10/2019
	 * @version: 1.0
	 * @purpose: database connection 
	 * @param  : Nothing
     * @throws :Exception in case of missing driver class
	 * @return : Connection
	 * @see    : dbInit
	  */
	public static void connect()throws ClassNotFoundException,SQLException{
		dbInit();
		try{
			Class.forName(dbDriver);
			Connection con=DriverManager.getConnection(dbURL,userName,passWord);
			setDbCon(con);
		}catch(ClassNotFoundException cnfe){
			cnfe.printStackTrace();			
		}
	}
	
	//------------------END-------------database connection---------------//
	
	//--------------START----------get  connection ------------//	
	/**
	 *
	 * @author : ANU
	 * @date   : 30/10/2019
	 * @version: 1.0
	 * @purpose: Get Connection
	 * @param  : Nothing
	 * @return : Connection
	 * @see    : Nothing
	 */
	public static Connection getDbCon(){
		return dbCon;
	}
	
	//------------------END-------------get connection--------------//
	
	//--------------START----------set connection------------------//
	/**
	 *
	 * @author : ANU 
	 * @date   : 30/10/2019
	 * @version: 1.0
	 * @purpose: set connection
	 * @param  : Connection
	 * @return : Nothing
	 */
	public static void setDbCon(Connection con){
		dbCon=con;
	}
	
	//------------------END-------------set connection--------------//
	
	//--------------START----------close connection ---------------//
	/**
	 *
	 * @author : ANU 
	 * @date   :  30/10/2019
	 * @version: 1.0
	 * @purpose: Close connection 
	 * @param  : Nothing
     * @throws :Exception in case of closing connection
	 * @return : Nothing
	 * @see    : Nothing
	 */
	public static void close()throws SQLException{
		dbCon.close();
	}
	
	//------------------END-------------closing connection-----------//
}
