<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- 
    Document   : edit carrier
    Created on : 14-11-2019
    Author     : Jickson
--%>
<%@page import="com.mvc.foodonwheels.adminBeans.CarrierBean" %>
<%@page import="com.mvc.foodonwheels.adminDAO.CarrierDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="java.sql.*"%>
<%
int cId=Integer.parseInt(request.getParameter("cid"));
CarrierBean carrierBean=new CarrierBean();
carrierBean.setCarrierId(cId);
ArrayList<CarrierBean> al=new ArrayList<CarrierBean>();
ResultSet rs=CarrierDAO.getCarrierDetails(carrierBean);
while(rs.next()){
	carrierBean=new CarrierBean();
	carrierBean.setCarrierId(rs.getInt(1));
	carrierBean.setCarrierName(rs.getString(2));
	carrierBean.setCarrierPassword(rs.getString(3));
	al.add(carrierBean);
}
%>
<html><body>
<div align="right">
<a href="adminHome.jsp">BackToHome</a>
</div>
<form action="editCarrierAction.jsp?cId=<%=carrierBean.getCarrierId()%>" method="post">
 	<table border="2">
<%
for(CarrierBean cb:al){
%> 	 	
 	<tr>
 		<td>Name:</td>
 		<td><input type="text" name="cName" value="<%=cb.getCarrierName()%>"></td>
 	</tr>
 	<tr>
 		<td>Password:</td>
 		<td><input type="text" name="cPass" value="<%=cb.getCarrierPassword()%>"></td>
 	</tr>
<%
}
%> 	 	
 	<tr><td colspan="2"><input type="submit" value="save"></td></tr>
 	</table>
</form>
</body></html>