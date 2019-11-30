
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%--
    Document   : Insert Item
    Created on : November 15, 2019
    Author     : MANU
--%>

<%@ page import="java.util.ArrayList"%>
<%@page import="com.mvc.foodonwheels.beans.hotelbean.HotelBean"%>
<%@page import="com.mvc.foodonwheels.dao.hoteldao.HotelDAO"%>


<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="css/itemStyle.css">
</head>
<a href=venderHome.jsp>Go back</a>


<body>
	<div class="itembox">
		
		<h1>Insert Items</h1>
		<form name="insert" action="insertItemAction.jsp" method="post">

			<p>Item Name</p>
			<input type="text" name="itemname" required="" />

			<p>Item Price</p>
			<input type="text" name="itemprice" required="" /> <input
				type="submit" name="submit" value="Add Item" />
		</form>
	</div><br><br><br><br>
</body>
<%
	ArrayList<HotelBean> lb = new ArrayList<HotelBean>();
	String user = (String) session.getAttribute("user");
	int hId = (Integer) session.getAttribute("hId");
	HotelBean hotelbean = new HotelBean();
	hotelbean.setHid(hId);

	lb = HotelDAO.itemView(hotelbean);
	int size = 0;
	size = lb.size();

	if (size == 0) {
%>
<h3 align="center">NO DATA TO SHOWN</h3>
<%
	} else {
%>
<table width="500" border="1" align="center">

	<tr>
		<td align="center">Sl.No</td>

		<td align="center">Item Name</td>

		<td align="center">Item Price</td>

		<td align="center">Action</td>

		<td align="center">Action</td>




	</tr>
	<%
		int i = 1;

			for (HotelBean it : lb) {
	%>


	<tr>
		<td width="12" height="20" align="center"><span
			style="font-size: 14"><%=i++%></span></td>
		<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getItem()%></span>
			</div></td>
		<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getAmount()%></span>
			</div></td>
		<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><a
					href="itemDelete.jsp?iId=<%=it.getIid()%>"><button>Delete</button></a></span>
			</div></td>
		<td width="43" align="center"><div align="center">
				<span style="font-size: 14"> <a
					href="itemEdit.jsp?iId=<%=it.getIid()%>&item=<%=it.getItem()%>&amount=<%=it.getAmount()%>"><button>Edit</button></a></span>
			</div></td>


	</tr>



	<%
		}

		}
	%>

</table>