<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%--
    Document   : Item Insert Action
    Created on : November 16, 2019
    Author     : MANU
--%>


<%@page import="com.mvc.foodonwheels.beans.hotelbean.HotelBean"%>
<%@page import="com.mvc.foodonwheels.dao.hoteldao.HotelDAO"%>

<%
	String user = (String) session.getAttribute("user");
	String item = request.getParameter("itemname");
	int hId = (Integer) session.getAttribute("hId");
	int amount = Integer.parseInt(request.getParameter("itemprice"));

	HotelBean hotelbean = new HotelBean();

	hotelbean.setItem(item);
	hotelbean.setAmount(amount);
	hotelbean.setHid(hId);

	int flag = HotelDAO.item(hotelbean);
	if (flag == 1) {

		response.sendRedirect("manageItem.jsp");
	}
%>