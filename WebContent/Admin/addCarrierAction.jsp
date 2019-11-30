<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- 
    Document   : add Carrier Action
    Created on : 14-11-2019
    Author     : Jickson
--%>
<%@page import="com.mvc.foodonwheels.adminBeans.CarrierBean" %>
<%@page import="com.mvc.foodonwheels.adminDAO.CarrierDAO"  %>
<%
    String cName=request.getParameter("cName");
    String cPwd=request.getParameter("cPwd");
    CarrierBean carrierBean=new CarrierBean();
    carrierBean.setCarrierName(cName);
    carrierBean.setCarrierPassword(cPwd);
    boolean flag=CarrierDAO.insertCarrier(carrierBean);
    if(flag==true){
        
        response.sendRedirect("viewCarriers.jsp");
    }
    else{
      out.println("error");
      response.sendRedirect("errorPage.jsp");
    }
%>
    