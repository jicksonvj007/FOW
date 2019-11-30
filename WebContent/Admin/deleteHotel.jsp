<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%-- 
    Document   : Delete hotel
    Created on : 13-11-2019
    Author     : Jickson
	--%>
<%@page import="com.mvc.foodonwheels.adminBeans.HotelBean" %>
<%@page import="com.mvc.foodonwheels.adminDAO.HotelDAO" %>
<%
	int hId=Integer.parseInt(request.getParameter("hid"));
	HotelBean hotelBean=new HotelBean();
	hotelBean.setHId(hId);
	boolean flag=HotelDAO.deleteHotel(hotelBean);
	if(flag){
		out.println("success");
		response.sendRedirect("viewHotels.jsp");
	}else{
		out.println("error");
	}
%>