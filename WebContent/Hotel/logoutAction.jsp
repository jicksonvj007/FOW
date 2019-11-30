<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
    Document   : Insert Item
    Created on : November 16, 2019
    Author     : MANU
--%>

<%@ page import="java.util.ArrayList"%>
<%@page import="com.mvc.foodonwheels.beans.hotelbean.HotelBean"%>
<%@page import="com.mvc.foodonwheels.dao.hoteldao.HotelDAO"%>

<%@page import="java.sql.*"%>
      <%@page import="java.util.*"%>
	<% 
	session=request.getSession(false);
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma","no-cache");
    String user = (String) session.getAttribute("user");
    if (user==null || user=="") {
        response.sendRedirect("../hotelIndex.jsp?val=You are successfully logged out");
    }
   // out.print("<center><font color='green'>You are successfully logged out</font></center>"); 
	
	//request.getRequestDispatcher("index.html").include(request, response);
	
	session=request.getSession();
    session.invalidate();
    response.sendRedirect("../hotelIndex.jsp?val=You are successfully logged out");
    %>
    