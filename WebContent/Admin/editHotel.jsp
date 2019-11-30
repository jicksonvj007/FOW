<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- 
    Document   : edit hotel
    Created on : 15-11-2019
    Author     : Jickson
--%>
<%@page import="com.mvc.foodonwheels.adminBeans.HotelBean" %>
<%@page import="com.mvc.foodonwheels.adminDAO.HotelDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="java.sql.*"%>
<%
int hId=Integer.parseInt(request.getParameter("hid"));
HotelBean hotelBean=new HotelBean();
hotelBean.setHId(hId);
ArrayList<HotelBean> al=new ArrayList<HotelBean>();
ResultSet rs=HotelDAO.getHotelDetails(hotelBean);
while(rs.next()){
	hotelBean=new HotelBean();
	hotelBean.setHId(rs.getInt(1));
	hotelBean.setHName(rs.getString(2));
	hotelBean.setHAddress(rs.getString(3));
	hotelBean.sethLocality(rs.getString(4));
	hotelBean.sethDistrict(rs.getString(5));
	hotelBean.sethPassword(rs.getString(6));
	al.add(hotelBean);
}
%>
<html><body>
<div align="right">
<a href="adminHome.jsp">BackToHome</a>
</div>
<form action="editHotelAction.jsp?hId=<%=hotelBean.getHId()%>" method="post">
 	<table border="2">
<%
for(HotelBean hb:al){
%> 	 	
 	<tr>
 		<td>NAME:</td>
 		<td><input type="text" name="hName" value="<%=hb.getHName()%>"></td>
 	</tr>
 	<tr>
 		<td>STREET_NAME:</td>
 		<td><input type="text" name="hAdd" value="<%=hb.getHAddress()%>"></td>
 	</tr> 
 	<tr>
 		<td>LOCALITY:</td>
 		<td><input type="text" name="hLoc" value="<%=hb.gethLocality()%>"></td>
 	</tr> 
 	<tr>
 		<td>DISTRICT:</td>
 		<td><input type="text" name="hDis" value="<%=hb.gethDistrict()%>"></td>
 	</tr> 	
 	<tr>
 		<td>PASSWORD:</td>
 		<td><input type="text" name="hPass" value="<%=hb.gethPassword()%>"></td>
 	</tr>	
<%
}
%> 	 	
 	<tr><td colspan="2"><input type="submit" value="save"></td></tr>
 	</table>
</form>
</body></html>