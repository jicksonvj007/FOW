<%-- 
    Document   : check user login
    Created on : November 20, 2019
    Author     : ANU
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.mvc.foodonwheels.beans.carrierBean.CarrierBean" %>
<%@page import="com.mvc.foodonwheels.dao.carrierDAO.CarrierDAO" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<body class="wrong">
	<title>FoodOnWheels</title>
</head>
<link rel="stylesheet" href="css/check.css">

<%
	String name = request.getParameter("name");
	String pswd = request.getParameter("pswd");
	CarrierBean carrierBean = new CarrierBean();
	carrierBean.setName(name);
	carrierBean.setPswd(pswd);
	ResultSet rs = CarrierDAO.check(carrierBean);
	if (rs.next()) {
		session.setAttribute("name", name);
		response.sendRedirect("home.jsp");
	} else {
%>
<div class="out">
	<strong><h1>INVALID USER</h1></strong>
</div>
<div class="go">
	<strong><span><a href="../carrierIndex.jsp">Back to Home</a></span></strong>
</div>
</body>

</html>

<%
	}
%>
