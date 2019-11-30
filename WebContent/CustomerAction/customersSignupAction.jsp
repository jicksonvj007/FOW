<%@page import="com.mvc.foodonwheels.dao.customerdao.CustomerSigninDao"%>
<%@page import="com.mvc.foodonwheels.beans.customerbean.CustomerSigninBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String name=request.getParameter("name");
String phone=request.getParameter("phone");
String uemail=request.getParameter("uemail");
String housename=request.getParameter("housename");
String pincode=request.getParameter("pincode");
String username=request.getParameter("username");
String passwordd=request.getParameter("passwordd");

CustomerSigninBean customerSigninBean=new CustomerSigninBean();
CustomerSigninDao dao=new CustomerSigninDao();
customerSigninBean.setName(name);
customerSigninBean.setPhone(phone);
customerSigninBean.setUemail(uemail);
customerSigninBean.setHousename(housename);
customerSigninBean.setPincode(pincode);
customerSigninBean.setUsername(username);
customerSigninBean.setPasswordd(passwordd);
boolean flag=dao.insertUserData(customerSigninBean);
if(flag){
	response.sendRedirect("../CustomerMain/customerRegistrationSuccess.html");
}else{
	response.sendRedirect("../CustomerMain/customerRegistrationFailed.html");
}
%>