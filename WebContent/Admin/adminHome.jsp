<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- 
    Document   : view admin home page
    Created on : 14-11-2019
    Author     : Jickson
--%>
<%
session=request.getSession(false);
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
String userName = (String) session.getAttribute("user");
if (userName==null || userName=="") {
    response.sendRedirect("../adminIndex.jsp?val=You are successfully logged out");
}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>admin panel</title>
<link rel="stylesheet" type="text/css" href="style/admin.css">
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}
li {
  float: left;
}
li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}
li a:hover {
  background-color: #111;
}
</style>
</head>
<body class="bgpic">
<ul>
  <li><a class="active" href="adminHome.jsp">Home</a></li>
  <li><a  href="viewCustomers.jsp">Customers</a></li>
  <li><a href="viewHotels.jsp">Hotels</a></li>
  <li><a href="viewCarriers.jsp">Carriers</a></li>
  <li><a href="logoutAdmin.jsp">Logout</a></li>
</ul>
<div align="center">

<h1 style="color: red">Welcome <%=userName %></h1>
</div>
</body>
</html>