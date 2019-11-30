<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- 
    Document   : edit user action
    Created on : 15-11-2019
    Author     : Jickson
--%>
<%@page import="com.mvc.foodonwheels.adminBeans.HotelBean" %>
<%@page import="com.mvc.foodonwheels.adminDAO.HotelDAO" %>
<%
int hId=Integer.parseInt(request.getParameter("hId"));
String hName=request.getParameter("hName");
String hAdd=request.getParameter("hAdd");
String hLoc=request.getParameter("hLoc");
String hDis=request.getParameter("hDis");
String hPass=request.getParameter("hPass");
HotelBean hotelBean=new HotelBean();
hotelBean.setHId(hId);
hotelBean.setHName(hName);
hotelBean.setHAddress(hAdd);
hotelBean.sethLocality(hLoc);
hotelBean.sethDistrict(hDis);
hotelBean.sethPassword(hPass);
boolean flag=HotelDAO.editHotelActions(hotelBean);
	if(flag){
		out.println("success");
		response.sendRedirect("viewHotels.jsp");
	}else{
		out.println("error");
	}
%>