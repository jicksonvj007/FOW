<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
    Document   : Login Action
    Created on : November 15, 2019
    Author     : MANU
--%>

<%@page import="com.mvc.foodonwheels.beans.hotelbean.HotelBean"%>
<%@page import="com.mvc.foodonwheels.dao.hoteldao.HotelDAO"%>


<%
	String user = request.getParameter("user");
	String pass = request.getParameter("pswrd");
	HotelBean hotelbean = new HotelBean();
	hotelbean.setUser(user);
	hotelbean.setPass(pass);
	
	int id = HotelDAO.takeId(hotelbean);
	
	int count = HotelDAO.check(hotelbean);
	out.print("count"+count);
	if (count > 0) {

		session.setAttribute("user", user);
		session.setAttribute("hId", id);

		response.sendRedirect("venderHome.jsp");

	} else {

		response.sendRedirect("error.html");
	}
%>