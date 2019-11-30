<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%-- 
    Document   : user view
    Created on : 15-10-2019
    Author     : Jickson
	--%>
<%@page import="com.mvc.foodonwheels.adminBeans.CarrierBean" %>
<%@page import="com.mvc.foodonwheels.adminDAO.CarrierDAO"%>
<%@ page import="java.util.ArrayList" %> 
<%@page import="java.sql.*"%>
<div align="right">
<a href="adminHome.jsp">BackToHome</a>
</div>
<%
ArrayList<CarrierBean> al=new ArrayList<CarrierBean>();
ResultSet rs=CarrierDAO.viewCarrier();
while(rs.next()){
	CarrierBean carrierBean=new CarrierBean();
	carrierBean.setCarrierId(rs.getInt(1));
	carrierBean.setCarrierName(rs.getString(2));
	carrierBean.setCarrierPassword(rs.getString(3));
	al.add(carrierBean);
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
	<th align="center">Name</th>	
    <th align="center">Password</th> 
    <th align="center">Action</th>
    <th align="center">Action</th>
</tr>
    <% 
     
    int i=1;
 	for(CarrierBean it:al){
 				
    %>
    
    <tr><td width="12" height="20" align="center"><span style="font-size: 14"><%=i%></span></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getCarrierName()%> </span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getCarrierPassword()%></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><a href="deleteCarrier.jsp?cid=<%=it.getCarrierId()%>">delete</a></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><a href="editCarrier.jsp?cid=<%=it.getCarrierId()%>" >edit</a></span></div></td>
	</tr>  
  <%
   i++; } 
  }
  %>
</table>
<div align="center">
<h3>ADD New CARRIER</h3>
</div>
<form action="addCarrierAction.jsp" method="post">
<table border=2px align="center">
<tr>
 		<td>Name:</td>
 		<td><input type="text" name="cName" required></td>
 	</tr>
 	<tr>
 		<td>Password:</td>
 		<td><input type="text" name="cPwd" required></td>
 	</tr> 	
 	<tr><td colspan="2"><input type="submit" value="ADD"></td></tr>
 	</table>
</form>
    