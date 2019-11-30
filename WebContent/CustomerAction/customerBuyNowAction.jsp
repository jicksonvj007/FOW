<%@page import="com.mvc.foodonwheels.dao.customerdao.CustomerTotalOrderDao"%>
<%@page import="com.mvc.foodonwheels.beans.customerbean.CustomerTotalOrderBean"%>
<%@page import="com.mvc.foodonwheels.beans.customerbean.CustomerPlaceOrderBean"%>
<%@page import="com.mvc.foodonwheels.dao.customerdao.CustomerAddToCartDao"%>
<%@page import="com.mvc.foodonwheels.beans.customerbean.CustomerAddToCartBean"%>
<%@page import="com.mvc.foodonwheels.dao.customerdao.CustomerPlaceOrderDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
int customer_id=Integer.parseInt(request.getParameter("customer_id"));
int total=Integer.parseInt(request.getParameter("total"));
int count=Integer.parseInt(request.getParameter("count"));
CustomerTotalOrderBean customerTotalOrderBean=new CustomerTotalOrderBean();
customerTotalOrderBean.setCustomerId(customer_id);
customerTotalOrderBean.setTorderCount(count);
customerTotalOrderBean.setTorderPrice(total);

CustomerTotalOrderDao customerTotalOrderDao=new CustomerTotalOrderDao();
customerTotalOrderDao.insertCpmpleteOrderData(customerTotalOrderBean); //optional tb_customer_total_order

CustomerAddToCartBean customerAddToCartBean = new CustomerAddToCartBean();
CustomerAddToCartDao customerAddToCartDao=new CustomerAddToCartDao();
customerAddToCartBean.setCustomerId(customer_id);
ArrayList<CustomerAddToCartBean> cartList = (ArrayList<CustomerAddToCartBean>) customerAddToCartDao
		.selectFromCartData(customerAddToCartBean);

CustomerPlaceOrderBean customerPlaceOrderBean=new CustomerPlaceOrderBean();
CustomerPlaceOrderDao customerPlaceOrderDao=new CustomerPlaceOrderDao();
for(CustomerAddToCartBean cart:cartList){
	customerPlaceOrderBean.setCustomerId(cart.getCustomerId());
	customerPlaceOrderBean.setHotelId(cart.getHotelId());
	customerPlaceOrderBean.setItemId(cart.getItemId());
	customerPlaceOrderBean.setItemPrice(cart.getItemPrice());
	boolean flag=customerPlaceOrderDao.insertToOrdersData(customerPlaceOrderBean);
}
boolean f=customerAddToCartDao.deleteAllItemsOfaUserFromCartData(customerAddToCartBean);
if(f){
	session.setAttribute("order_placed", "Placed");
}
response.sendRedirect("../CustomerMain/customerOrderPlaced.jsp");
%>