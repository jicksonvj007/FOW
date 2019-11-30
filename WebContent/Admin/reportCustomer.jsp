<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%-- 
    Document   : user order view
    Created on : 16-10-2019
    Author     : Jickson
	--%>

	<%@page import="com.mvc.foodonwheels.adminDAO.OrderDAO" %>
	<%@page import="com.mvc.foodonwheels.adminBeans.OrderCustomerBean" %>
	<%@page import="java.util.List" %>
	<%@page import="java.util.ArrayList"%>
	<%@page import="java.sql.*"%>
<div align="right">
<a href="adminHome.jsp">BackToHome</a>
</div>
<%
    int cid=Integer.parseInt(request.getParameter("uid"));
	OrderCustomerBean orderCustomerBean=new OrderCustomerBean();
	orderCustomerBean.setcId(cid);
	
	//out.print(cid);
	ArrayList<OrderCustomerBean> al=new ArrayList<OrderCustomerBean>();
ResultSet rs=OrderDAO.viewOrderDetails(orderCustomerBean);
while(rs.next()){
	OrderCustomerBean OCBean=new OrderCustomerBean();
	OCBean.setcName(rs.getString(1));
	OCBean.setcEmail(rs.getString(2));
	OCBean.setoStatus(rs.getString(3));
	al.add(OCBean);
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
	<th align="center">Customer_NAME</th>	
    <th align="center">Customer_EMAIL</th> 
    <th align="center">Order_STATUS</th> 
</tr>
    <% 
     
    int i=1;
 	for(OrderCustomerBean it:al){
 				
    %>
    
    <tr><td width="12" height="20" align="center"><span style="font-size: 14"><%=i%></span></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getcName()%> </span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getcEmail()%></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getoStatus()%></span></div></td>
	</tr>  
  <%
   i++; } 
  }
  %>

</table>