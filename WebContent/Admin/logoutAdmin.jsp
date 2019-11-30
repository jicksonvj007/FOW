<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%--
    Document   : Logout
    Created on : 17/11/2019
    Author     : Jickson
--%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
	<% 
	session=request.getSession(false);
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma","no-cache");
    String userName = (String) session.getAttribute("user");
    if (userName==null || userName=="") {
      
        response.sendRedirect("../adminIndex.jsp?val=You are successfully logged out");
    }
  
	session=request.getSession();
    session.invalidate();
   
    response.sendRedirect("../adminIndex.jsp?val=You are successfully logged out");
    %>
    
    
 