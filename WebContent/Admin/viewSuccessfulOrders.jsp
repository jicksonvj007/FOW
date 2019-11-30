<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%-- 
    Document   : user view
    Created on : 16-10-2019
    Author     : Jickson
	--%>
<%@page import="com.mvc.foodonwheels.adminDAO.OrderDAO" %>
<%@page import="com.mvc.foodonwheels.adminBeans.OrderCustomerBean" %>
<%@ page import="java.util.ArrayList" %> 
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<div align="right">
<a href="adminHome.jsp">BackToHome</a>
</div>
<div align="center">
<br><table border="2px" style="border-color: #d425b6;BACKGROUND-COLOR: LIGHTGOLDENRODYELLOW;"><tr><td colspan="2" >
<%

	Date odate=new Date(System.currentTimeMillis());
 		
    OrderCustomerBean ocb=new OrderCustomerBean();
    ocb.setoDate(odate);
    //out.println("Date : "+ocb.getoDate());
    out.println("Order Details");
%>
</td></tr>
<%  
	int c=0;
	c=OrderDAO.viewSuccessfulOrder(ocb);
%>
<tr><td>Number of Successful orders on <%out.println(": "+ocb.getoDate()); %></td><td>
<%
	out.println(c);
	/*if(c==0){
		out.println("..........Ther is no Successful orders........ ");
	}*/
%>
</td></tr><tr><td>Number of Pending Orders on <%out.println(": "+ocb.getoDate()); %></td><td>
<%
	int c1=0;
	c1=OrderDAO.viewPendingOrder(ocb);
	out.println(c1);
	/*if(c1==0)
		out.println("..........Ther is no Pending orders.............");
	*/
%>   
</td></tr>
</table> </div>
    
    
