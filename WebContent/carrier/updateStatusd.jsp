<%-- 
    Document   : update status
    Created on : November 20, 2019
    Author     : ANU
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.mvc.foodonwheels.beans.carrierBean.CarrierBean"%>
<%@page import="com.mvc.foodonwheels.dao.carrierDAO.CarrierDAO"%>
<%@page import="java.util.ArrayList"%>

<%
	String status = request.getParameter("sts");
	int id = Integer.parseInt(request.getParameter("id"));
	CarrierBean carrierBean = new CarrierBean();
	carrierBean.setOid(id);
	carrierBean.setOstatus(status);
	boolean flag = CarrierDAO.updateStatusd(carrierBean);
	if (flag == true) {
		response.sendRedirect("home.jsp");
	} else {
		response.sendRedirect("home.jsp");
	}
%>