<%-- 
    Document   : order list
    Created on : November 20, 2019
    Author     : ANU
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.mvc.foodonwheels.beans.carrierBean.CarrierBean"%>
<%@page import="com.mvc.foodonwheels.dao.carrierDAO.CarrierDAO"%>
<%@page import="java.util.ArrayList"%>
<%
	String name = (String) session.getAttribute("name");
	session = request.getSession(false);
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	//String name = (String) session.getAttribute("name");
	if (name == null || name == "") {
		response.sendRedirect("../carrierIndex.jsp?val=You are successfully logged out");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>FoodOnWheels</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<link rel="stylesheet" href="css/home.css">
<body>
	<%
		//Checking session if not exists redirect to index.html

		//String name = (String) session.getAttribute("name");
	%>
	<div class="go">
		<strong><span><a href="logout.jsp">Logout</a></span></strong>
	</div>


	<%
		//String n = session.getAttribute("name").toString();
	%>
	<center>
		<h1>
			welcome
			<%=name%></h1>
	</center>
	<br>
	<div class="container">
		<h2>ORDERS LIST</h2>

		<%
			String hidden = request.getParameter("name");
			ArrayList<CarrierBean> lb = CarrierDAO.viewOrderTable(hidden);
		%>
		<table class="table" style="background-color: white">
			<thead>
				<tr>
					<th>ORDER ID</th>
					<th>HOTEL ID</th>
					<th>ITEM ID</th>
					<th>CUSTOMER ID</th>
					<th>ORDER DATE</th>
					<th>ORDER STATUS</th>
					<th>ACTION</th>
					<th>ACTION</th>
				</tr>
			</thead>
			<%
				int i = 0;
				for (CarrierBean it : lb) {
					i = i + 1;
			%>
			<tbody></tbody>
			<tr>
				<td width="12" height="20" align="center"><span
					style="font-size: 14"><%=it.getOid()%></span></td>
				<td width="43" align="center"><div align="center">
						<span style="font-size: 14"><%=it.getHid()%> </span>
					</div></td>
				<td width="43" align="center"><div align="center">
						<span style="font-size: 14"><%=it.getCid()%></span>
					</div></td>
				<td width="43" align="center"><div align="center">
						<span style="font-size: 14"><%=it.getIid()%></span>
					</div></td>
				<td width="43" align="center"><div align="center">
						<span style="font-size: 14"><%=it.getOdate()%></span>
					</div></td>
				<td width="43" align="center"><div align="center">
						<span style="font-size: 14"><%=it.getOstatus()%></span>
					</div></td>
				<td width="43" align="center"><div align="center">
						<span style="font-size: 14"><a
							href='updateStatusp.jsp?id=<%=it.getOid()%>&sts=<%=it.getOstatus()%>'>picked
								up</a></span>
					</div></td>
				<td width="43" align="center"><div align="center">
						<span style="font-size: 14"><a
							href='updateStatusd.jsp?id=<%=it.getOid()%>&sts=<%=it.getOstatus()%>'>delivered</a></span>
					</div></td>
			</tr>
			</tbody>
			<%
				}
			%>
		</table>