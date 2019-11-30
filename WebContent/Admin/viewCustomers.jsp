<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%-- 
    Document   : user view
    Created on : 15-10-2019
    Author     : Jickson
	--%>
	<%@page import="com.mvc.foodonwheels.adminDAO.CustomerDAO"%>
	<%@page import="com.mvc.foodonwheels.adminBeans.CustomerBean" %>
	
	<%@ page import="java.util.ArrayList" %> 
	<%@page import="java.sql.*"%>
<div align="right">
<a href="adminHome.jsp">BackToHome</a>
</div>
<div style="margin-top: -38px;">
<a href="viewSuccessfulOrders.jsp"><h2>Todays Orders Report</h2></a>
</div>

<%
ArrayList<CustomerBean> al=new ArrayList<CustomerBean>();
ResultSet rs=CustomerDAO.viewConsumers();
while(rs.next()){
	CustomerBean cBean=new CustomerBean();
	cBean.setCId(rs.getInt(1));
	cBean.setCName(rs.getString(2));
	cBean.setCEmail(rs.getString(3));
	cBean.setCPassword(rs.getString(5));
	cBean.setCAddress(rs.getString(7));
	cBean.setCMobile(rs.getString(4));
	al.add(cBean);
}

 int size=0;
 size=al.size();
 if(size==0){
%>
    	  <h3 align="center">NO DATA TO SHOWN</h3>
<%
 }else {  
%>
      <table width="500" align="center" border="1px" style="border-color: #d425b6;BACKGROUND-COLOR: LIGHTGOLDENRODYELLOW;">

<tr border-bottom="2px solid #4b30dc">
	<th align="center">No</th>
	<th align="center">Customer_NAME</th>	
    <th align="center">Customer_EMAIL</th> 
    <th align="center">Customer_ADDRESS</th> 
    <th align="center">Customer_MOBILE</th> 
    <th align="center">Remove_Customer</th> 
   <!--   <th align="center">C_ACTION</th>  -->
    <th align="center">Total_Orders</th> 
</tr>
    <% 
     
    int i=1;
 	for(CustomerBean it:al){
 				
    %>
    
    <tr >
    <td width="12" height="20" align="center"><span style="font-size: 14"><%=i%></span></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getCName()%> </span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getCEmail()%></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getCAddress()%></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getCMobile()%></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><a href="deleteCustomer.jsp?uId=<%=it.getCId()%>">delete</a></span></div></td>
	<!-- <td width="43" align="center"><div align="center" ><span style="font-size: 14"><a href="editCustomer.jsp?uid=<%=it.getCId()%>" >edit</a></span></div></td>   -->
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><a href="reportCustomer.jsp?uid=<%=it.getCId()%>" >details</a></span></div></td>
	</tr>  
  <%
   i++; } 
  }
  %>

</table>
