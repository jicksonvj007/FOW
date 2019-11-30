package com.mvc.foodonwheels.dao.customerdao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/** This class is meant for database connection, The flow is as,
 *	First initialize the variables using dbInit() function
 *	Then The connection is made using the above variables by connect() function
 *	This created connection is set by setter function setDbCon()
 *	Which ever class uses the connection calls getDbCon() function to connect
 *	Finally, the opened connection is closed using close() function
 */
public class DBDAO {
	private static Connection dbCon;
	private static String dbURL;
	private static String dbDriver;
	private static String userName;
	private static String passWord;
	//--------------START------database initialization---------------
		/**
		 * @author	:	Archana S
		 * @date	:	13-11-2019
		 * @version	:	1.0
		 * @purpose	:	To initialize variables
		 * @param	:	Nothing
		 * @return	:	Nothing 
		 */
		private static void dbInit(){
			try{	
				dbDriver="oracle.jdbc.driver.OracleDriver";
				dbURL="jdbc:oracle:thin:@localhost:1521:xe";
				userName="project";
				passWord="project";
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	//--------------END------database initialization---------------
	//--------------START------database connection---------------
		/**
		 * @author	:	Archana S
		 * @date	:	13-11-2019
		 * @version	:	1.0
		 * @purpose	:	To connect to the database
		 * @param	:	Nothing
		 * @return	:	Nothing 
		 * @throws	:	ClassNotFoundException, SQLException
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
	//--------------END------database connection---------------
	//--------------START------database set connection---------------
		/**
		 * @author	:	Archana S
		 * @date	:	13-11-2019
		 * @version	:	1.0
		 * @purpose	:	To set the connection to the database
		 * @param	:	Nothing
		 * @return	:	Nothing 
		 */
		public static void setDbCon(Connection con){
			dbCon=con;
		}
	//--------------END------database set connection---------------
	//--------------START----------database get connection------------
		/**
		 * @author	:	Archana S
		 * @date	:	13-11-2019
		 * @version	:	1.0
		 * @purpose	:	To set the connection to the database
		 * @param	:	Nothing
		 * @return	:	connection to be used in bean class
		 */
		
		public static Connection getDbCon(){
			return dbCon;
		}
		
	//-------------END------------database get connection---------
	//--------------START----------close connection ------------
		/**
		 * @author	:	Archana S
		 * @date	:	13-11-2019
		 * @version	:	1.0
		 * @purpose	:	The connection which is opened is closed
		 * @param	:	Nothing
		 * @return	:	Nothing 
		 * @throws	:	SQLException
		 */
		
		public static void close()throws SQLException{
			dbCon.close();
		}
		//------------------END-------------closing connection---------
}
