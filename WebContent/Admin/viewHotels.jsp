<%@page import="java.awt.Image"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%-- 
    Document   : user view
    Created on : 13-10-2019
    Author     : Jickson
	--%>
<%@page import="com.mvc.foodonwheels.adminBeans.HotelBean" %>
<%@page import="com.mvc.foodonwheels.adminDAO.HotelDAO" %>
<%@ page import="java.util.ArrayList" %> 
<%@page import="java.sql.*"%>
<div align="right">
<a href="adminHome.jsp">BackToHome</a>
</div>
<%
ArrayList<HotelBean> al=new ArrayList<HotelBean>();
ResultSet rs=HotelDAO.viewHotel();
while(rs.next()){
	HotelBean hotelBean=new HotelBean();
	hotelBean.setHId(rs.getInt(1));
	hotelBean.setHName(rs.getString(2));
	hotelBean.setHAddress(rs.getString(3));
	hotelBean.sethLocality(rs.getString(4));
	hotelBean.sethDistrict(rs.getString(5));
	al.add(hotelBean);
}

 int size=0;
 size=al.size();
 if(size==0){%>
    	  <h3 align="center">NO DATA TO SHOWN</h3>
 <%
 }else {  
 %>
      <table width="500" border="1"  align="center" style="border-color: #d425b6;BACKGROUND-COLOR: LIGHTGOLDENRODYELLOW;">

<tr>
	<th align="center">No</th>
	<th align="center">NAME</th>	
    <th align="center">STREET_NAME</th> 
    <th align="center">LOCALITY</th>
    <th align="center">DISTRICT</th>
    <th align="center">Action</th>
    <th align="center">Action</th>
</tr>
    <% 
     
    int i=1;
 	for(HotelBean it:al){
 				
    %>
    
    <tr><td width="12" height="20" align="center"><span style="font-size: 14"><%=i%></span></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getHName()%> </span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getHAddress()%></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.gethLocality()%></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.gethDistrict()%></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><a href="deleteHotel.jsp?hid=<%=it.getHId()%>">delete</a></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><a href="editHotel.jsp?hid=<%=it.getHId()%>" >edit</a></span></div></td>
	</tr>  
  <%
   i++; } 
  }
  %>
</table>
<div align="center">
<h3>ADD New Hotel</h3>
</div>
<form action="addHotelAction.jsp" method="post">
<table border=2px align="center">
<tr>
 		<td>NAME:</td>
 		<td><input type="text" name="hName" required></td>
 	</tr>
 	<tr>
 		<td>STREET_NAME:</td>
 		<td><input type="text" name="hAdd" required></td>
 	</tr> 
 	<tr>
 		<td>LOCALITY:</td>
 		<td><input type="text" name="hLoc" required></td>
 	</tr> 
 	<tr>
 		<td>DISTRICT:</td>
 		<td><input type="text" name="hDis" required></td>
 	</tr> 	
 	<tr>
 		<td>PASSWORD:</td>
 		<td><input type="text" name="hPass" required></td>
 	</tr>
 	<tr><td colspan="2"><input type="submit" value="ADD"></td></tr>
 	</table>
</form>
