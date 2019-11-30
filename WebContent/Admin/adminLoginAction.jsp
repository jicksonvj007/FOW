<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%-- 
    Document   : Login Action
    Created on : 09-11-2019
    Author     : Jickson
	--%>
<%
    String name=request.getParameter("name");
    String pass=request.getParameter("pass");
 	out.println(""+name+pass);
    if(name.equalsIgnoreCase("admin") && pass.equalsIgnoreCase("admin") ){
        out.print("Welcom admin");
        session.setAttribute("user",name);
        response.sendRedirect("adminHome.jsp");
    }
    else{
     	out.println("Not a valid user");
    	response.sendRedirect("../adminIndex.jsp?val=Not a valid user!");
    }
%>