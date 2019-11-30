<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%-- 
    Document   : Delete customer
    Created on : 11-11-2019
    Author     : Jickson
	--%>
<%@page import="com.mvc.foodonwheels.adminDAO.CustomerDAO"%>
	<%@page import="com.mvc.foodonwheels.adminBeans.CustomerBean" %>
	int uId=Integer.parseInt(request.getParameter("uId"));
	CustomerBean customerBean=new CustomerBean();
	customerBean.setCId(uId);
	boolean flag=CustomerDAO.deleteCustomer(customerBean);
	if(flag){
		out.println("success");
		response.sendRedirect("viewCustomers.jsp");
	}else{
		out.println("error");
	}
%>