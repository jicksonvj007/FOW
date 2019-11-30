<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- 
    Document   : edit carrier action
    Created on : 15-11-2019
    Author     : Jickson
--%>
<%@page import="com.mvc.foodonwheels.adminBeans.CarrierBean" %>
<%@page import="com.mvc.foodonwheels.adminDAO.CarrierDAO" %>
<%
int cId=Integer.parseInt(request.getParameter("cId"));
String cName=request.getParameter("cName");
String cPass=request.getParameter("cPass");
CarrierBean carrierBean=new CarrierBean();
carrierBean.setCarrierId(cId);
carrierBean.setCarrierName(cName);
carrierBean.setCarrierPassword(cPass);
boolean flag=CarrierDAO.editCarrierActions(carrierBean);
	if(flag){
		out.println("success");
		response.sendRedirect("viewCarriers.jsp");
	}else{
		out.println("error");
	}
%>