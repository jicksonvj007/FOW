<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%--
    Document   : Edit Item
    Created on : November 16, 2019
    Author     : MANU
--%>

<%@page import="com.mvc.foodonwheels.beans.hotelbean.HotelBean"%>
<%@page import="com.mvc.foodonwheels.dao.hoteldao.HotelDAO"%>

<%
	String id = request.getParameter("iId");
	String name = request.getParameter("item");
	String amount = request.getParameter("amount");
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="css/editStyle.css">

</head>

<body>
	<form name="insert" action="itemEditAction.jsp" method="post">

		<div class="loginbox">
			<h1>Edit Details</h1>

			<p>Item Name</p>
			<input type="text" name="name" value=<%=name%> required="" />

			<p>Item Price</p>
			<input type="text" name="amount" value="<%=amount%>" required="" />
			<input type="hidden" name="id" value="<%=id%>"> <input
				type="submit" name="submit" value="Update" />
		</div>
	</form>

</body>



</head>
</html>
