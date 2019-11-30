<%-- 
    Document   : logout action
    Created on : November 20, 2019
    Author     : ANU
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.mvc.foodonwheels.beans.carrierBean.CarrierBean"%>
<%@page import="com.mvc.foodonwheels.dao.carrierDAO.CarrierDAO"%>
<%@page import="java.util.ArrayList"%>

<%
	session = request.getSession(false);
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	String name = (String) session.getAttribute("name");
	if (name == null || name == "") {
		response.sendRedirect("../carrierIndex.jsp?val=You are successfully logged out");
	}
	session = request.getSession();
	session.invalidate();
	response.sendRedirect("../carrierIndex.jsp?val=You are successfully logged out");
%>



