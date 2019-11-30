<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%--
    Document   : Status Change
    Created on : November 16, 2019
    Author     : MANU
--%>

<%@page import="com.mvc.foodonwheels.beans.hotelbean.HotelBean"%>
<%@page import="com.mvc.foodonwheels.dao.hoteldao.HotelDAO"%>
<%
	int oId = Integer.parseInt(request.getParameter("oId"));
	String status = request.getParameter("status");

	HotelBean hotelBean = new HotelBean();
	hotelBean.setOid(oId);
	hotelBean.setStatus(status);

	int flag = HotelDAO.statusEdit(hotelBean);

	if (flag == 1) {
		response.sendRedirect("viewOrder.jsp");
	} else {
		response.sendRedirect("error.html");
	}
%>