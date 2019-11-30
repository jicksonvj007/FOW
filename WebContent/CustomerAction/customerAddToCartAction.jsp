<%@page import="java.util.Calendar"%>
<%@page import="com.mvc.foodonwheels.dao.customerdao.CustomerAddToCartDao"%>
<%@page import="com.mvc.foodonwheels.beans.customerbean.CustomerAddToCartBean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int itemId=Integer.parseInt(request.getParameter("itemId"));
	int hotelId=Integer.parseInt(request.getParameter("hotelId"));
	int customerId=(Integer)session.getAttribute("customer_id");
	CustomerAddToCartBean customerAddToCartBean=new CustomerAddToCartBean();
	customerAddToCartBean.setItemId(itemId);
	customerAddToCartBean.setHotelId(hotelId);
	customerAddToCartBean.setCustomerId(customerId);
	CustomerAddToCartDao customerAddToCartDao=new CustomerAddToCartDao();
	boolean flag=customerAddToCartDao.insertToCartData(customerAddToCartBean);
	if(flag){
		System.out.println("Successfully Added to cart...");
	}else{
		System.out.println("Failed Adding to cart....");
	}
%>