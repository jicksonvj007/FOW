<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%-- 
    Document   : Delete carrier
    Created on : 13-11-2019
    Author     : Jickson
	--%>
<%@page import="com.mvc.foodonwheels.adminBeans.CarrierBean"%>
<%@page import="com.mvc.foodonwheels.adminDAO.CarrierDAO"%>
<%
	int carrierId=Integer.parseInt(request.getParameter("cid"));
	CarrierBean carrierBean=new CarrierBean();
	carrierBean.setCarrierId(carrierId);
	boolean flag=CarrierDAO.deleteCarrier(carrierBean);
	if(flag){
		out.println("success");
		response.sendRedirect("viewCarriers.jsp");
	}else{
		out.println("error");
	}
%>