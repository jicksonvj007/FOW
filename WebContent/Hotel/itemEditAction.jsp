<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%--
    Document   : Item Edit Action
    Created on : November 16, 2019
    Author     : MANU
--%>

<%@page import="com.mvc.foodonwheels.beans.hotelbean.HotelBean"%>
<%@page import="com.mvc.foodonwheels.dao.hoteldao.HotelDAO"%>
<%
	int iId = Integer.parseInt(request.getParameter("id"));
	String name = request.getParameter("name");
	int amount = Integer.parseInt(request.getParameter("amount"));

	HotelBean hotelbean = new HotelBean();
	hotelbean.setIid(iId);
	hotelbean.setItem(name);
	hotelbean.setAmount(amount);
	System.out.print(name);
	System.out.print(iId);

	int flag = HotelDAO.itemEdit(hotelbean);
	if (flag == 1) {
		response.sendRedirect("manageItem.jsp");
	} else {
		response.sendRedirect("error.html");
	}
%>