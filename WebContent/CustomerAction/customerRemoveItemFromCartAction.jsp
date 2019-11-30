<%@page import="com.mvc.foodonwheels.dao.customerdao.CustomerAddToCartDao"%>
<%@page import="com.mvc.foodonwheels.beans.customerbean.CustomerAddToCartBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
//int id=Integer.parseInt(request.getParameter("item_id"));
//int customer_id=(Integer)session.getAttribute("customer_id");

int cartId=Integer.parseInt(request.getParameter("cId"));
out.print("cid....:"+cartId);

CustomerAddToCartBean customerAddToCartBean=new CustomerAddToCartBean();
//customerAddToCartBean.setItemId(id);
//customerAddToCartBean.setCustomerId(customer_id);
customerAddToCartBean.setCartId(cartId);

CustomerAddToCartDao customerAddToCartDao=new CustomerAddToCartDao();
boolean flag=customerAddToCartDao.deleteItemFromCartData(customerAddToCartBean);
response.sendRedirect("../CustomerMain/customerViewCart.jsp");
%>